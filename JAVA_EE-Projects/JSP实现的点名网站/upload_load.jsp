<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="org.lxh.smart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%> 
<html>
<head><title>点名系统-设置</title></head>
<body>
<%
	SmartUpload smart = new SmartUpload() ;
	smart.initialize(pageContext) ;	// 初始化上传操作
	try{smart.setAllowedFilesList("csv");//允许上传的文件
	smart.upload();// 上传准备
	}catch(Exception e){
	%>
		<script language=javascript>
			alert("只允许上传.csv文件");
			window.location='upload.html';
		</script>
	<%
	}
		boolean sign = true;
	
		try{org.lxh.smart.File myFile = smart.getFiles().getFile(0);  
		if (myFile.isMissing())
		{%>  
			<script language=javascript>  
			alert("请先选择要上传的文件");  
			window.location='upload.html';  
			</script>  
		<%}}catch(Exception e){%><%=e%><%} 
		try{smart.save("upload");	// 文件保存
		}catch(Exception e){
			sign=false;}
		
			
			if(sign){%>
				<script language=javascript>  
				alert("上传成功！");  
				window.location='set.jsp';  
				</script>  
			<%}else
			{%><script language=javascript>  
				alert("上传失败！");  
				window.location='set.jsp';  
				</script>  
			
			<%}
		%>
</body>
</html>