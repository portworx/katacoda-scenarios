#!/bin/bash

TALISMAN_IMAGE=portworx/talisman
TALISMAN_TAG=1.1.0
WIPE_CLUSTER="--wipecluster"
MAX_RETRIES=60
TIME_BEFORE_RETRY=5 #seconds
JOB_NAME=talisman
KUBECTL_EXTRA_OPTS=""
WIPER_IMAGE=portworx/px-node-wiper
WIPER_TAG=2.5.0

usage()
{
	echo "
	usage:  curl https://install.portworx.com/px-wipe | bash -s [-- [-wi <wiper-image>] [-wt <wiper-tag>] [-S | --skipmetadata] ]
	examples:
            # Along with deleting Portworx Kubernetes components, also wipe Portworx cluster metadata
            curl https://install.portworx.com/px-wipe | bash -s -- --skipmetadata
      "
}

fatal() {
  echo "" 2>&1
  echo "$@" 2>&1
  exit 1
}

# derived from https://gist.github.com/davejamesmiller/1965569
ask() {
  # https://djm.me/ask
  local prompt default reply
  if [ "${2:-}" = "Y" ]; then
    prompt="Y/n"
    default=Y
  elif [ "${2:-}" = "N" ]; then
    prompt="y/N"
    default=N
  else
    prompt="y/n"
    default=
  fi

  # Ask the question (not using "read -p" as it uses stderr not stdout)<Paste>
  echo -n "$1 [$prompt]:"

  # Read the answer (use /dev/tty in case stdin is redirected from somewhere else)
  read reply </dev/tty
  if [ $? -ne 0 ]; then
    fatal "ERROR: Could not ask for user input - please run via interactive shell"
  fi

  # Default? (e.g user presses enter)
  if [ -z "$reply" ]; then
    reply=$default
  fi

  # Check if the reply is valid
  case "$reply" in
    Y*|y*) return 0 ;;
    N*|n*) return 1 ;;
    * )    echo "invalid reply: $reply"; return 1 ;;
  esac
}

FORCE_DELETE="false"
while [ "$1" != "" ]; do
    case $1 in
        -I | --talismanimage ) shift
                                TALISMAN_IMAGE=$1
                                ;;
        -T | --talismantag )   shift
                                TALISMAN_TAG=$1
                                ;;
        -wi | --wiperimage ) shift
                                WIPER_IMAGE=$1
                                ;;
        -wt | --wipertag )   shift
                                WIPER_TAG=$1
                                ;;
        -S | --skipmetadata )   WIPE_CLUSTER=""
                                ;;
        -f | --force )          FORCE_DELETE="true"
                                ;;
        -h | --help )           usage
                                ;;
        * )                     usage
    esac
    shift
done

command -v oc
if [ $? -eq 0 ]; then
  _out=$(command -v oc 2>&1 && oc version 2>&1)
  if [ $? -eq 0 ]; then
    echo "Detected OpenShift system. Adding talisman-account user to privileged scc"
    oc adm policy add-scc-to-user privileged system:serviceaccount:kube-system:talisman-account
    if [ $? -ne 0 ]; then
      fatal "failed to add talisman-account to privileged scc. exit code: $?"
    fi
  else
    echo "oc binary found but oc version command failed. Not using OpenShift mode."
  fi
fi

VER=$(kubectl version --short | awk -Fv '/Server Version: /{print $3}')
if [ -z "$VER" ]; then
	fatal "failed to get kubernetes server version. Make sure you have kubectl setup on current machine."
fi


