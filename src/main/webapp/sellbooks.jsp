<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Books</title>
<%@include file="allComponents/allCss.jsp" %>
</head>
<body>

<c:if test="${empty userobj}">
	<c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="allComponents/navbar.jsp" %>

<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4 p-3">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Sell Old Books</h4>
						
						<c:if test="${not empty success }">
						<p class="text-center text-success">${success}</p>
						<c:remove var="success" scope="session"/>
						</c:if>
						
						<c:if test="${not empty fail }">
						<p class="text-center text-danger">${fail}</p>
						<c:remove var="fail" scope="session"/>
						</c:if>
						
						<form action="addoldbook" method="post" enctype="multipart/form-data">
							
							<input type="hidden" name="email" value="${userobj.email}">
							
							<div class="form-group">
							    <label for="exampleInputEmail1">Book Name</label>
							    <input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
							</div>
							
							<div class="form-group">
							    <label for="exampleInputEmail1">Author Name</label>
							    <input name="author" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
							</div>
							
							<div class="form-group">
							    <label for="exampleInputEmail1">Price</label>
							    <input name="price" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">
							</div>
							
							<div class="form-group">
								<label for="inputState">Upload Photo</label>
								<input name="bimg" type="file" class="form-control-file"></input>
							</div>
							
							<button type="submit" class="btn btn-primary">Sell</button>
						
						</form>
						
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>