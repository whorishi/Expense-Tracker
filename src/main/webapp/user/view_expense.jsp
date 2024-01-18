<%@page import="com.entity.Expense"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Expenses</title>
<%@include file="../component/allcss.jsp"%>
</head>
<body>
	<c:if test="${empty userObj }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	<%@include file="../component/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-8 offset-md-2 mt-4">
				<div class="card">
					<div class="card-header text-center">
						<p class="mt-4">All Expenses</p>
					</div>
					<div class="card-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Id</th>
									<th scope="col">Title</th>
									<th scope="col">Description</th>
									<th scope="col">Date</th>
									<th scope="col">Amount</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("userObj");
								ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
								List<Expense> expenses = dao.getExpenseByUserId(user);

								for (Expense ex : expenses) {
								%>
								<tr>
									<th><%=ex.getId()%></th>
									<td><%=ex.getTitle()%></td>
									<td><%=ex.getDesc()%></td>
									<td><%=ex.getDate()%></td>
									<td><%=ex.getAmount()%></td>
									<td><a href="#" class="btn btn-sm btn-warning me-1">Edit</a>
										<a href="#" class="btn btn-sm btn-danger me-1">Delete</a></td>
								</tr>


								<%
								}
								%>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>