</br>

##### Create a new group volume snapshot called `mongodb-3d-snapshot` which makes use of the pre and snapshot rules `mongodb-presnap-rule` and `mongodb-postsnap-rule`, and uses a `pvcSelector` targeting the label `app=mongo`.


###### Spec:

    pvcSelector: app=mongo
    pre-snapshot rule: mongodb-presnap-rule
    post-snapshot rule: mongodb-postsnap-rule
