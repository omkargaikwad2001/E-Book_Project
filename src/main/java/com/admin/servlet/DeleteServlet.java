package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDaoImpl;
import com.DB.DBConnect;

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			BooksDaoImpl dao = new BooksDaoImpl(DBConnect.getConn());
			
			boolean f = dao.deleteBooks(id);
			
			HttpSession session=req.getSession();
			
			if(f) {
				
				session.setAttribute("success", "Book deleted Successfully");
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
