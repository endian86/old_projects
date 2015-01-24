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
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>点名系统--点名</title>
</head>
<body background="p05.jpg">
<table border="1"  width="85%" align=center>
<tr>
<td>学号</td><td>姓名</td><td><center>状态</center></td>
</tr>
<%

		request.setCharacterEncoding("GBK");
		String paramName = request.getParameter("name");
		String filePath = request.getRealPath("/upload//");
	try{
		

		File inFile = new File(filePath,paramName); // 读取的CSV文件
		String inString = "";
		BufferedReader reader = new BufferedReader(new FileReader(inFile));
		int flag=0,sign_num=0,sign=-1,param0=-10,param1=-9,param2=-8,param3=-7;

		%><form action="complete.jsp" name="formName"><%
		while((inString = reader.readLine())!= null)
		{
			sign_num++;
			if(flag==0)
			{	
				sign_num--;
				flag++;
				
				%><br><%
			}else
			{
				param0=param0+10;
				param1=param1+10;
				param2=param2+10;
				param3=param3+10;	
				%><tr><td><%
				for(int i=0;i<inString.length();i++)
				{
					if(inString.charAt(i)==',')
					{
						sign++;							
					}
					else
					{
						if(inString.charAt(i)!='+')
						%><%=inString.charAt(i)%><%
					}
					if(sign==0)
					{
						%>&nbsp</td><td><%
						sign++;
					}
									
				}
						%>
			
			</td><td>
			&nbsp&nbsp&nbsp&nbsp<input type="checkbox" name="call_name" value="<%=param0%>" >已到
			&nbsp&nbsp&nbsp&nbsp<input type="checkbox" name="call_name" value="<%=param1%>" >请假
		&nbsp&nbsp&nbsp&nbsp<input type="checkbox" name="call_name" value="<%=param2%>">迟到
			&nbsp&nbsp&nbsp&nbsp<input type="checkbox" name="call_name" value="<%=param3%>" >未到
			<br><%
				%></td></tr><%
			}  
			sign=-1;
        }
		reader.close();
		%><input type="hidden" name="sign" value="<%=sign_num%>" >
		<input type="hidden" name="pathName" value="<%=paramName%>" >
		<%
	}catch (Exception e) 
			{
 				%>
					<%=e%>
				<%
			}

	
%>

<input type="submit" value="保存点名结果">
</form>
<%
%>
</table>
<br><a href="welcome.html">返回主页</a>

</body>
</html>