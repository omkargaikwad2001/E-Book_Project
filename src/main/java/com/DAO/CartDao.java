package com.DAO;

import java.util.List;

import com.entity.Bookdetails;
import com.entity.Cart;

public interface CartDao {

	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(int useId);
	
	public boolean deleteBook(int bid,int uid,int cid);
}
