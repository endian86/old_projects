<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>

<%@page import="java.io.BufferedReader"
import ="java.io.BufferedWriter"
import ="java.io.FileNotFoundException"
import ="java.io.FileReader"
import ="java.io.FileWriter"
import ="java.io.IOException"%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>

</head>
<body >
<div id="header" class="container">
	<div id="logo">
		<h1>SHOW</h1>
	</div>
</div>
	<div class="h1-1">
		<ul class="staff"> 
			<li><p align=center><img  src="dianming.jpg" alt=""  width=800 height=400 /></p></li>
 
		</ul>
      
		<div class="title">
			<h2><center>ѧ�������������</center></h2>
	        </div>
<table border="1" width="85%" align=center  >
<tr>
<td class="biaoti">ѧ��</td><td class="biaoti">����</td><td class="biaoti">�ѵ�</td><td class="biaoti">���</td><td class="biaoti">�ٵ�</td><td class="biaoti">δ��</td>
</tr>
<%
	try{
		request.setCharacterEncoding("GBK");
		String paramName = request.getParameter("name");
		String filePath = request.getRealPath("/upload//");
		File inFile = new File(filePath,paramName); // ��ȡ��CSV�ļ�
		String inString = "";
		BufferedReader reader = new BufferedReader(new FileReader(inFile));
		int flag=0,sign=0;
		while((inString = reader.readLine())!= null)
		{
			if(flag==0)
			{	
				flag++;
				%><br><%
			}else
			{
				%><tr><%
					int i=0;
					%><td><%
					while(inString.charAt(i++)!=',')
					{
						%><%=inString.charAt(i-1)%><%
					}
					%></td><%
					%><td><%
					while(inString.charAt(i++)!=',')
					{
						%><%=inString.charAt(i-1)%><%
					}
					%></td><%
					%><td><%
					while(inString.charAt(i++)!=',')
					{
						%><%=inString.charAt(i-1)%><%
					}
					%></td><%
					%><td><%
					while(inString.charAt(i++)!=',')
					{
						%><%=inString.charAt(i-1)%><%
					}
					%></td><%
					%><td><%
					while(inString.charAt(i++)!=',')
					{
						%><%=inString.charAt(i-1)%><%
					}
					%></td><%
					%><td><%
					while(i<inString.length())
					{
						%><%=inString.charAt(i)%><%
							i++;
					}
					%></td><%
				%></tr><%
			}
		}
		reader.close();
	
	}catch (Exception e) 
			{
 				%>
					<%=e%>
				<%
			}

%>
</table>
<p>
</p>
<div id="site-info">
<div>
<p align=center ><font color=red>ѧ������������� �Ͼ���ҵ��ѧ����һ����Ȩ</font></p>
<ul>
<li> <a href="welcome.html">�ص���ҳ</a></li>
<li> <a href="#">��������</a></li>
<li> <a href="callUs.html">��ϵ����</a></li>


	
</body>
</html>