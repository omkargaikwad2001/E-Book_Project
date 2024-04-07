package com.DAO;

import java.util.List;

import com.entity.Bookdetails;

public interface BooksDao {
	
	public boolean addbooks(Bookdetails b);
	
	public List<Bookdetails> getAllBooks();
	
	public Bookdetails getBookById(int id);
	
	public boolean updateEditBooks(Bookdetails b);
	
	public boolean deleteBooks(int id);
	
	public List<Bookdetails> getNewBook();
	
	public List<Bookdetails> getOldBook();

	public List<Bookdetails> getAllNewBook();
	
	public List<Bookdetails> getAllOldBook();
	
	public List<Bookdetails> getBookByOld(String email,String cat);

	public boolean oldBookDelete(String email,String cat,int id);
	
	
}
