package com.hy.ly.po;

import java.io.Serializable;

import javax.servlet.http.HttpSessionActivationListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;
import javax.servlet.http.HttpSessionEvent;

public class Customer implements HttpSessionBindingListener,HttpSessionActivationListener,Serializable{

	private static final long serialVersionUID = 1L;
	private String name;
	private String address;
	private String cardType;
	private String cardNo;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public Customer(String name, String address, String cardType, String cardNo) {
		super();
		this.name = name;
		this.address = address;
		this.cardType = cardType;
		this.cardNo = cardNo;
	}
	public Customer() {
		super();
		System.out.println("Customer's Constructor.......");
	}
	@Override
	public String toString() {
		return "Customer [name=" + name + ", address=" + address + ", cardType=" + cardType + ", cardNo=" + cardNo
				+ "]";
	}
	@Override
	public void valueBound(HttpSessionBindingEvent event) {
		System.out.println("绑定到  Session");
		
		Object value=event.getValue();
		System.out.println(this==value);
		System.out.println(event.getName());
	}
	@Override
	public void valueUnbound(HttpSessionBindingEvent arg0) {
		System.out.println("Session 中解除绑定");
	}
	@Override
	public void sessionDidActivate(HttpSessionEvent arg0) {
		System.out.println("从磁盘上读取到内存中");
		
	}
	@Override
	public void sessionWillPassivate(HttpSessionEvent arg0) {
		System.out.println("从内存中写入到磁盘上！");
		
	}
	
}
