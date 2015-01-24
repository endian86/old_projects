var express = require('express');
var router = express.Router();
var data_module = require('../controll/data_module');

router.get('/', function(req, res) {
  //console.log(JSON.stringify(req.query));
  console.log("test2");
  res.render('index');
  res.end();
});
router.get('/login', data_module.login);
router.get('/goodsList', data_module.goodsList);
router.get('/goodsOrderDesc', data_module.goodsOrderDesc);
router.get('/inChange', data_module.inChange);
router.get('/inInc', data_module.inInc);
router.get('/outDesc', data_module.outDesc);
router.get('/addGoods', data_module.addGoods);
router.get('/search', data_module.search);
router.get('/addOrder', data_module.addOrder);
router.get('/orderList', data_module.orderList);
router.get('/addUser', data_module.addUser);
router.get('/userList', data_module.userList);
router.get('/changePW', data_module.changePW);
module.exports = router;

