<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="org.lxh.smart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%> 
<html>
<head><title>����ϵͳ-����</title></head>
<body>
<%
	SmartUpload smart = new SmartUpload() ;
	smart.initialize(pageContext) ;	// ��ʼ���ϴ�����
	try{smart.setAllowedFilesList("csv");//�����ϴ����ļ�
	smart.upload();// �ϴ�׼��
	}catch(Exception e){
	%>
		<script language=javascript>
			alert("ֻ�����ϴ�.csv�ļ�");
			window.location='upload.html';
		</script>
	<%
	}
		boolean sign = true;
	
		try{org.lxh.smart.File myFile = smart.getFiles().getFile(0);  
		if (myFile.isMissing())
		{%>  
			<script language=javascript>  
			alert("����ѡ��Ҫ�ϴ����ļ�");  
			window.location='upload.html';  
			</script>  
		<%}}catch(Exception e){%><%=e%><%} 
		try{smart.save("upload");	// �ļ�����
		}catch(Exception e){
			sign=false;}
		
			
			if(sign){%>
				<script language=javascript>  
				alert("�ϴ��ɹ���");  
				window.location='set.jsp';  
				</script>  
			<%}else
			{%><script language=javascript>  
				alert("�ϴ�ʧ�ܣ�");  
				window.location='set.jsp';  
				</script>  
			
			<%}
		%>
</body>
</html>