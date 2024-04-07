package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDao;
import com.DAO.BooksDaoImpl;
import com.DB.DBConnect;
import com.entity.Bookdetails;

@WebServlet("/editbooks")
public class EditBooksServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String bookname=req.getParameter("bname");
			String author=req.getParameter("author");
			double price=Double.parseDouble(req.getParameter("price"));
			String status=req.getParameter("status");
			
			Bookdetails b= new Bookdetails();
			b.setBookId(id);
			b.setBookname(bookname);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BooksDao dao =new BooksDaoImpl(DBConnect.getConn());
			
			boolean f = dao.updateEditBooks(b);
			
			HttpSession session=req.getSession();
			
			if(f) {
				
				session.setAttribute("success", "Book updated Successfully");
				resp.sendRedirect("admin/allbooks.jsp");
			}
			else {
				session.setAttribute("fail", "Something went wrong");
				resp.sendRedirect("admin/allbooks.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
}
