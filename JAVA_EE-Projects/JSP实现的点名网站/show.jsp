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
			<h2><center>学生出勤情况报告</center></h2>
	        </div>
<table border="1" width="85%" align=center  >
<tr>
<td class="biaoti">学号</td><td class="biaoti">姓名</td><td class="biaoti">已到</td><td class="biaoti">请假</td><td class="biaoti">迟到</td><td class="biaoti">未到</td>
</tr>
<%
	try{
		request.setCharacterEncoding("GBK");
		String paramName = request.getParameter("name");
		String filePath = request.getRealPath("/upload//");
		File inFile = new File(filePath,paramName); // 读取的CSV文件
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
<p align=center ><font color=red>学生出勤情况报告 南京林业大学保留一切特权</font></p>
<ul>
<li> <a href="welcome.html">回到首页</a></li>
<li> <a href="#">法律条款</a></li>
<li> <a href="callUs.html">联系我们</a></li>


	
</body>
</html>