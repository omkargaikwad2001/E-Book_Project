<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>     
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook : Register</title>
<%@include file="allComponents/allCss.jsp" %>
</head>
<body>
	<%@include file="allComponents/navbar.jsp"%>
	
	<div class="container mt-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						
						<h2 class="text-center">Registration page</h2>
						
						<c:if test="${not empty success }">
						<p class="text-center text-success">${success}</p>
						<c:remove var="success" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failed }">
						<p class="text-center text-danger">${failed}</p>
						<c:remove var="failed" scope="session"/>
						</c:if>
						
						<form action="register" method="post">
								
							  <div class="form-group">
							    <label for="exampleInputEmail1">Full Name</label>
							    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
							  </div>
			
						
							  <div class="form-group">
							    <label for="exampleInputEmail1">Email address</label>
							    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
							  </div>
							  
							  <div class="form-group">
							    <label for="exampleInputEmail1">Phone</label>
							    <input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="phno">
							  </div>
							  
							  <div class="form-group">
							    <label for="exampleInputPassword1">Password</label>
							    <input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
							  </div>
							  
							  <div class="form-check">
							    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
							    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
							  </div>
							  
							  <button type="submit" class="btn btn-primary">Submit</button>
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="allComponents/footer.jsp" %>
	
</body>
</html>