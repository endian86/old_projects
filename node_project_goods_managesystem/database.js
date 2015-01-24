/**
 * 封装mysql pool和基本操作
 */


//var poolModule = require('generic-pool');
var mysql = require('mysql');
var util = require('util');
//var log = require('log4js').logger('mysql');


console.log("init pool start..");

var pool = mysql.createPool({
    host:"localhost",
    user:"root",
    password:"",
    database:"project",
    port:3306
    //debug:true
});

console.log("init pool end....");
exports.query = function(sql, data, callback) {
     console.log("sql:"+sql);
    if (Array.isArray(data)) {
        pool.getConnection(function(err, client) {// query有三个参数，分别是sql(prepared),参数,callback
            if (err) {
            	if(callback){
            		callback(err);
            	}
                return;
            }
            client.query(sql, data, function(err, rows) {
                client.release();
                if(err){
                    console.log(err);
                    if(callback){
                    	callback(err, null);
                    }
                    return;
                }
                if(callback){
                	callback(err, rows);// 必须有callback
                }
            });
        });
    }
    else {
    	pool.getConnection(function(err, client) {// query有2个参数，分别是sql,callback
            if (err) {
            	if(data){
            		data(err);
            	}
                return;
            }
            client.query(sql, function(err, rows) {
            	client.release();
                if(err){
                    console.log(err);
                    if(data){
                    	data(err, null);
                    }
                    return;
                }
                if(data){
                	data(err, rows);// 必须有
                }
            });
        });
    }
};