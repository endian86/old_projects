<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>

<%@page import="java.io.BufferedReader"
import ="java.io.BufferedWriter"
import ="java.io.FileNotFoundException"
import ="java.io.FileReader"
import ="java.io.FileWriter"
import ="java.io.IOException"%>
<html>
<head><title>����ϵͳ--����--����--ɾ��</title></head>
<body>

<%
	try{
	request.setCharacterEncoding("GBK");
	String fileName = request.getParameter("param");
	String path=request.getRealPath("");
	File filePath = new File(path,"/upload");
	if(filePath!=null)
	{
		
		File delFile = new File(filePath,fileName);
		%><script language = javascript>
				alert("ȷ��ɾ����");
				</script><%
		if(delFile.delete())
		{
			
		}else{
					
				}

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