<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>

<%@page import="java.io.BufferedReader"
import ="java.io.BufferedWriter"
import ="java.io.FileNotFoundException"
import ="java.io.FileReader"
import ="java.io.FileWriter"
import ="java.io.IOException"%>
<%@ page import="org.lxh.smart.*"%>
<html>
<head><title>点名系统--设置--管理--删除</title></head>
<body>

<%
	try{
	request.setCharacterEncoding("GBK");
	String fileName = request.getParameter("param1");
	String path=request.getRealPath("")+"/upload/"+fileName;
	if(path!=null)
	{
		SmartUpload su = new SmartUpload() ;
		su.initialize(pageContext);
		//设定contentDisposition为null以禁止浏览器自动打开文件，
		su.setContentDisposition(null);
		su.downloadFile(path);
		out.clear();
		out = pageContext.pushBody();
	}
	}catch (Exception e) 
			{
 				%>
					<%=e%>
				<%
			}

%>

<script language = javascript>
window.location="manage.jsp";
</script>

</body>
</html>