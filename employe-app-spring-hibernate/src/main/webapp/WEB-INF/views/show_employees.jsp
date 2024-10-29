<%@page import="com.nit.entity.Employee"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EMS-Home</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script type="text/javascript">
	function deleteEmployee(id) {
		var status = confirm("Do you want to delete?");
		if (status) {
			document.frm.emp_id.value = id;
			document.frm.action = "deleteEmployee";
			document.frm.method = "post";
			document.frm.submit();
		}
	}
	function editEmployee(id) {
		document.frm.emp_id.value = id;
		document.frm.action = "editEmployee";
		document.frm.method = "post";
		document.frm.submit();
	}
</script>
</head>
<body>
	<div class="container">
		<h1>Employee Management System</h1>
		<a class="btn btn-outline-info" href="addEmployee">Add Employee</a>
		<form name="frm">
			<input type="hidden" name="emp_id" />
			<table class="table table-striped-columns">
				<%
				List<Employee> employees = (List<Employee>) request.getAttribute("emps");
				if (employees.isEmpty()) {
				%>
				<tr>
					<td colspan="6">No Employees found!!</td>
				</tr>
				<%
				}
				for (Employee emp : employees) {
				%>
				<tr>
					<td><%=emp.getId()%></td>
					<td><%=emp.getName()%></td>
					<td><%=emp.getAddress()%></td>
					<td><%=emp.getSalary()%></td>
					<td><input type="button" class="btn btn-outline-primary" value="Edit"
						onclick="editEmployee('<%=emp.getId()%>')" /></td>
					<td><input type="button" class="btn btn-outline-danger" value="Delete"
						onclick="deleteEmployee('<%=emp.getId()%>')" /></td>
				</tr>
				<%
				}
				%>
			</table>
		</form>
	</div>
</body>
</html>