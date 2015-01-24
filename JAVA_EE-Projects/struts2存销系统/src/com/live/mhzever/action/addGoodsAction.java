package com.live.mhzever.action;

import com.live.mhzever.struts2.DButil;
import com.opensymphony.xwork2.ActionSupport;

public class addGoodsAction extends ActionSupport{
	
	public String add(){
		DButil util = new DButil();
		util.insert_goods(username, goodsname, price);
		System.out.println("username="+username+"goodsname="+goodsname+"price="+price);
		return "addOK";
	}
	private String goodsname;
	private float price;
	private String username;
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
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
}
