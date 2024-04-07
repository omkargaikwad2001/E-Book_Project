<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Success</title>
<%@include file="allComponents/allCss.jsp" %>
</head>
<body>
	<%@include file="allComponents/navbar.jsp"%>
	
	<div class="container text-center mt-3">
		<i class="fas fa-check-circle fa-5x text-success"></i>
		<h1>Thank You</h1>
		<h2>Your Order has been placed successfully</h2>
		<h5>With in 7 Days Your Order will be Delivered</h5>
		<a href="index.jsp" class="btn btn-primary mt-3">Home</a>
		<a href="order.jsp" class="btn btn-danger mt-3">View Order</a>
	</div>

</body>
</html>