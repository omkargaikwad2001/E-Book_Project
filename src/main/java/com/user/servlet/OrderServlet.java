package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;

import com.DAO.CratDaoImpl;
import com.DAO.OrderDaoImpl;
import com.DB.DBConnect;
import com.entity.Cart;
import com.entity.Order;

@WebServlet("/orderserv")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name=req.getParameter("name");
			String email=req.getParameter("email");
			String phone=req.getParameter("phno");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("zip");
			String payment=req.getParameter("pay");
			
			
			String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
			
			HttpSession session=req.getSession();
			CratDaoImpl dao = new CratDaoImpl(DBConnect.getConn());
			
			List<Cart> clist= dao.getBookByUser(id);
			
			if(clist.isEmpty()) {
				session.setAttribute("fail", "Add Items in cart first");
				resp.sendRedirect("cart.jsp");
				
			}
			else {
				OrderDaoImpl dao2 =new OrderDaoImpl(DBConnect.getConn());
				
//				int i=dao2.getOrderNum();
				
				Order o = null;
				
				ArrayList<Order> orderList =new ArrayList<Order>();
				
				Random r = new Random();
				
				for(Cart c:clist) {
//					i++;
					o=new Order();
					o.setOrderId("Order ID "+r.nextInt(1000));
					o.setUsername(name);
					o.setEmail(email);
					o.setPhno(phone);
					o.setFulladd(fullAdd);
					o.setBookname(c.getBookname());
					o.setAuthor(c.getAuthor());
					o.setPrice(c.getPrice()+"");
					o.setPaymentType(payment);
					
					orderList.add(o);
					
				}
				
				if("noselect".equals(payment)) {
					session.setAttribute("fail", "Choose Payment method");
					resp.sendRedirect("cart.jsp");
				}
				else {
					
					boolean f = dao2.saveOrder(orderList);
				
					if(f) {
						resp.sendRedirect("ordersuccess.jsp");
						
					}else {
						
						session.setAttribute("fail", "Order failed");
						resp.sendRedirect("cart.jsp");
						
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
}
