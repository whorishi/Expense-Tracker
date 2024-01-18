<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-success">
	<div class="container-fluid">
		<a class="navbar-brand" href="#">Expense Tracker</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">

				<c:if test="${empty userObj}">
					<li class="nav-item"><a class="nav-link active"
						href="index.jsp">
							 Home</a></li>
				</c:if>

				<c:if test="${not empty userObj}">
					<li class="nav-item"><a class="nav-link active"
						href="home.jsp">
							 Home</a></li>
				
					<li class="nav-item"><a class="nav-link active"
						href="add_expense.jsp"><i class="fa-solid fa-cash-register"></i>
							 Add Expense</a></li>

					<li class="nav-item"><a class="nav-link active"
						href="view_expense.jsp" tabindex="-1"><i
							class="fa-solid fa-book"></i> View Expense</a></li>
				</c:if>



			</ul>
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<c:if test="${not empty userObj}">
					<li class="nav-item"><a class="nav-link active"
						href="home.jsp"><i class="fa-solid fa-user"></i>
							${userObj.name}</a></li>

					<li class="nav-item"><a class="nav-link active"
						href="../user_logout" tabindex="-1"><i
							class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
				</c:if>

				<c:if test="${empty userObj}">
					<li class="nav-item"><a class="nav-link active"
						href="login.jsp"><i class="fa-solid fa-right-to-bracket"></i>
							Login</a></li>

					<li class="nav-item"><a class="nav-link active"
						href="register.jsp" tabindex="-1"><i
							class="fa-solid fa-user-plus"></i> Register</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</nav>