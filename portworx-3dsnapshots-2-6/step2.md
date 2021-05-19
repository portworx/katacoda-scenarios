</br>

##### Create a pre-snapshot rule called `mysql-presnap-rule` with the below specifications:


###### Rules:


    Pod Selector:app=mysql,
    type: command,
    background: true,
    value: mysql --user=root --password=$MYSQL_ROOT_PASSWORD
    -Bse 'flush tables with read lock;system ${WAIT_CMD};'
