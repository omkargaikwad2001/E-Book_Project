<%@page import="com.entity.User"%>
<%@page import="com.entity.Bookdetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BooksDaoImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All New Books</title>

<%@include file="allComponents/allCss.jsp"%>
<style type="text/css">

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}


</style>

</head>
<body style="background-color: #f7f7f7">
<% 
User u=(User)session.getAttribute("userobj");
%>
	<c:if test="${not empty addcart}">

		<div id="toast">${addcart}</div>

		<script type="text/javascript">
		showToast();
		function showToast(content)
		{
		    $('#toast').addClass("display");
		    $('#toast').html(content);
		    setTimeout(()=>{
		        $("#toast").removeClass("display");
		    },2000)
		}	
</script>

<c:remove var="addcart" scope="session"/>

	</c:if>

	<!-- navbar -->
	<%@include file="allComponents/navbar.jsp"%>

	<!-- Start new book section -->

	<div class="container mt-3">
		<h3 class="text-center">New Books</h3>
		<div class="row">


			<%
			BooksDaoImpl dao = new BooksDaoImpl(DBConnect.getConn());
			List<Bookdetails> list = dao.getAllNewBook();

			for (Bookdetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card text-center" style="width: 105%">
					<div class="card-body text-center">

						<div style="height: 250px; width: 100%; overflow: hidden;"
							class="text-center">
							<img alt="img not found" src="book/<%=b.getPhoto()%>"
								style="width: 100%" ;height="100%" ; class="img-thumblin">
						</div>
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row">
							
							 <%if(u==null)
							{ 
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm ml-2">Add Cart</a>							
							<% 
							}else{
							%>
							<a href="cartservlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-2">Add Cart</a>
							<%
							}
							%>
							
							<a href="" class="btn btn-success btn-sm ml-1">View Details</a> <a
								href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<!-- end new book section -->


	<!-- footer -->
	<%@include file="allComponents/footer.jsp"%>
</body>
</html>