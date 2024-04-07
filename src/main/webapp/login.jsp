<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>     

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Login</title>
<%@include file="allComponents/allCss.jsp" %>
</head>
<body>
	<%@include file="allComponents/navbar.jsp"%>
	
	<div class="container mt-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						
						<h2 class="text-center">Login page</h2>
						
						<c:if test="${not empty fail }">
						<p class="text-center text-danger">${fail}</p>
						<c:remove var="fail" scope="session"/>
						</c:if>
						
						<c:if test="${not empty success }">
						<p class="text-center text-success">${success}</p>
						<c:remove var="success" scope="session"/>
						</c:if>
						
						<form action="login" method="post">
						
							  <div class="form-group">
							    <label for="exampleInputEmail1">Email address</label>
							    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
							  </div>
							   
							  <div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
							  </div>
							 
							  <div class="text-center mt-1"> 
							  	<button type="submit" class="btn btn-primary">Login</button>
							  	<br>
							  	<a href="register.jsp">create Account</a>
							  </div>
							  
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%--  <%@include file="allComponents/footer.jsp" %> --%>
	
</body>
</html>