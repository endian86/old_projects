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
<head><title>����ϵͳ--����--����--ɾ��</title></head>
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
		//�趨contentDispositionΪnull�Խ�ֹ������Զ����ļ���
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