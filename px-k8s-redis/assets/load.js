var redis = require('redis');
var client = redis.createClient(6379, process.env.REDISHOST); //creates a new client. Defaults to 127.0.0.1 and 6379


// import build in 'path' module , helper module in path manipulation and concatention
var path = require('path');


// Load FileSystem built in Module to can read from hard disk
var fs = require('fs');

// path.join it like  DIRECTORY_SEPERATOR in PHP Langauge
var fileName = path.join(__dirname,"questions.csv");


var csv = require('csv-parser')
let arrayOfRows = [];

// Read From Hard Disk File and PIPE output to CSV lib to can convert CSV data into JAVASCRIPT Object
fs.createReadStream(fileName)
  .pipe(csv())
  // this event with name 'data' will be fired for each row in CSV
  .on('data', function (row) {
    arrayOfRows.push(row);
    // this event will be fired when complete read and convert csv file into javascript data.
  }).on('end',function(){

    if(arrayOfRows.length){
      // Save each row as HashMap with Title as key
      arrayOfRows.forEach(row=>{
        client.hset(row.Title, "Votes",row[Object.keys(row)[0]] , redis.print);
        client.hset(row.Title, "Answers",row.Answers , redis.print);
        client.hset(row.Title, "Views",row.Views , redis.print);
        client.hset(row.Title, "Title",row.Title , redis.print);
        client.hset(row.Title, "Description",row.Description , redis.print);
        client.hset(row.Title, "Tag",row.Tag , redis.print);
        client.hset(row.Title, "Date",row.Date , redis.print);
        client.hset(row.Title, "User",row.User , redis.print);
      })
    }



    arrayOfRows.forEach(row=>{
      // Get All rows using Title 'key'
      client.hkeys(row.Title,(err,keys)=>{
        // Get All Title's Keys
        keys.forEach(function (key, i) {
          console.log(key);
            // Foreach key get value ..
            client.hget(row.Title,key,(err,data)=>{
              console.log(data);
            });
        });
      });
    });

    setTimeout(()=>{
      client.quit();
    },0);

  })
