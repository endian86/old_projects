<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title></title>

<meta name="keywords" content="" /><!--在搜索引擎中用到，关键字、描述-->
<meta name="description" content="" />

<link href="http://fonts.googleapis.com/css?family=News+Cycle:400,700" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]--><!--条件注释，判断是否是ie6-->

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
		String filePath = request.getRealPath("/upload//");
	File file = new File(filePath);
	if(file!=null)
	{
		
		String array[];
		array=file.list();
		if(array.length==0)
		{
			%><br>
			<div id="banner">
			<div class="container">
				<div class="title">
					<span class="byline">目前没有任何班级信息,快上传一些吧！</span>
				</div>
				<p>点击“我要上传”来上传班级信息</p>
				<ul class="actions">
					<li><a href="upload.html" class="button">我要上传</a></li>
				</ul>	
			</div>
			</div>

			<%
		}
		else{
			%>	<div id="banner">
				<div id="extra" class="container">
				<div class="title">
					<h3>请选择要点名的班级：</h3>
				
	    			
			<%
			for(int i=0;i<array.length;i++)
			{
				%><p align=center><a href='openfile.jsp?name=<%=array[i]%>'class="button"><%=array[i]%></a><br><%
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
</div>
				</div>
</div>
<div id="extra" class="container">
<ul class="actions">
		<li><p align=right><a href="#" class="button">回到顶部</a></li>
	</ul>

</div>
</body>
</html>