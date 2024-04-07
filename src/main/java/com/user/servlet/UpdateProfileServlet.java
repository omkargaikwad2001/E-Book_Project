package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDaoImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/updateprofile")
public class UpdateProfileServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("pass");
			
			User us=new User();
			us.setId(id);
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			
			HttpSession session=req.getSession();
			UserDaoImpl dao = new UserDaoImpl(DBConnect.getConn());
			
			boolean f=dao.checkpass(id, password);
			
			if(f) {
				
				boolean f2=dao.updateProfile(us);
				if(f2) {
					
					session.setAttribute("success", "User updated Successfully");
					resp.sendRedirect("editprofile.jsp");
				}
				else {
					session.setAttribute("fail", "Something Wrong on server");
					resp.sendRedirect("editprofile.jsp");
				}
				
			}else {
				
				session.setAttribute("fail", "Your Password is Incorrect");
				resp.sendRedirect("editprofile.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
}
