<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
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
    <s:form name="f1" id="f1" action="register_register.action" method="post">
   		<s:textfield name="username" label="Username"/>
        <s:password name="password" label="Password"/>
        <s:textfield name="email" label="E-Mail"/>
        <s:submit name="sub" label="Register"/>
    </s:form>
  </body>
</html>
