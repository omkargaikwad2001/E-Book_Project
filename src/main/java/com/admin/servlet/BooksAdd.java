package com.admin.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BooksDaoImpl;
import com.DB.DBConnect;
import com.entity.Bookdetails;

@WebServlet("/addbooks")
@MultipartConfig
public class BooksAdd extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String bookname=req.getParameter("bname");
			String author=req.getParameter("author");
			double price=Double.parseDouble(req.getParameter("price"));
			String category=req.getParameter("categories");
			String status=req.getParameter("status");
			Part part=req.getPart("bimg");
			String fileName=part.getSubmittedFileName();
			
//			String email=req.getParameter("email");
			
			Bookdetails b = new Bookdetails(bookname,author,price,category,status,fileName,"admin");
			
			BooksDaoImpl dao = new BooksDaoImpl(DBConnect.getConn());
			
			boolean f= dao.addbooks(b);

			HttpSession session=req.getSession();
			
			if(f) {
				
				String realPath = getServletContext().getRealPath("") + "book";
			
				File file= new File(realPath);
				part.write(realPath + File.separator + fileName);
				
				session.setAttribute("success", "Book Added Successfully");
				resp.sendRedirect("admin/addbooks.jsp");
			}
			else {
				session.setAttribute("fail", "Something went wrong");
				resp.sendRedirect("admin/addbooks.jsp");
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
}
