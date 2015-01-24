<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>

<%@page import="java.io.BufferedReader"
import ="java.io.BufferedWriter"
import ="java.io.FileNotFoundException"
import ="java.io.FileReader"
import ="java.io.FileWriter"
import ="java.io.IOException"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="" /><!--在搜索引擎中用到，关键字、描述-->
<meta name="description" content="" />
<title>点名系统--设置</title>
<link href="http://fonts.googleapis.com/css?family=News+Cycle:400,700" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]--><!--条件注释，判断是否是ie6-->


<title>点名系统--设置--管理</title>
</head>
<body>
<div id="header" class="container">
	<div id="logo">
		<h1>WELCOME</h1>
	</div>
	<div id="menu">
		<ul>
			<li class="current_page_item"><a href="welcome.html" accesskey="1" title="">首页</a></li>
			
			<li><a href="welcome.html#about" accesskey="3" title="">关于我们</a></li>
			
		</ul>
	</div>
</div>


<%
	
	try{
	String path=request.getRealPath("");
	File file = new File(path,"/upload");
	if(file!=null)
	{
		String array[];
		array=file.list();
		if(array.length==0)
		{
			%><br>
<div id="bg1">
		<div class="container">
				<div class="title">
					<span class="byline">目前没有任何班级信息,快上传一些吧！</span>
				</div>
				<p>点击“我要上传”来上传班级信息</p>
				<ul class="actions">
					<li><a href="upload.html" class="button">我要上传</a></li>
				</ul>	
			</div>
		</div><%
		}
		else{
			String filePath = request.getRealPath("/upload//");
			
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
			%>
		<div id="bg1">
			<div class="title">
				
				<%=array[i]%>&nbsp&nbsp&nbsp&nbsp此班本学期已点过<%=cou%>次名
				<form action="call.jsp" >
				<input type="submit" class="button" value="点名">
				</form>
				<form action="delete.jsp"  method="post">
					<input type="submit" class="button" value="删除">
					<input type="hidden" name="param" value="<%=array[i]%>">
				</form>
				<form action="download.jsp">
					<input type="submit" class="button" value="下载">
					<input type="hidden" name="param1" value="<%=array[i]%>"><br>
				</form>
			</div>
</div>
	
			
			<%
				reader.close();
			}
			%>
			<div id="bg2">
			<div class="container">
				<H3>点击“我要上传”来上传新的班级信息</H3><BR>
				<ul >
					<li><a href="upload_load.jsp" class="button1">我要上传</a></li>
				</ul>	
			</div>
			</div>
		<%
		}  
	 }
	}catch (Exception e) 
			{
 				%>
					<%=e%>
				<%
			}

%>
<br>
<div id="extra" class="container">
<ul class="actions">
		<li><p align=right><a href="#" class="button1">回到顶部</a></li>
	</ul>
</div>

</body>
</html>