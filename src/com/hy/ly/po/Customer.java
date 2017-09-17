package com.hy.ly.po;

public class Customer {

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
	}
	@Override
	public String toString() {
		return "Customer [name=" + name + ", address=" + address + ", cardType=" + cardType + ", cardNo=" + cardNo
				+ "]";
	}
	
}
