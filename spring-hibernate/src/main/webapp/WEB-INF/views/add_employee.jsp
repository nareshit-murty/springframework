<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<style>
.error {
	color: #ff0000;
	font-style: italic;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Employee Form</h1>
		<form:form action="saveEmployee" method="post" modelAttribute="employee">
			<div class="form-floating mb-3">
				<form:input path="name" class="form-control" id="floatingName" placeholder="Name" />
				<label for="floatingName">Name</label>
				<form:errors path="name" cssClass="error"/>
			</div>
			<div class="form-floating">
				<form:input path="address"  maxlength="50" class="form-control" id="floatingAddress" placeholder="Address" />
				<label for="floatingAddress">Address</label>
				<form:errors path="address"  cssClass="error"/>
			</div>
			<div class="form-floating">
				<form:input path="salary" maxlength="10" class="form-control" id="floatingSalary" placeholder="Salary" />
				<label for="floatingSalary">Salary</label>
				<form:errors path="salary"  cssClass="error"/>
			</div>
			<br/>
			<div class="form-floating">
				<input class="btn btn-outline-success" type="submit" value="Save Employee" /> 
				<a class="btn btn-outline-danger" href="getAllEmployees">Cancel</a>
			</div>
		</form:form>
	</div>
</body>
</html>