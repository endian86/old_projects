<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="org.lxh.smart.*"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="keywords" content="" /><!--�������������õ����ؼ��֡�����-->
<meta name="description" content="" />
<title>����ϵͳ--����</title>
<link href="http://fonts.googleapis.com/css?family=News+Cycle:400,700" rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />

<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]--><!--����ע�ͣ��ж��Ƿ���ie6-->

</head>
<body>
<div id="header" class="container">
	<div id="logo">
		<h1>WELCOME</h1>
	</div>
	<div id="menu">
		<ul>
			<li class="current_page_item"><a href="welcome.html" accesskey="1" title="">��ҳ</a></li>
			
			<li><a href="welcome.html#about" accesskey="3" title="">��������</a></li>
			
		</ul>
	</div>
</div>

<%
	String path=request.getRealPath("");
	File file = new File(path,"/upload");
	if(file!=null)
	{
		String array[];
		array=file.list();
		if(array.length==0)
		{
%>			<br>
		<div id="bg1">
		<div class="container">
				<div class="title">
					<span class="byline">Ŀǰû���κΰ༶��Ϣ,���ϴ�һЩ�ɣ�</span>
				</div>
				<p>�������Ҫ�ϴ������ϴ��༶��Ϣ</p>
				<ul class="actions">
					<li><a href="upload_load.jsp" class="button">��Ҫ�ϴ�</a></li>
				</ul>	
			</div>
		</div>
		
  	<%
		}
	
		else
		{
	%>
		<div id="bg1">
		<div class="title">
			
			
		
		<ul class="actions">
			<h4>���������༶������������ɾ���༶��Ϣ</h4>
			<li><a href="manage.jsp" class="button">����༶</a></li>
			<br><br><h4>�������Ϣ��ʾ�����鿴����ĵ�����¼</h4>
			<li><a href="info.jsp" class="button">��Ϣ��ʾ</a></li>
		</div></div>
	
<%}
		}
%>
<div id="extra" class="container">
<ul class="actions">
		<li><p align=right><a href="#" class="button1">�ص�����</a></li>
	</ul>
</div>
</body>
</html>