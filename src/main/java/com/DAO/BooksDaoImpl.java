package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Bookdetails;

public class BooksDaoImpl implements BooksDao {

	private Connection conn;
	
	public BooksDaoImpl(Connection conn) {
		super();
		this.conn = conn;
	}



	public boolean addbooks(Bookdetails b) {
		
		boolean f=false;
		
		try {
			
			String query = "insert into book_dtl(bookname,author,price,bookCategory,status,photo,email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps=conn.prepareStatement(query);
			
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setDouble(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto());
			ps.setString(7, b.getEmail());
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}



	public List<Bookdetails> getAllBooks() {
		
		List<Bookdetails> list = new ArrayList<Bookdetails>();
		Bookdetails b=null;
		
		try {
			
			String query="select * from book_dtl";
			
			PreparedStatement ps=conn.prepareStatement(query);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				b=new Bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}



	public Bookdetails getBookById(int id) {
		
		Bookdetails b= null;
		
		try {
			
			String query="select * from book_dtl where bookId=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				
				b=new Bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return b;
	}



	public boolean updateEditBooks(Bookdetails b) {
		
		boolean f=false;
		
		try {
			
			String query="update book_dtl set bookname=?,author=?,price=?,status=? where bookId=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setDouble(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}



	public boolean deleteBooks(int id) {
		
		boolean f= false;
		
		try {
			
			String query="delete from book_dtl where bookId=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setInt(1, id);
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}



	public List<Bookdetails> getNewBook() {
		
		List<Bookdetails> list =new ArrayList<Bookdetails>();
		Bookdetails b = null;
		
		try {
			
			String query="select * from book_dtl where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(query);
			
			ps.setString(1, "New");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				
				b=new Bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
				i++;
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return list;
	}



	public List<Bookdetails> getOldBook() {
		
		List<Bookdetails> list =new ArrayList<Bookdetails>();
		Bookdetails b = null;
		
		try {
			
			String query="select * from book_dtl where bookCategory=? and status=?";
			PreparedStatement ps=conn.prepareStatement(query);
			
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next() && i<=4) {
				
				b=new Bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
				i++;
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return list;

	}



	public List<Bookdetails> getAllNewBook() {
		
		List<Bookdetails> list =new ArrayList<Bookdetails>();
		Bookdetails b = null;
		
		try {
			
			String query="select * from book_dtl where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps=conn.prepareStatement(query);
			
			ps.setString(1, "New");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next()) {
				
				b=new Bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
				i++;
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return list;

	}
	
	public List<Bookdetails> getAllOldBook() {
		
		List<Bookdetails> list =new ArrayList<Bookdetails>();
		Bookdetails b = null;
		
		try {
			
			String query="select * from book_dtl where bookCategory=? and status=?";
			PreparedStatement ps=conn.prepareStatement(query);
			
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			
			ResultSet rs = ps.executeQuery();
			int i=1;
			while(rs.next()) {
				
				b=new Bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
				i++;
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return list;

	}



	public List<Bookdetails> getBookByOld(String email, String cat) {
		
		List<Bookdetails> list =new ArrayList<Bookdetails>();
		Bookdetails b = null;
		
		try {
			
			String query="select * from book_dtl where bookCategory=? and email=?";
			PreparedStatement ps=conn.prepareStatement(query);
			
			ps.setString(1, cat);
			ps.setString(2, email);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				
				b=new Bookdetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getDouble(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setEmail(rs.getString(8));
				
				list.add(b);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;

	}



	public boolean oldBookDelete(String email, String cat, int id) {
		
		boolean f= false;
		
		try {
			
			String query="delete from book_dtl where bookCategory=? and email=? and bookId=?";
			PreparedStatement ps=conn.prepareStatement(query);
			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);
			
			int i=ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;

	}

	
}
