<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting page</title>
<%@include file="allComponents/allCss.jsp" %>
<style type="text/css">
	
	a{
		text-decoration: none;
		color: black;
	}
	
	a:hover{
		text-decoration: none;
	}

</style>

</head>
<body>

<c:if test="${empty userobj}">
	<c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="allComponents/navbar.jsp" %>

	<div class="container">
	
		<h3 class="text-center mt-3">Hello,${userobj.name}</h3>
	
		<div class="row p-5">
			<div class="col-md-4">
				<a href="sellbooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h3>Sell Old Books</h3>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="deleteoldbook.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-book-open fa-3x"></i>
							</div>
							<h3>Delete Old Books</h3>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="editprofile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fa-solid fa-user-pen fa-3x"></i>
							</div>
							<h3>Edit profile</h3>
						</div>
					</div>
				</a>
			</div>
			
			
			<div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fa-solid fa-truck fa-3x"></i>
							</div>
							<h3>My Order</h3>
							<p>Track your Order</p>
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-6 mt-3">
				<a href="helpline.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fa-solid fa-handshake-angle fa-3x"></i>
							</div>
							<h3>Help Center</h3>
							<p>24/7 Service</p>
						</div>
					</div>
				</a>
			</div>
			
				
		</div>
	</div>
<!-- footer -->
	<%@include file="allComponents/footer.jsp" %>
</body>
</html>