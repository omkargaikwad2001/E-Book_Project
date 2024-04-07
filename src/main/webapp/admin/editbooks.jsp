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
<title>Edit Books</title>

<%@include file="allCss.jsp" %>

</head>
<body>
	<%@include file="navbar.jsp" %>
	
	<c:if test="${empty userobj }">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 p-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Books</h4>
						
						<%
							
						int id=Integer.parseInt(request.getParameter("id"));
						BooksDaoImpl dao = new BooksDaoImpl(DBConnect.getConn());
						Bookdetails b= dao.getBookById(id);
						
						%>
						
						<form action="../editbooks" method="post">
						
						<input type="hidden" name="id" value="<%=b.getBookId()%>">
							
							<div class="form-group">
							    <label for="exampleInputEmail1">Book Name</label>
							    <input name="bname" type="text" value="<%=b.getBookname()%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
							</div>
							
							<div class="form-group">
							    <label for="exampleInputEmail1">Author Name</label>
							    <input name="author" type="text" value="<%=b.getAuthor()%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
							</div>
							
							<div class="form-group">
							    <label for="exampleInputEmail1">Price</label>
							    <input name="price" type="number" value="<%=b.getPrice()%>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
							</div>
														
							<div class="form-group">
								<label for="inputState">Book Status</label>
								<select id="inputState" name="status" class="form-control">
									
									<%
									if("Avtive".equals(b.getStatus())){
									%>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
									<% 
									}else{
									%>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
										
									<%
									}
									%>
									
								</select>
							</div>
							
							<button type="submit" class="btn btn-primary">Edit</button>
						
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 3%">
	<%@include file="footer.jsp" %>
	</div>
</body>
</html>