var routes = require('./index');
var express = require('express');
var router = express.Router();
module.exports = function(app) {

	app.use('/', function(){
		router.get('/', function(req, res) {
		  res.render('index');
		  console.log("test2");
		  res.end();
		});
	});
	console.log("hello");
	app.use('/home', routes);
}
