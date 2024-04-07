<%@page import="com.entity.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.OrderDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Page</title>
<%@include file="allComponents/allCss.jsp"%>
</head>
<body>

<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<%@include file="allComponents/navbar.jsp"%>

	<div class="container p-1">

		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			User u=(User)session.getAttribute("userobj");
			OrderDaoImpl dao = new OrderDaoImpl(DBConnect.getConn());
			List<Order> list=dao.getBook(u.getEmail());
			for(Order b:list){
			%>
				<tr class="text-success">
					<th><%=b.getOrderId() %></th>
					<td><%=b.getUsername() %></td>
					<td><%=b.getBookname() %></td>
					<td><%=b.getAuthor() %></td>
					<td><%=b.getPrice() %></td>
					<td><%=b.getPaymentType() %></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

	</div>


</body>
</html>