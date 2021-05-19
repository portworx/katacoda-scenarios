</br>

##### Create a pre-snapshot rule called `mongodb-presnap-rule` with the below specifications:


###### Rules:

    Pod Selector:role=mongo
    type: command
    value: mongo --eval "printjson(db.fsyncLock())"
