<%@page import="com.entity.Bookdetails"%>
<%@page import="java.util.List"%>
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
<title>All Books</title>
<%@include file="allCss.jsp" %>

</head>
<body>
<%@include file="navbar.jsp" %>

<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

	<h3 class="text-center">Hello Admin</h3>
	
	<c:if test="${not empty success }">
						<h5 class="text-center text-success">${success}</h5>
						<c:remove var="success" scope="session"/>
						</c:if>
						
						<c:if test="${not empty fail }">
						<h5 class="text-center text-danger">${fail}</h5>
						<c:remove var="fail" scope="session"/>
						</c:if>
	
	<table class="table table-striped">
  		
  		 <thead class="bg-primary text-white">
		    <tr>
		      <th scope="col">ID</th>
		      <th scope="col">Image</th>
		      <th scope="col">Book Name</th>
		      <th scope="col">Author</th>
		      <th scope="col">Price</th>
		      <th scope="col">Categories</th>
		      <th scope="col">Status</th>
		      <th scope="col">Action</th>
		    </tr>
  		</thead>
		  <tbody>
		  
		  <%
		  BooksDaoImpl dao=new BooksDaoImpl(DBConnect.getConn());
		  List<Bookdetails> list = dao.getAllBooks();
		  for(Bookdetails b:list){
			%>
			
			<tr>
		      <td><%=b.getBookId() %></td>
		      <td><img src="../book/<%=b.getPhoto()%>" style="width:50px; height:50px;"></td>
		      <td><%=b.getBookname()%></td>
		      <td><%=b.getAuthor()%></td>
		      <td><%=b.getPrice()%></td>
		      <td><%=b.getBookCategory()%></td>
		      <td><%=b.getStatus()%></td>
		      <td>
		      	<a href="editbooks.jsp?id=<%=b.getBookId()%>" class="btn btn-sm btn-primary">Edit</a>
		      	<a href="../delete?id=<%=b.getBookId()%>" class="btn btn-sm btn-danger">delete</a>
		      </td>
		    </tr>
			
			<%    
		  }
		  %>
		  </tbody>	 
	</table>
	<div style="margin-top: 30%">
	<%@include file="footer.jsp" %>
	</div>
</body>
</html>