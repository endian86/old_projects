<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Login.jsp' starting page</title>

  </head>
  
  <body>
  
  <form name="f1" id="f1" action="user_login.action" method="post">
      <table>
        <tr>
          <td>Username:</td>
          <td><input type="text" name="username" id="login"></td>
        </tr>
        <tr>
          <td>Password:</td>
          <td><input type="password" name="password" id="password"></td>
        </tr> 
        <tr>
          <td colspan="2"><input type="submit" value="Login"></td>
          
        </tr>
      </table>
    </form>

	<form name="mh" action="<%=path %>/user_register.action" method="post">
		<input type="submit" value="Register">
	</form>
    <a href="<%=path %>/user_register.action">Register</a>
  </body>
</html>
