package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Order;

public class OrderDaoImpl implements OrderDao{
	
	private Connection conn;

	public OrderDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}

//	public int getOrderNum() {
//		int i=1;
//		try {
//			
//			String query="select * from bookorder";
//			
//			PreparedStatement ps=conn.prepareStatement(query);
//			ResultSet rs = ps.executeQuery();
//			
//			while(rs.next()) {
//				i++;
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return i;
//	}

	public boolean saveOrder(List<Order> olist) {
		
		boolean f=false;
		
		try {
			
			String query="insert into bookorder(orderid,username,email,address,phone,bookname,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps=conn.prepareStatement(query);
			
			for(Order o:olist) {
				
				ps.setString(1, o.getOrderId());
				ps.setString(2, o.getUsername());
				ps.setString(3, o.getEmail());
				ps.setString(4, o.getFulladd());
				ps.setString(5, o.getPhno());
				ps.setString(6, o.getBookname());
				ps.setString(7, o.getAuthor());
				ps.setString(8, o.getPrice());
				ps.setString(9, o.getPaymentType());
				ps.addBatch();
			}
			
			int[] count = ps.executeBatch();
			
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

	public List<Order> getBook(String email) {
		
		List<Order> list=new ArrayList<Order>();
		Order o =null;
		
		try {
			
			String query="select * from bookorder where email=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				o=new Order();
				
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setBookname(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	public List<Order> getAllOrder() {
		List<Order> list=new ArrayList<Order>();
		Order o =null;
		
		try {
			
			String query="select * from bookorder";
			PreparedStatement ps=conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				o=new Order();
				
				o.setId(rs.getInt(1));
				o.setOrderId(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setBookname(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymentType(rs.getString(10));
				list.add(o);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	

}
