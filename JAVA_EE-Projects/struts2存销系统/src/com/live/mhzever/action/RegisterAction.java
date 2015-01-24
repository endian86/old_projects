package com.live.mhzever.action;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.live.mhzever.struts2.DButil;
import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport{
	private String username;
	private String password;
	private String email;
	
	/*public void validate(){
		if(username==null||username.trim().equals("")){
			String msg = "用户名必填";
			this.addFieldError("username", msg);
		}
		if(password==null||password.trim().equals("")){
			String msg = "用户名必填";
			this.addFieldError("password", msg);
		}
	}*/
	public String register () throws SQLException
	{
		DButil util = new DButil();
		String sql="select username from UserTab";
		ResultSet rs = util.get_username(sql);
		while(rs.next())
		{
			String un=rs.getString(1);
			System.out.println("  username="+un);
			if(username.equals(un))
			{
				System.out.println("  registerFail");
				return "registerFail";	
			}	
		}		
		util.create_table(username);
		util.insert(username,password,email);
		return "registerOK";
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
