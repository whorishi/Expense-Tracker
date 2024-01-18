<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
	.card-sh{
		box-shadow: 0 0 6px 0 rgba(0,0,0,0.3);
	}
</style>
<%@include file="component/allcss.jsp"%>
</head>
<body class="bg-light">
	<%@include file="component/navbar.jsp"%>
	<div class="container p-5 ">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card card-sh">
					<div class="card-header">
						<p class="text-center fs-3">REGISTER</p>
						<c:if test="${not empty OnSuccess }">
							<p class="text-center text-success fs-2">${OnSuccess}</p>
							<c:remove var="OnSuccess"/>
						</c:if>
						<c:if test="${not empty OnFail }">
							<p class="text-center text-danger fs-2">${OnFail}</p>
							<c:remove var="OnFail"/>
						</c:if>
					</div>
					<div class="card-body">
						<form action="user_register" method="post">
							<div class="mb-3">
								<label>Full Name</label>
								<input required type="text" name="fullname" class="form-control">
							</div>
							<div class="mb-3">
								<label>Email</label>
								<input required type="email" name="email" class="form-control">
							</div>
							<div class="mb-3">
								<label>Password</label>
								<input required type="password" name="password" class="form-control">
							</div>
							<div class="mb-3">
								<label>About</label>
								<input type="text" name="about" class="form-control">
							</div>
							<div class="mb-6">
								<button class="btn btn-success col-md-12">Register</button>
							</div>
							
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>