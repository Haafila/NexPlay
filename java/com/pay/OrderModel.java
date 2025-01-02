package com.pay;

import java.sql.Date;

public class OrderModel {
	
	private int orderId;
    private String gameName;
    private String price;
    private String email;
    private String mobile;
    private String userName;
    private String status;
    private Date purchaseDate;
    private String cardNumber;
    private String expireDate;
    private int cvv;


	public OrderModel(int orderId, String gameName, String price, String email, String mobile, String userName, String status, Date purchaseDate, String cardNumber, String expireDate, int cvv) {
		// TODO Auto-generated constructor stub
		this.orderId = orderId;
        this.gameName = gameName;
        this.price = price;
        this.email = email;
        this.mobile = mobile;
        this.userName = userName;
        this.status = status;
        this.purchaseDate = purchaseDate;
        this.cardNumber = cardNumber;
        this.expireDate = expireDate;
        this.cvv = cvv;
	}


	public int getOrderId() {
		return orderId;
	}


	public String getGameName() {
		return gameName;
	}


	public String getPrice() {
		return price;
	}


	public String getEmail() {
		return email;
	}


	public String getMobile() {
		return mobile;
	}


	public String getUserName() {
		return userName;
	}


	public String getStatus() {
		return status;
	}


	public Date getPurchaseDate() {
		return purchaseDate;
	}


	public String getCardNumber() {
		return cardNumber;
	}


	public String getExpireDate() {
		return expireDate;
	}


	public int getCvv() {
		return cvv;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public void setGameName(String gameName) {
		this.gameName = gameName;
	}


	public void setPrice(String price) {
		this.price = price;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}


	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}


	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}


	public void setCvv(int cvv) {
		this.cvv = cvv;
	}


	

}

