package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BooksDaoImpl;
import com.DAO.CratDaoImpl;
import com.DB.DBConnect;

@WebServlet("/deleteoldbookserv")
public class DeleteOldBook extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		
		try {
			
			
			String em=req.getParameter("em");
			int id=Integer.parseInt(req.getParameter("id"));
			
			BooksDaoImpl dao = new BooksDaoImpl(DBConnect.getConn());
			
			boolean f = dao.oldBookDelete(em, "old",id);
			
			HttpSession session=req.getSession();
			
			if(f) {
				session.setAttribute("success", "Old Book Deleted Successfully");
				resp.sendRedirect("deleteoldbook.jsp");
			}
			else {
				session.setAttribute("fail", "Something went wrong");
				resp.sendRedirect("deleteoldbook.jsp");
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
