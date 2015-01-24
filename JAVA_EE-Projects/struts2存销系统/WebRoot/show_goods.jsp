<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'show_goods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
   	String username = request.getParameter("username");
   	String goodsname = request.getParameter("goodsname");
    %>
    <form name="show" action="show_update.action" method="post">
    	入库量<input type="text" name="gin"><br>
    	出库量<input type="text" name="gout"><br>
    	<input type="hidden" name="username" value=<%=username %>>
    	<input type="hidden" name="goodsname" value=<%=goodsname %>>
    	<input type="submit" value="保存">
    </form>
  </body>
</html>
