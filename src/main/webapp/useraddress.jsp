<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Address</title>
<%@include file="allComponents/allCss.jsp" %>
</head>
<body>

<%@include file="allComponents/navbar.jsp" %>

<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 p-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Add Address</h4>
						
						<c:if test="${not empty success }">
						<p class="text-center text-success">${success}</p>
						<c:remove var="success" scope="session"/>
						</c:if>
						
						<c:if test="${not empty fail }">
						<p class="text-center text-danger">${fail}</p>
						<c:remove var="fail" scope="session"/>
						</c:if>
						
						<form action="../addbooks" method="post" enctype="multipart/form-data">
							
							<div class="form-group">
							    <label for="exampleInputEmail1">Address</label>
							    <input name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
							</div>
							
							<div class="form-group">
							    <label for="exampleInputEmail1">Landmark</label>
							    <input name="email" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
							</div>
							
							<div class="form-group">
							    <label for="exampleInputEmail1">City</label>
							    <input name="phone" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
							</div>
							
							<div class="form-group">
							    <label for="exampleInputEmail1">State</label>
							    <input name="pass" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
							</div>
							
							<div class="form-group">
							    <label for="exampleInputEmail1">Zip</label>
							    <input name="pass" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
							</div>
							
							<button type="submit" class="btn btn-warning">Add Address</button>
						
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>