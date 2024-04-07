<%@page import="java.util.List"%>
<%@page import="com.entity.Bookdetails"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BooksDaoImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Old Book</title>
<%@include file="allComponents/allCss.jsp"%>
</head>
<body>

	<%@include file="allComponents/navbar.jsp"%>

	<c:if test="${not empty success }">
		<p class="text-center text-success">${success}</p>
		<c:remove var="success" scope="session" />
	</c:if>


	<div class="container p-1">

		<table class="table table-striped mt-3">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>

				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();
				BooksDaoImpl dao = new BooksDaoImpl(DBConnect.getConn());
				List<Bookdetails> list = dao.getBookByOld(email, "old");
				for (Bookdetails b : list) {
				%>

				<tr class="text-success">
					<td><%=b.getBookname()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a href="deleteoldbookserv?em=<%=email%>&&id=<%=b.getBookId() %>"
						class="btn btn-sm btn-danger">Delete</a></td>

				</tr>
				<%
				}
				%>
			</tbody>
		</table>

	</div>


</body>
</html>