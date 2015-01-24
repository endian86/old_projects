<%@ page contentType="text/html" pageEncoding="GBK"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>

<%@page import="java.io.BufferedReader"
import ="java.io.BufferedWriter"
import ="java.io.FileNotFoundException"
import ="java.io.FileReader"
import ="java.io.FileWriter"
import ="java.io.IOException"%>

<head><title>点名系统--保存点名结果</title></head>
<body>
<%
	request.setCharacterEncoding("GBK");
	String callNames[] = request.getParameterValues("call_name");
	String sign_num = request.getParameter("sign");

	String pathName = request.getParameter("pathName");	
	String filePath = request.getRealPath("/upload//");
	File inFile = new File(filePath,pathName); 
	
	BufferedReader reader = new BufferedReader(new FileReader(inFile));
	String outString[] = new String[100],inString="";

	int sign=0,call=0;
	int flag=0,sign_com=0,k=0;

	if(callNames!=null&&(callNames.length==Integer.parseInt(sign_num)))
	{
		while((outString[k] = reader.readLine())!= null)
		{
//			StringBuffer st = new StringBuffer(outString[k]);
//							st=st.insert(outString[k].length()-1,"\0,");
//							outString[k]=st.toString();				
			if(flag==0)
			{	
				flag++;
			}
			else
			{	

				for(int i=0;i<outString[k].length();i++)
				{
//					
					if(outString[k].charAt(i)==',')
					{
						sign_com++;
						int comp=Integer.valueOf(callNames[k-1]).intValue()%10;
						
						if(comp==0&&sign_com==2)
						{
							
							StringBuffer s = new StringBuffer(outString[k]);
							s=s.insert(i+1,'+');
							outString[k]=s.toString();
							%><%=outString[k]%><br><%
						}
						if(comp==1&&sign_com==3)
						{
							
							StringBuffer s = new StringBuffer(outString[k]);
							s=s.insert(i+1,'+');
							outString[k]=s.toString();
							%><%=outString[k]%><br><%
						}
						if(comp==2&&sign_com==4)
						{
							
							StringBuffer s = new StringBuffer(outString[k]);
							s=s.insert(i+1,'+');
							outString[k]=s.toString();
							%><%=outString[k]%><br><%
						}
						if(comp==3&&sign_com==5)
						{
							
							StringBuffer s = new StringBuffer(outString[k]);
							s=s.insert(i+1,"+");
							outString[k]=s.toString();
							%><%=outString[k]%><br><%
						}
						
					}
				}	
			}
			k++;
			sign_com=0;

		}
		File outFile = new File(filePath,pathName);//写出的CSV文件
		BufferedWriter writer = new BufferedWriter(new FileWriter(outFile));
		for(int i=0;i<callNames.length;i++)
		{
			writer.write(outString[i]);
			writer.newLine();
		}
		writer.close();
	}
	else
	{
		%><script language=javascript>
			alert("没有点名完成，无法保存");
			window.location='call.jsp';
		</script><%
	}
	reader.close();
	%><script language=javascript>
			alert("点名完成，已经保存");
			window.location='call.jsp';
</script><%
%>

<br><a href="welcome.html">返回主页</a>

</body>
</html>