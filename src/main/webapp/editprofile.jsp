<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<%@include file="allComponents/allCss.jsp" %>
</head>
<body>

<%@include file="allComponents/navbar.jsp" %>

<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 p-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Edit Profile</h4>
						
						<c:if test="${not empty success }">
						<p class="text-center text-success">${success}</p>
						<c:remove var="success" scope="session"/>
						</c:if>
						
						<c:if test="${not empty fail }">
						<p class="text-center text-danger">${fail}</p>
						<c:remove var="fail" scope="session"/>
						</c:if>
						
						<form action="updateprofile" method="post">
						
						<input type="hidden" value="${userobj.id }" name="id">
							
							<div class="form-group">
							    <label for="exampleInputEmail1">Name</label>
							    <input name="fname" value="${userobj.name}" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
							</div>
							
							<div class="form-group">
							    <label for="exampleInputEmail1">Email Address</label>
							    <input name="email" value="${userobj.email}" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
							</div>
							
							<div class="form-group">
							    <label for="exampleInputEmail1">Phone</label>
							    <input name="phno" value="${userobj.phno}" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
							</div>
							
							<div class="form-group">
							    <label for="exampleInputEmail1">Password</label>
							    <input name="pass" type="password" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required">
							</div>
							
							<button type="submit" class="btn btn-primary">Update</button>
						
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>