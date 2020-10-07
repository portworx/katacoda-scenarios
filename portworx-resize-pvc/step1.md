</br>

##### The volume mounted on the pod `web-0` seems to be running out of space. Inspect it!



`kubectl exec web-0 -- df -hP /usr/share/nginx/html`{{execute}}



###### Manually resize this PVC `www-web-0` to 8GiB.