VER=( ${VER//./ } )
echo "Parsed version is "${VER[0]}.${VER[1]}""

if [ "${VER[0]}.${VER[1]}" == "1.7" ] || [ "${VER[0]}.${VER[1]}" == "1.6" ]; then
  fatal "This script doesn't support wiping Portworx from Kubernetes $VER clusters. Refer to https://docs.portworx.com/scheduler/kubernetes/install.html for instructions"
fi

CLIENT_VER=$(kubectl version --short | awk -Fv '/Client Version: /{print $2}')
if [ -z "$CLIENT_VER" ]; then
  fatal "failed to get kubernetes client version. Make sure you have kubectl setup on current machine."
fi

CLIENT_VERI=$(echo $CLIENT_VER | awk -F. '{print $1*100+$2}')
echo "Parsed client version (int) is ${CLIENT_VERI}"
if [ $CLIENT_VERI -lt 114 ]; then
  KUBECTL_EXTRA_OPTS="--show-all"
else
  KUBECTL_EXTRA_OPTS=""
fi

kubectl delete -n kube-system job talisman 2>/dev/null || true

RETRY_CNT=0
while true; do
  PODS=$(kubectl get pods -n kube-system -l name=$JOB_NAME $KUBECTL_EXTRA_OPTS 2>/dev/null)
  if [ $? -eq 0 ]; then
    NUM_PODS=$(echo -n "$PODS" | grep -c -v NAME)
    if [ $NUM_PODS -eq 0 ]; then
      break
    fi
  fi

  RETRY_CNT=$((RETRY_CNT+1))
  if [ $RETRY_CNT -ge $MAX_RETRIES ]; then
    fatal "failed to delete old talisman pods"
  fi

  sleep $TIME_BEFORE_RETRY
done


cat <<EOF | kubectl apply -f -
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: talisman-account
  namespace: kube-system
---
kind: ClusterRoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: talisman-role-binding
subjects:
- kind: ServiceAccount
  name: talisman-account
  namespace: kube-system
roleRef:
  kind: ClusterRole
  name: cluster-admin
  apiGroup: rbac.authorization.k8s.io
---

apiVersion: batch/v1
kind: Job
metadata:
  name: $JOB_NAME
  namespace: kube-system
spec:
  backoffLimit: 1
  template:
    metadata:
      labels:
        name: $JOB_NAME
    spec:
      serviceAccount: talisman-account
      containers:
      - name: $JOB_NAME
        image: $TALISMAN_IMAGE:$TALISMAN_TAG
        args: ["-operation",
               "delete",
               "$WIPE_CLUSTER",
               "-wiperimage",
               "$WIPER_IMAGE",
               "-wipertag",
               "$WIPER_TAG"]
        imagePullPolicy: Always
        volumeMounts:
        - name: etcpwx
          mountPath: /etc/pwx
      volumes:
      - name: etcpwx
        hostPath:
          path: /etc/pwx
      restartPolicy: Never
EOF

echo "Talisman job for wiping Portworx started. Monitor logs using: 'kubectl logs -n kube-system -l job-name=talisman'"

NUM_DESIRED=1
RETRY_CNT=0
while true; do
  NUM_SUCCEEDED=0
  NUM_FAILED=0
  PODS=$(kubectl get pods -n kube-system -l name=$JOB_NAME 2>/dev/null)
  if [ $? -eq 0 ]; then
    CREATING=$(echo "$PODS" | grep ContainerCreating)
    if [ ! -z "$CREATING" ]; then
      echo "Pod that will perform wipe of Portworx is still in container creating phase"
    else
      NUM_FAILED=$(kubectl get job -n kube-system talisman $KUBECTL_EXTRA_OPTS -o jsonpath='{.status.failed}' 2>/dev/null)
      if [ $? -eq 0 ]; then
        if [ ! -z "$NUM_FAILED" ] && [ $NUM_FAILED -ge 1 ]; then
          kubectl logs -n kube-system -l name=$JOB_NAME
          fatal "Job to wipe px cluster failed."
        fi
      fi

      NUM_SUCCEEDED=$(kubectl get job -n kube-system talisman $KUBECTL_EXTRA_OPTS -o jsonpath='{.status.succeeded}' 2>/dev/null)
      if [ ! -z "$NUM_SUCCEEDED" ] && [ $NUM_SUCCEEDED -eq $NUM_DESIRED ]; then
        break
      fi

      echo "waiting on $JOB_NAME to complete..."
      RUNNING_POD=$(echo "$PODS" | grep Running | awk '/^talisman/{print $1}')
      if [ ! -z "$RUNNING_POD" ]; then
        echo "Monitoring logs of pod: $RUNNING_POD"
        kubectl logs -n kube-system -f $RUNNING_POD
      fi
    fi
  fi

  RETRY_CNT=$((RETRY_CNT+1))
  if [ $RETRY_CNT -ge $MAX_RETRIES ]; then
    kubectl logs -n kube-system -l name=$JOB_NAME
    fatal "Timed out trying to wipe Portworx cluster."
  fi

  sleep $TIME_BEFORE_RETRY
done

echo "Portworx cluster wipe succesfully completed."
_rc=0
kubectl delete job -n kube-system talisman                    || _rc=$?
kubectl delete serviceaccount -n kube-system talisman-account || _rc=$?
kubectl delete clusterrolebinding talisman-role-binding       || _rc=$?
kubectl delete crd volumeplacementstrategies.portworx.io
if [ $_rc -ne 0 ]; then
   fatal "error cleaning up pods"
fi