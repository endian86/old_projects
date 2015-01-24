package com.live.mhzever.action;

import com.live.mhzever.struts2.DButil;
import com.opensymphony.xwork2.ActionSupport;

public class StockAction extends ActionSupport{
	private int gin;
	private int gout;
	private String username;
	private String goodsname;
	public String update(){
		DButil util =new DButil();
		util.update_goods(username, gin, gout, goodsname);		
		return "updateOK";
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getGoodsname() {
		return goodsname;
	}

	public void setGoodsname(String goodsname) {
		this.goodsname = goodsname;
	}

	public int getGin() {
		return gin;
	}
	public void setGin(int gin) {
		this.gin = gin;
	}
	public int getGout() {
		return gout;
	}
	public void setGout(int gout) {
		this.gout = gout;
	}
	
}
