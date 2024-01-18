<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="component/allcss.jsp"%>
<style>
	.card-sh{
		box-shadow: 0 0 6px 0 rgba(0,0,0,0.3);
	}
</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container p-5 ">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card card-sh">
					<div class="card-header">
						<p class="text-center fs-3">Login</p>
					</div>
					<c:if test="${not empty LoginFail }">
						<p class="text-center text-danger fs-2">${LoginFail}</p>
						<c:remove var="LoginFail" />
					</c:if>
						<c:if test="${not empty logoutSuccess }">
						<p class="text-center text-danger fs-5 p-2">${logoutSuccess}</p>
						<c:remove var="logoutSuccess" />
					</c:if>
					<div class="card-body">
						<form action="user_login" method="post">
							<div class="mb-3">
								<label>Email</label> <input required type="email" name="email"
									class="form-control">
							</div>
							<div class="mb-3">
								<label>Password</label> <input required type="password"
									name="password" class="form-control">
							</div>
							<div class="text-center">
								<button class="btn btn-success col-md-12">Login</button>
							</div>
							<p>
								Don't Have an Account?<a href="register.jsp">create one</a>
							</p>


						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>