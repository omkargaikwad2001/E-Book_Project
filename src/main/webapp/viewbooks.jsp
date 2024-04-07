<%@page import="com.entity.Bookdetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Books</title>
<%@include file="allComponents/allCss.jsp" %>
</head>
<body style="background-color: #f7f7f7">
	
	<%@include file="allComponents/navbar.jsp" %>
	
	<%
	int bid=Integer.parseInt(request.getParameter("bid"));	
	BooksDaoImpl dao = new BooksDaoImpl(DBConnect.getConn());
	Bookdetails b = dao.getBookById(bid);
	%>
	
	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 text-center p-5 border">
				<img alt="" src="book/<%=b.getPhoto()%>" style="height:250px; width: 250px"><br>
				<h4 class="mt-3">Book Name: <span class="text-success"><%=b.getBookname()%></span></h4>
				<h4>Author Name:<span class="text-success"><%=b.getAuthor()%></span></h4>
				<h4>Category: <span class="text-success"><%=b.getBookCategory()%></span></h4>
			</div>
			
			<div class="col-md-6 text-center p-5 border">
				<h2><%=b.getBookname()%></h2>
				
				<%
				if("old".equals(b.getBookCategory())){
				%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5>
					<i class="fa-solid fa-envelope"></i>Email:<span class="text-success"><%=b.getEmail()%></span>
				</h5>
				<% 	
				}
				%>
				
				
				
				<div class="row">
				
					<div class="col-md-4 text-center text-danger p-2"><i class="fa-solid fa-money-bill fa-3x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-center text-danger p-2"><i class="fa-solid fa-arrow-rotate-left fa-3x"></i>
						<p>Return Available</p>
					</div>
					
					<div class="col-md-4 text-center text-danger p-2"><i class="fa-solid fa-truck fa-3x"></i>
						<p>Free Delivery</p>
					</div>
						
				</div>
				
				 
				<%
				if("old".equals(b.getBookCategory())){
				%>
				<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i>Continue Shopping</a>
					<a href="#" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i>200</a>
				</div>
				
				<%
				}else{
				%>
					
				<div class="text-center p-3">
				<a href="" class="btn btn-primary"><i class="fa-solid fa-cart-shopping"></i>Add to Cart</a>
				<a href="#" class="btn btn-danger"><i class="fa-solid fa-indian-rupee-sign"></i>200</a>
				</div>
				<%
				}
				%>	
			</div>
			
		</div>
	</div>
	

</body>
</html>