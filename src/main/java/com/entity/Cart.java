package com.entity;

public class Cart {
	
	private int cid;
	private int bid;
	private int uid;
	private String bookname;
	private String author;
	private double price;
	private double totalprice;
	
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Cart(int cid, int bid, int uid, String bookname, String author, double price, double totalprice) {
		super();
		this.cid = cid;
		this.bid = bid;
		this.uid = uid;
		this.bookname = bookname;
		this.author = author;
		this.price = price;
		this.totalprice = totalprice;
	}
	
	
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
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
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}
	@Override
	public String toString() {
		return "Cart [cid=" + cid + ", bid=" + bid + ", uid=" + uid + ", bookname=" + bookname + ", author=" + author
				+ ", price=" + price + ", totalprice=" + totalprice + "]";
	}
	
	

	
}
