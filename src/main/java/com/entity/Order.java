package com.entity;

public class Order {

	private int id;
	private String orderId;
	private String username;
	private String email;
	private String phno;
	private String fulladd;
	private String bookname;
	private String author;
	private String price;
	private String paymentType;
	
	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Order(int id, String orderId, String username, String email, String phno, String fulladd,
			String paymentType) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.username = username;
		this.email = email;
		this.phno = phno;
		this.fulladd = fulladd;
		this.paymentType = paymentType;
	}
	
	
	
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhno() {
		return phno;
	}
	public void setPhno(String phno) {
		this.phno = phno;
	}
	public String getFulladd() {
		return fulladd;
	}
	public void setFulladd(String fulladd) {
		this.fulladd = fulladd;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	@Override
	public String toString() {
		return "Order [id=" + id + ", orderId=" + orderId + ", username=" + username + ", email=" + email + ", phno="
				+ phno + ", fulladd=" + fulladd + ", paymentType=" + paymentType + "]";
	}
	
		
}
