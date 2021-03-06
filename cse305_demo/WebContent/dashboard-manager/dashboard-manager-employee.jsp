<%@page import="yeohangout.javabeans.EmployeeJude"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="dashboard for managers" />
<meta name="author" content="jude hokyoon woo - yeo hang out" />
<title>Yeo Hang Out</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/assets/css/dashboard.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/datatables.min.css" />
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="../index.jsp">Yeo Hang Out</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/index.jsp">HOME</a></li>
					<li><a href="#">SETTINGS</a></li>
					<li><a href="${pageContext.request.contextPath}/logout">LOG OUT</a></li>
					<li><a href="#">Help</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%ArrayList<EmployeeJude> emplArr = (ArrayList<EmployeeJude>) session.getAttribute("emplArr"); %>

	<!-- AddTable Modal -->
	<div class="modal fade" id="addTable" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>Add Employee</h4>
				</div>
				<div class="modal-body">
					<form role="form" data-toggle="validator" action="../add-employee" class="form-horizontal" method="post">
						<div class="form-group">
							<label class="control-label col-sm-4" for="text">First
								Name:</label>
							<div class="col-sm-8">
								<input type="text" name="firstName" class="form-control" placeholder="First Name">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for="text">Last
								Name:</label>
							<div class="col-sm-8">
								<input type="text" name="lastName" class="form-control" placeholder="Last Name">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for="text">SSN:</label>
							<div class="col-sm-8">
								<input type="text" name="SSN" class="form-control" placeholder="SSN">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for="text">isManager:</label>
							<div class="col-sm-8">
								<input type="text" name="isManager" class="form-control" placeholder="isManager">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for="text">Start
								Date:</label>
							<div class="col-sm-8">
								<input type="text" name="startDate" class="form-control" placeholder="YYYY-MM-DD">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for="text">Hourly
								Rate:</label>
							<div class="col-sm-8">
								<input type="text" name="hourlyRate" class="form-control" placeholder="Hourly Rate">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for="text">User
								Name:</label>
							<div class="col-sm-8">
								<input type="text" name="userName" class="form-control" placeholder="User Name">
							</div>
						</div>
						<div class="form-group">
							<label class="control-label col-sm-4" for="text">Password:</label>
							<div class="col-sm-8">
								<input type="text" name="pwd" class="form-control" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-4 col-sm-8">
								<button type="submit" class="btn btn-default btn-md pull-right">Update</button>
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<h5>Powered by <a>Yeo Hang Out</a></h5>
				</div>
			</div>
		</div>
	</div>
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">
				<ul class="nav nav-sidebar">
					<li><a href="dashboard-manager-overview.jsp">Overview </a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li class="active"><a href="#">Manage Employee <span
							class="sr-only">(current)</span>
					</a></li>
					<li><a href="../view-customer">Manage Customer</a></li>
				</ul>
				<ul class="nav nav-sidebar">
					<li><a href="${pageContext.request.contextPath}/view-sales-report">View Sales Report</a></li>
					<li><a href="${pageContext.request.contextPath}/view-reservation">View Reservation</a></li>
					<li><a href="${pageContext.request.contextPath}/view-total-revenue">View Total Revenue</a></li>					
					<li><a href="${pageContext.request.contextPath}/view-flight">View Flight</a></li>
					<li><a href="${pageContext.request.contextPath}/view-customer-seated">View Customer</a></li>
				</ul>
				<ul>
					<li><a data-toggle="modal" data-target="#addAirline"><span
							class="glyphicon glyphicon-user"></span>Add Airline</a></li>
					<li><a data-toggle="modal" data-target="#addFlight"><span
							class="glyphicon glyphicon-user"></span>Add Flight</a></li>
					<li><a data-toggle="modal" data-target="#addAirport"><span
							class="glyphicon glyphicon-user"></span>Add Airport</a></li>
					<li><a data-toggle="modal" data-target="#addLeg"><span
							class="glyphicon glyphicon-user"></span>Add Leg</a></li>
				</ul>
			</div>
			<div
				class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<h1 class="page-header">Manage Employee</h1>
				<a role="button" class="btn btn-default btn-md" data-toggle="modal" 
						data-target="#addTable">Add</a> 
				<div>
					<!-- For Padding -->
					<br>
				</div>
				<div class="table-responsive">
					<table id="test-table1" class="table table-striped">
						<thead>
							<tr>
								<th>SSN</th>
								<th>Name</th>
								<th>isManager</th>
								<th>Start Date</th>
								<th>Hourly Rate</th>
								<th>User Name</th>
								<th>Password</th>
								<th>Delete</th>
								<th>Edit</th>
							</tr>
						</thead>
						<tbody>
						<% 
						ArrayList<Integer> ssnArray = new ArrayList<Integer>();
						
						for (int i=0; i<emplArr.size(); i++) { 
							String fn = emplArr.get(i).getFirstName();
							String ln = emplArr.get(i).getLastName();
							String full = fn + " " + ln;
							ssnArray.add(emplArr.get(i).getSSN());
							
							
 						%>
							<tr>
								<td><%= emplArr.get(i).getSSN() %></td>
								<td><%= full %></td>
								<td><%= emplArr.get(i).isManager() %></td>
								<td><%= emplArr.get(i).getStartDate() %></td>
								<td><%= emplArr.get(i).getHourlyRate() %></td>
								<td><%= emplArr.get(i).getUserName() %></td>
								<td><%= emplArr.get(i).getPwd() %></td>
								
								<td>
								<% 
									session.setAttribute("dash_delete_emp", emplArr.get(i).getSSN());
								%>
								<a role="button" class="btn btn-default btn-md" href="../delete-employee">Delete</a></td>
								
								<td>
								<% 
									session.setAttribute("dash_edit_emp", i);
									session.setAttribute("emp_ssn_arr", ssnArray);
								%>
								<a role="button" class="btn btn-default btn-md" data-toggle="modal"
									data-target="#editTable-<%= i %>" tabindex=i>Edit</a></td>
									
								
								<%@ include file = "../dashboard-manager/dashboard-manager-employee-edit.jsp" %>
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
		
	<%@include file="../dashboard-manager/employee_add.jsp" %>
<%@include file="../dashboard-manager/employee_add_flight.jsp"%>	
<%@include file="../dashboard-manager/employee_add_airport.jsp" %>		
<%@include file="../dashboard-manager/employee_add_leg.jsp" %>
	
	
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
	<!-- Jquery JS-->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
	<!-- Bootstrap JS -->
	<script src="${pageContext.request.contextPath}/assets/js/dashboard.js"></script>
	<!-- Dashboard JS -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/datatables.min.js"></script>
	<script src="${pageContext.request.contextPath}assets/js/validator.min.js"></script> <!-- Boostrap DTP JS -->
	

</body>
</html>