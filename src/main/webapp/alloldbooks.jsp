<%@page import="com.entity.Bookdetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BooksDaoImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Old Books</title>

<%@include file="allComponents/allCss.jsp" %>

</head>
<body style="background-color: #f7f7f7">
	
	<!-- navbar -->
	<%@include file="allComponents/navbar.jsp" %>
		
	<!-- Start Old book section -->
	
	<div class="container mt-3">
		<h3 class="text-center">Old Books</h3>
		<div class="row">
			
			
			<%
			BooksDaoImpl dao = new BooksDaoImpl(DBConnect.getConn());
			List<Bookdetails> list=dao.getAllOldBook();
			
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
						<!--  
							<a href="" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							-->
							<a href="viewbooks.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-5">View Details</a>
							<a href="#" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<% 	
			}
			%>
		</div>
	</div>
	<!-- end old book section -->
	
	
	<!-- footer -->
	<%@include file="allComponents/footer.jsp" %>
</body>
</html>