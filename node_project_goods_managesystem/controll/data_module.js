var mysql = require('../database');
exports.login = function(req,res){
	console.log(JSON.stringify(req.query));
  console.log("test3");
  var result;
    var sql = "select * from user where username='"+req.query.username+"' and password='"+req.query.password+"'";
	mysql.query(sql,function(err,list){
	 if(err){
        console.log("[query query]:"+err)
        return;
   	 }
   	  console.log(list);
   	  if(JSON.stringify(list) == '[]'){
   	  	 result={status: 400, message: '帐号或密码错误请重新登录'}
   	  	 res.json(result);
   	  	 return;
   	  }else{
   	  	result={status: 200, message: '登录成功',list:list}
   	  	res.json(result);
   	  	return;
   	  }
      
	});
}
exports.goodsList = function(req,res){
	console.log(JSON.stringify(req.query));
  console.log("test3");
  var result;
    var sql = "select * from goods order by sale_num desc";
	mysql.query(sql,function(err,list){
	 if(err){
        console.log("[query query]:"+err)
        return;
   	 }
   	  console.log(list);
   	  	result={status: 200, message: 'OK',list:list}
   	  	res.json(result);
   	  	return;
	});
}

exports.goodsOrderDesc = function(req,res){
  var result;
    var sql = "select * from goods order by sale_num";
	mysql.query(sql,function(err,list){
	 if(err){
        console.log("[query query]:"+err)
        return;
   	 }
   	  console.log(list);
   	  	result={status: 200, message: 'OK',list:list}
   	  	res.json(result);
   	  	return;
	});
}
exports.inChange = function(req,res){
  var result;
    var sql = "select * from goods where id='"+req.query.id+"'";
	mysql.query(sql,function(err,list){
	 if(err){
        console.log("[query query]:"+err)
        return;
   	 }
   	  console.log(list);
   	  	result={status: 200, message: 'OK',list:list}
   	  	res.json(result);
   	  	return;
	});
}
exports.inInc = function(req,res){
  var result;
    var sql = "update goods set goods_num= goods_num+'"+req.query.num+"' where id='"+req.query.id+"'";
	mysql.query(sql,function(err,list){
	 if(err){
        console.log("[query query]:"+err)
        return;
   	 }
   	  console.log(list);
   	  	result={status: 200, message: 'OK',list:list}
   	  	res.json(result);
   	  	return;
	});
}
exports.outDesc = function(req,res){
  var result;
    var sql = "update goods set goods_num= goods_num-'"+req.query.num+"',sale_num = sale_num+'"+req.query.num+"' where id='"+req.query.id+"'";
	mysql.query(sql,function(err,list){
	 if(err){
        console.log("[query query]:"+err)
        return;
   	 }
   	  console.log(list);
   	  	result={status: 200, message: 'OK',list:list}
   	  	res.json(result);
   	  	return;
	});
}
exports.addGoods = function(req,res){
  var result;
    var sql = "insert into goods (goods_name,manufacture,goods_num,sale_num) values('"+req.query.goods_name+"','"+req.query.manufacture+"',0,0)";
  mysql.query(sql,function(err,list){
   if(err){
        console.log("[query query]:"+err)
        return;
     }
      console.log(list);
        result={status: 200, message: 'OK',list:list}
        res.json(result);
        return;
  });
}
exports.search = function(req,res){
  var result;
    var sql = "select * from goods where goods_name like '%"+req.query.goods_name+"%'";
  mysql.query(sql,function(err,list){
   if(err){
        console.log("[query query]:"+err)
        return;
     }
      console.log(list);
        result={status: 200, message: 'OK',list:list}
        res.json(result);
        return;
  });
}
exports.addOrder = function(req,res){
  var result;
    var sql = "insert into orders (customer_id,delivery_date,delivery_address,goods_id,schedule_num) values('"+req.query.customer_id+"','"+req.query.delivery_date+"','"+req.query.delivery_address+"','"+req.query.goods_id+"','"+req.query.schedule+"')";
  mysql.query(sql,function(err,list){
   if(err){
        console.log("[query query]:"+err)
        return;
     }
      console.log(list);
        result={status: 200, message: 'OK',list:list}
        res.json(result);
        return;
  });
}
exports.orderList = function(req,res){
  var result;
    var sql = "select * from orders ";
  mysql.query(sql,function(err,list){
   if(err){
        console.log("[query query]:"+err)
        return;
     }
      console.log(list);
        result={status: 200, message: 'OK',list:list}
        res.json(result);
        return;
  });
}
exports.addUser = function(req,res){
  var result;
    var sql = "insert into user (username,password) values('"+req.query.username+"','"+req.query.password+"')";
  mysql.query(sql,function(err,list){
   if(err){
        console.log("[query query]:"+err)
        return;
     }
      console.log(list);
        result={status: 200, message: 'OK',list:list}
        res.json(result);
        return;
  });
}
exports.userList = function(req,res){
  var result;
    var sql = "select * from user ";
  mysql.query(sql,function(err,list){
   if(err){
        console.log("[query query]:"+err)
        return;
     }
      console.log(list);
        result={status: 200, message: 'OK',list:list}
        res.json(result);
        return;
  });
}
exports.changePW = function(req,res){
  var result;
    var sql = "update user set password = '"+req.query.password+"' where username='"+req.query.username+"'";
  mysql.query(sql,function(err,list){
   if(err){
        console.log("[query query]:"+err)
        return;
     }
      console.log(list);
        result={status: 200, message: 'OK',list:list}
        res.json(result);
        return;
  });
}