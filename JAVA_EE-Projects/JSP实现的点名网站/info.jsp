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

<head><title>点名系统--管理--信息显示</title>
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
				%><br>没有上传任何班级信息,点击<a href="upload.html">上传</a>上传班级信息<%
			}
			else{
				%>选择要显示的班级：<br><%
				int cou=0;
				for(int i=0;i<array.length;i++)
				{
					File inFile = new File(filePath,array[i]); // 读取的CSV文件
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
					%><a href='show.jsp?name=<%=array[i]%>'><%=array[i]%></a>&nbsp&nbsp&nbsp&nbsp此班本学期已点过<%=cou%>次名<br><%reader.close();
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
<p align=center ><font color=red>学生出勤情况报告 南京林业大学保留一切特权</font></p>
<ul>
<li> <a href="welcome.html">回到首页</a></li>
<li> <a href="#">法律条款</a></li>
<li> <a href="callUs.html">联系我们</a></li>

</body>
</html>