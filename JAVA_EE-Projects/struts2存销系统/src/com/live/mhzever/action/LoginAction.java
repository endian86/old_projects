package com.live.mhzever.action;

import java.sql.ResultSet;

import com.live.mhzever.struts2.DButil;
//import com.mysql.jdbc.Connection;
//import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	/*
	public String execute() throws Exception {
		if(username!=null&&username.equals("mhz"))
		{
			return SUCCESS;
		}else{
			return INPUT;
		}
	}*/
	public String login()throws Exception{
		DButil util = new DButil();		
		String sql = "select username,password from UserTab";
		ResultSet rs = util.get_info(sql);
		while(rs.next())
		{
			String un=rs.getString(1);
			String pw=rs.getString(2);
			System.out.println("  username="+un+"  password="+pw);
			if(username.equals(un)&&password.equals(pw))
			{
				System.out.println("LoginOK");
				
				return "loginOK";	
			}	
		}		
		return "failLogin";
	}
	public String register()throws Exception{
		System.out.println("registerOK");
		return "registerOK";
	}	
	private String username;
	private String password;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}
