var mysql = require('../database');
mysql.query("select * from user",function(err,list){
	 if(err){
        console.log("[query query]:"+err)
        return;
   	 }
    console.log("THE:"+JSON.stringify(list));
});