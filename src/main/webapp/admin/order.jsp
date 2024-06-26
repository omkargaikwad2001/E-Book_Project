<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.OrderDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order</title>
<%@include file="allCss.jsp" %>

</head>
<body>

<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	
<%@include file="navbar.jsp" %>

	<h3 class="text-center">Hello Admin</h3>
	
	<table class="table table-striped">
  		
  		 <thead class="bg-primary text-white">
		    <tr>
		      <th scope="col">Order Id</th>
		      <th scope="col">Name</th>
		      <th scope="col">Email</th>
		      <th scope="col">Address</th>
		      <th scope="col">Phone</th>
		      <th scope="col">Book Name</th>
		      <th scope="col">Author</th>
		      <th scope="col">Price</th>
		      <th scope="col">Payment type</th>
		    </tr>
  		</thead>
		  <tbody>
		  
		  <%
		  OrderDaoImpl dao = new OrderDaoImpl(DBConnect.getConn());
		  List<Order> blist=dao.getAllOrder();
		  for(Order o:blist)
		  {
		  %>
		  
		    <tr>
		      <th scope="row"><%=o.getOrderId() %></th>
		      <td><%=o.getUsername() %></td>
		      <td><%=o.getEmail() %></td>
		      <td><%=o.getFulladd() %></td>
		      <td><%=o.getPhno() %></td>
		      <td><%=o.getBookname() %></td>
		      <td><%=o.getAuthor() %></td>
		      <td><%=o.getPrice() %></td>
		      <td><%=o.getPaymentType() %></td>
		    </tr>
	
		  <%}
		  %>

	  	  </tbody>	 
	</table>
	
	<div style="margin-top: 31%">
	<%@include file="footer.jsp" %>
	</div>
	
</body>
</html>