<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>

<%@page import="java.io.BufferedReader"
import ="java.io.BufferedWriter"
import ="java.io.FileNotFoundException"
import ="java.io.FileReader"
import ="java.io.FileWriter"
import ="java.io.IOException"%>

<html xmlns="http://www.w3.org/1999/xhtml">

<head><title>����ϵͳ--����--��Ϣ��ʾ</title>
<style type="text/css">
<!--
body{
background:url("p01.jpg" ) repeat-x #E4E4E4;
margin:0px;
padding:0px;
}
#logo{
height:80%;
width:80%;
margin-top:50px;
margin-left:300px;
}
-->
</style>
</head>
<body>

<div id="content">

</div>



<%
	try{
		String filePath = request.getRealPath("/upload//");
		File file = new File(filePath);
		if(file!=null)
		{
		
			String array[];
			array=file.list();
			if(array.length==0)
			{
				%><br>û���ϴ��κΰ༶��Ϣ,���<a href="upload.html">�ϴ�</a>�ϴ��༶��Ϣ<%
			}
			else{
				%>ѡ��Ҫ��ʾ�İ༶��<br><%
				int cou=0;
				for(int i=0;i<array.length;i++)
				{
					File inFile = new File(filePath,array[i]); // ��ȡ��CSV�ļ�
				String inString = "";
				BufferedReader reader = new BufferedReader(new FileReader(inFile));
				if((inString = reader.readLine())!= null){}
				if((inString = reader.readLine())!= null){}
				for(int j=0;j<inString.length();j++)
				{
					if(inString.charAt(j)=='+')
					{
						cou++;							
					}
				}
					%><a href='show.jsp?name=<%=array[i]%>'><%=array[i]%></a>&nbsp&nbsp&nbsp&nbsp�˰౾ѧ���ѵ��<%=cou%>����<br><%reader.close();
				}
		}
	}

	
	}catch (Exception e) 
			{
 				%>
					<%=e%>
				<%
			}

%>
<p align=center ><font color=red>ѧ������������� �Ͼ���ҵ��ѧ����һ����Ȩ</font></p>
<ul>
<li> <a href="welcome.html">�ص���ҳ</a></li>
<li> <a href="#">��������</a></li>
<li> <a href="callUs.html">��ϵ����</a></li>

</body>
</html>