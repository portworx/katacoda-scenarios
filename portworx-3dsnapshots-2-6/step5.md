</br>

##### Create a pre-snapshot rule called `mongodb-postsnap-rule` with the below specifications:


###### Rules:

    Pod Selector:role=mongo
    type: command
    value: mongo --eval "printjson(db.fsyncUnLock())"
