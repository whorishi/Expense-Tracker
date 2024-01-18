<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="../component/allcss.jsp"%>
<style>
.card-sh {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>
</head>
<body class="bg-light">
	<c:if test="${empty userObj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<%@include file="../component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card card-sh mt-5">
					<div class="card-header text-center">
						<p class="fs-3">Add Expense</p>
						<c:if test="${not empty ExpenseSuccess }">
							<p class="text-center text-success fs-2">${ExpenseSuccess}</p>
							<c:remove var="ExpenseSuccess" />
						</c:if>
						<c:if test="${not empty ExpenseFail }">
							<p class="text-center text-success fs-2">${ExpenseFail}</p>
							<c:remove var="ExpenseFail" />
						</c:if>
						<div class="card-body">
							<form action="../add_expense" method="post">
								<div class="mb-3">
									<label>Title</label> <input required type="text" name="title"
										class="form-control">
								</div>

								<div class="mb-3">
									<label>Date</label> <input required type="date" name="date"
										class="form-control">
								</div>

								<div class="mb-3">
									<label>Description</label> <input required type="text"
										name="description" class="form-control">
								</div>

								<div class="mb-3">
									<label>Amount</label> <input required type="text" name="amount"
										class="form-control">
								</div>

								<button type="submit" class="btn btn-success col-md-12">Add</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>