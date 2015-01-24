<%@ page language="java" contentType="text/html" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@page import="java.sql.ResultSet" %>
<%@page import="com.live.mhzever.struts2.DButil" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Success.jsp' starting page</title>

  </head>
  
  <body>
    	<%
    		String username = request.getParameter("username");
    		DButil util = new DButil();
    		ResultSet rs = util.list(username);
    		%><table  border="1" width="90%">
    			<tr>
						<td>商品名称</td>
						<td>价格</td>
						<td>入库量</td>
						<td>出库量</td>
						<td>库存</td>
						<td>日期</td>
				</tr>
    		<%
    		while(rs.next())
			{
				String goodsname=rs.getString("goodsname");
				
				float price = rs.getFloat("price");
				int gin = rs.getInt("gin");
				int gout = rs.getInt("gout");
				int stock = rs.getInt("stock");
				Date date = rs.getDate("date");
				String password=rs.getString(3);
				System.out.println("goodsname="+goodsname+"  price="+price+"  gin="+gin+"   gout="+gout+"  stock="+stock+"  date="+date);
				//System.out.println("goodsname="+goodsname);
				%> 
					<tr>
						<td><a href = "show_goods.jsp?goodsname=<%= goodsname %>&username=<%= username %>" ><%=goodsname %></a></td>
						<td><%=price %></td>
						<td><%=gin %></td>
						<td><%=gout %></td>
						<td><%=stock %></td>
						<td><%=date %></td>
					</tr>
				<%
			}
    	 %></table>
    	
     	<form name="add_goods" action="addGoods.jsp" method="post">
    		<input type="submit" value="增加商品" name=addgo>
    		<input type="hidden" value=<%=username %> name="username">
    	</form><br> 	
  </body>
</html>
