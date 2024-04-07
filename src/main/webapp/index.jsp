<%@page import="com.entity.Bookdetails"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BooksDaoImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : index</title>

<%@include file="allComponents/allCss.jsp" %>

<style type="text/css">
	
	.back-img{
		
		background: url("img/book.jpg");
		height: 50vh;
		width: 100%;
		background-repeat: no-repeat;
		background-size: cover;
	}

</style>

</head>
<body>

<%
User u=(User)session.getAttribute("userobj");
%>
	
	<!-- navbar -->
	<%@include file="allComponents/navbar.jsp" %>
	
	<div class="container-fluid back-img">
		
		<h2 class="text-center text-white"><i class="fa-solid fa-book"></i>EBook Management System</h2>
		
	</div>
	
		
	<!-- Start new book section -->
	
	<div class="container mt-3">
		<h3 class="text-center">New Books</h3>
		<div class="row">
			
			
			<%
			BooksDaoImpl dao = new BooksDaoImpl(DBConnect.getConn());
			List<Bookdetails> list=dao.getNewBook();
			
			for(Bookdetails b:list){
			%>
			<div class="col-md-3">
			<div class="card text-center" style="width: 105%">
					<div class="card-body text-center">
					
						<div style="height: 250px; width:100%;overflow: hidden;" class="text-center">
						<img alt="img not found" src="book/<%=b.getPhoto() %>" style="width: 100%";height="100%"; class="img-thumblin">
						</div>
						<p><%=b.getBookname() %></p>
						<p><%=b.getAuthor() %></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row">
							
							<%if(u==null)
							{ 
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>							
							<% 
							}else{
							%>
							<a href="cartservlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<%
							}
							%>
							
							<a href="viewbooks.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
							
							<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa-solid fa-indian-rupee-sign"></i></a>
						
						</div>
					</div>
				</div>
			</div>
			<% 	
			}
			%>
		</div>
	</div>
	<div class="text-center mt-1">
		<a href="allnewbooks.jsp" class="btn btn-danger btn-sm text-white m-3">View All</a>
	</div>
	<!-- end new book section -->
	
	<hr>
	
	<!-- Start old book section -->
	
	<div class="container mt-3">
		<h3 class="text-center">Old Books</h3>
		<div class="row">
			
			
			<%
			BooksDaoImpl dao2 = new BooksDaoImpl(DBConnect.getConn());
			List<Bookdetails> list2=dao2.getOldBook();
			
			for(Bookdetails b:list2){
			%>
			<div class="col-md-3">
			<div class="card text-center" style="width: 105%">
					<div class="card-body text-center">
					
						<div style="height: 250px; width:100%;overflow: hidden;" class="text-center">
						<img alt="img not found" src="book/<%=b.getPhoto() %>" style="width: 100%";height="100%"; class="img-thumblin">
						</div>
						<p><%=b.getBookname() %></p>
						<p><%=b.getAuthor() %></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row">
							<!--  
							<a href="" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							-->
							<a href="viewbooks.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
							<a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<% 	
			}
			%>
		</div>
	</div>
	<div class="text-center mt-1">
		<a href="alloldbooks.jsp" class="btn btn-danger btn-sm text-white m-3">View All</a>
	</div>
	<!-- end old book section -->
	
	
	<!-- footer -->
	<%@include file="allComponents/footer.jsp" %>
</body>
</html>