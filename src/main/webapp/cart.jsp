<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CratDaoImpl"%>
<%@page import="com.DAO.CartDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@include file="allComponents/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7">
	<%@include file="allComponents/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>

	<c:if test="${not empty success}">

		<div class="alert alert-success" role="alert">${success}</div>
			
			<c:remove var="success" scope="session"/>

	</c:if>
	
		<c:if test="${not empty fail}">

		<div class="alert alert-danger" role="alert">${fail}</div>
			
			<c:remove var="fail" scope="session"/>

	</c:if>


	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Items</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>

								<%
								User u = (User) session.getAttribute("userobj");
								CratDaoImpl dao = new CratDaoImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());

								Double totalPrice = 0.0;

								for (Cart c : cart) {
									totalPrice = c.getTotalprice();
								%>

								<tr>
									<th><%=c.getBookname()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="removebook?bid=<%=c.getBid()%>&&uid=<%=c.getUid() %>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>

								<tr>
									<td>Total Price</td>
									<td><%=totalPrice%></td>
								</tr>

							</tbody>
						</table>
					</div>
				</div>

			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Details for order</h3>

						<form action="orderserv" method="post">
						
						<input type="hidden" value="${userobj.id}" name="id">

							<div class="row p-3">
								<div class="col">
									<label>Name</label>
									<input type="text" name="name" class="form-control" placeholder="Name" 
									value="<%=u.getName()%>" readonly="readonly" required="required">
								</div>
								<div class="col">
									<label>Email</label>
									<input type="email" name="email" class="form-control" placeholder="Email"
									value="<%=u.getEmail()%>" readonly="readonly" required="required">
								</div>
							</div>

							<div class="row p-3">
								<div class="col">
									<label>Mobile No</label>
									<input type="number" name="phno" class="form-control"
										placeholder="Mobile No" value="<%=u.getPhno()%>" readonly="readonly" required="required">
								</div>
								<div class="col">
									<label>Address</label>
									<input type="text" name="address" class="form-control" placeholder="Address" required="required">
								</div>
							</div>

							<div class="row p-3">
								<div class="col">
									<label>Landmark</label>
									<input type="text" name="landmark" class="form-control" placeholder="Landmark" required="required">
								</div>
								<div class="col">
									<label>City</label>
									<input type="text" name="city" class="form-control" placeholder="City" required="required">
								</div>

							</div>

							<div class="row p-3">
								<div class="col">
									<label>State</label>
									<input type="text" name="state" class="form-control" placeholder="State" required="required">
								</div>
								<div class="col">
									<label>Zip</label>
									<input type="number" name="zip" class="form-control" placeholder="Zip" required="required">
								</div>

							</div>

							<div class="form-group col-md-4">
								<label for="inputState">Payment Type</label> <select
									id="inputState" name="pay" class="form-control">
									<option value="noselect">--select--</option>
									<option value="COD">Cash On Delivery</option>
								</select>
							</div>

							<div class="text-center">
								<button class="btn btn-warning">Order Now</button>
								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>


						</form>

					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>