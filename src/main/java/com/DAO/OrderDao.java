package com.DAO;

import java.util.List;

import com.entity.Order;

public interface OrderDao {

//	public int getOrderNum();
	
	public boolean saveOrder(List<Order> olist);
	
	public List<Order> getBook(String email);
	
	public List<Order> getAllOrder();
	
}
