<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="java.util.ArrayList" %>
<%@ page import="yeohangout.javabeans.Leg" %>
<%@ page import="yeohangout.javabeans.EmployeeJude"%>
<%@ page import="yeohangout.javabeans.LegFlightAirport" %>
<%@ page import = "yeohangout.mysql.SingletonForMulticity" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="description" content="dashboard for managers" />
<meta name="author" content="yeo hang out" />
<title>Yeo Hang Out</title>
<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath}/assets/css/dashboard.css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/datatables.min.css" />
<link href="${pageContext.request.contextPath}/assets/css/search.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css" /> <!-- Bootstrap DTP CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">

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
				<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Yeo Hang Out</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/index.jsp">HOME</a></li>
					<li><a href="#">SETTINGS</a></li>
					<li><a href="${pageContext.request.contextPath}/logout">LOG OUT</a></li>
					<li><a href="#">HELP</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%
	System.out.println("I COME");
		LegFlightAirport firstLeg = SingletonForMulticity.getFirstLeg();
		LegFlightAirport secondLeg =null;
		LegFlightAirport thirdLeg = null;
		
		double totalFare = firstLeg.getFare().getFare();
		String loginedUserID = (String) request.getAttribute("loginedUser");
		System.out.println("LOGINED : "+loginedUserID);
		int count = SingletonForMulticity.getCount();
		if(count>=1){
			secondLeg = SingletonForMulticity.getSecondLeg();
			totalFare+=secondLeg.getFare().getFare();
		}
		
		if(count == 2){
			thirdLeg = SingletonForMulticity.getThirdLeg();
			totalFare+=thirdLeg.getFare().getFare();
			
		}
	%>
	<div class="container-fluid">
		<div class="row">
			
				<div class="row">
					<h1 class="page-header col-xs-12">Review your Trip</h1>
				</div>
				<div class="row">
					<h2 class="bg-warning warning-text">Price Change<br><small>Because prices change often, we recommend booking now to lock in this price.</small></h2>
				</div>
				<%// this search-row will be spanned%>
				<div class="row search-row">
					<div class="row cart-row">
						<div class="row">
							<div class="col-xs-12 col-sm-4">
								<h3 class="no-wrap"><%= firstLeg.getLeg().getDepDate() %></h3>
							</div>
							<div class="col-xs-3 col-sm-2 text-muted">
								<h3>From</h3>
								<h3>To</h3>
							</div>
							<div class="col-xs-9 col-sm-6">
								<h3 class="no-wrap">
									<%= firstLeg.getDepAirport().getCity() %> ( <%=firstLeg.getLeg().getDepAirportID() %> )
								</h3>
								<h3 class="no-wrap">
									<%= firstLeg.getArrAirport().getCity() %> ( <%=firstLeg.getLeg().getArrAirportID() %> )
								</h3>
							</div>
						</div>
						<br>
						
					
						<div class="row">
							<div class="col-xs-5 col-sm-4">
								<img src="${pageContext.request.contextPath}/images/airline/2.jpg" class="img-responsive img-fixed">
							</div>
							<div class="col-xs-7 col-sm-8">
								<h3>Ada Airline</h3>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-xs-5 col-sm-4">
								<h3 class="no-wrap"><%= firstLeg.getLeg().getDepDate() %></h3>
								<h3 class="no-wrap"><small><%= firstLeg.getLeg().getDepAirportID() %></small></h3>
							</div>
							<div class="col-xs-2 col-sm-2 text-muted">
								<h3><span class="glyphicon glyphicon-arrow-right"></span></h3>
							</div>
							<div class="col-xs-5 col-sm-2">
								<h3 class="no-wrap"><%= firstLeg.getLeg().getArrDate() %></h3>
								<h3 class="no-wrap"><small><%= firstLeg.getLeg().getArrAirportID() %></small></h3>
							</div>
							<div class="col-xs-12 col-sm-4">
								<h3 class="no-wrap">
									<%= firstLeg.getTransfer() %> Stop(s)
								</h3>
							</div>
						</div>
						
					</div>
					<!-- end .row.cart-row -->
				</div>
				
				<!--  SECOND  -->
				<% if(secondLeg!=null){ %>
				<div class="row search-row">
					<div class="row cart-row">
						<div class="row">
							<div class="col-xs-12 col-sm-4">
								<h3 class="no-wrap"><%= secondLeg.getLeg().getDepDate() %></h3>
							</div>
							<div class="col-xs-3 col-sm-2 text-muted">
								<h3>From</h3>
								<h3>To</h3>
							</div>
							<div class="col-xs-9 col-sm-6">
								<h3 class="no-wrap">
									<%= secondLeg.getDepAirport().getCity() %> ( <%=secondLeg.getLeg().getDepAirportID() %> )
								</h3>
								<h3 class="no-wrap">
									<%= secondLeg.getArrAirport().getCity() %> ( <%=secondLeg.getLeg().getArrAirportID() %> )
								</h3>
							</div>
						</div>
						<br>
						
					
						<div class="row">
							<div class="col-xs-5 col-sm-4">
								<img src="${pageContext.request.contextPath}/images/airline/2.jpg" class="img-responsive img-fixed">
							</div>
							<div class="col-xs-7 col-sm-8">
								<h3>Ada Airline</h3>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-xs-5 col-sm-4">
								<h3 class="no-wrap"><%= secondLeg.getLeg().getDepDate() %></h3>
								<h3 class="no-wrap"><small><%= secondLeg.getLeg().getDepAirportID() %></small></h3>
							</div>
							<div class="col-xs-2 col-sm-2 text-muted">
								<h3><span class="glyphicon glyphicon-arrow-right"></span></h3>
							</div>
							<div class="col-xs-5 col-sm-2">
								<h3 class="no-wrap"><%= secondLeg.getLeg().getArrDate() %></h3>
								<h3 class="no-wrap"><small><%= secondLeg.getLeg().getArrAirportID() %></small></h3>
							</div>
							<div class="col-xs-12 col-sm-4">
								<h3 class="no-wrap">
									<%= secondLeg.getTransfer() %> Stop(s)
								</h3>
							</div>
						</div>
						
					</div>
					<!-- end .row.cart-row -->
				</div>
				<% } %>
				
				
				<!--  Third  -->
				<% if(thirdLeg!=null){ %>
				<div class="row search-row">
					<div class="row cart-row">
						<div class="row">
							<div class="col-xs-12 col-sm-4">
								<h3 class="no-wrap"><%= thirdLeg.getLeg().getDepDate() %></h3>
							</div>
							<div class="col-xs-3 col-sm-2 text-muted">
								<h3>From</h3>
								<h3>To</h3>
							</div>
							<div class="col-xs-9 col-sm-6">
								<h3 class="no-wrap">
									<%= thirdLeg.getDepAirport().getCity() %> ( <%=thirdLeg.getLeg().getDepAirportID() %> )
								</h3>
								<h3 class="no-wrap">
									<%= thirdLeg.getArrAirport().getCity() %> ( <%=thirdLeg.getLeg().getArrAirportID() %> )
								</h3>
							</div>
						</div>
						<br>
						
					
						<div class="row">
							<div class="col-xs-5 col-sm-4">
								<img src="${pageContext.request.contextPath}/images/airline/2.jpg" class="img-responsive img-fixed">
							</div>
							<div class="col-xs-7 col-sm-8">
								<h3>Ada Airline</h3>
							</div>
						</div>
						<br>
						<div class="row">
							<div class="col-xs-5 col-sm-4">
								<h3 class="no-wrap"><%= thirdLeg.getLeg().getDepDate() %></h3>
								<h3 class="no-wrap"><small><%= thirdLeg.getLeg().getDepAirportID() %></small></h3>
							</div>
							<div class="col-xs-2 col-sm-2 text-muted">
								<h3><span class="glyphicon glyphicon-arrow-right"></span></h3>
							</div>
							<div class="col-xs-5 col-sm-2">
								<h3 class="no-wrap"><%= thirdLeg.getLeg().getArrDate() %></h3>
								<h3 class="no-wrap"><small><%= thirdLeg.getLeg().getArrAirportID() %></small></h3>
							</div>
							<div class="col-xs-12 col-sm-4">
								<h3 class="no-wrap">
									<%= thirdLeg.getTransfer() %> Stop(s)
								</h3>
							</div>
						</div>
						
					</div>
					<!-- end .row.cart-row -->
				</div>
				<% } %>
				
				
				<div class="row">
					<div class="col-xs-12 col-sm-8 col-sm-offset-2">
						<div class="row">
							<div class="card-body">
								<form action="paymentMulti" method="post" novalidate="novalidate">
									<div class="form-group text-center">
										<ul class="list-inline">
											<li class="list-inline-item"><i
												class="text-muted fa fa-cc-visa fa-5x"></i></li>
											<li class="list-inline-item"><i
												class="fa fa-cc-mastercard fa-5x"></i></li>
											<li class="list-inline-item"><i
												class="fa fa-cc-amex fa-5x"></i></li>
											<li class="list-inline-item"><i
												class="fa fa-cc-discover fa-5x"></i></li>
										</ul>
									</div>
									<div class="form-group">
										<label for="cc-payment" class="control-label">Payment
											amount</label>
										<h3>$ <%= totalFare %></h3> 
									</div>
									<div class="form-group">
										<label for="cc-name" class="control-label">Name
											on card</label> <input id="cc-name" name="name" type="text"
											class="form-control" placeholder="Name">
									</div>
									<div class="form-group">
										<label for="cc-number" class="control-label">Card
											number</label> <input id="cc-number" name="creditCardNo" type="text"
											class="form-control" placeholder="xxxx-xxxx-xxxx-xxxx">
									</div>
									<div class="row">
										<div class="col-xs-6">
											<div class="form-group">
												<label for="cc-exp" class="control-label mb-1">Expiration</label>
												<input id="cc-exp" name="cc-exp" type="text"
													class="form-control cc-exp" placeholder="yy-MM">
											</div>
										</div>
										<div class="col-xs-6">
											<label for="x_card_code" class="control-label mb-1">Security
												code</label>
											<div class="input-group">
												<input id="x_card_code" name="secuCode" type="text"
													class="form-control" placeholder="xxx">
												<div class="input-group-addon">
													<span class="fa fa-question-circle fa-lg"></span>
												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="x_zip" class="control-label mb-1">Postal
											code</label> <input id="x_zip" name="x_zip" type="text"
											class="form-control" placeholder="xxxxx">
									</div>
									
									<input type = "hidden" name ="userID" value = "<%= loginedUserID %>"/>
									
									<input type = "hidden" name ="airlineID" value="<%= firstLeg.getLeg().getAirlineID() %>"/>
									<input type = "hidden" name = "flightNo" value =  "<%= firstLeg.getLeg().getFlightNo() %>"/>
									<input type = "hidden" name = "legNo" value =  "<%= firstLeg.getLeg().getLegNo() %>"/>
									
									<input type = "hidden" name = "totalFare" value = "<%=firstLeg.getFare().getFare() %>"/>
									
									<% if(secondLeg!=null){ %>
										<input type = "hidden" name ="airlineID2" value="<%= secondLeg.getLeg().getAirlineID() %>"/>
										<input type = "hidden" name = "flightNo2" value =  "<%= secondLeg.getLeg().getFlightNo() %>"/>
										<input type = "hidden" name = "legNo2" value =  "<%= secondLeg.getLeg().getLegNo() %>"/>
										<input type = "hidden" name = "totalFare2" value = "<%=secondLeg.getFare().getFare() %>"/>
									<%} %>
									
									<% if(thirdLeg!=null){ %>
										<input type = "hidden" name ="airlineID3" value="<%= thirdLeg.getLeg().getAirlineID() %>"/>
										<input type = "hidden" name = "flightNo3" value =  "<%= thirdLeg.getLeg().getFlightNo() %>"/>
										<input type = "hidden" name = "legNo3" value =  "<%= thirdLeg.getLeg().getLegNo() %>"/>
										<input type = "hidden" name = "totalFare3" value = "<%=thirdLeg.getFare().getFare() %>"/>
									<%} %>
									
									
									<div>
										<i class="fa fa-lock fa-lg">
										
										<input id="payment-button" type="submit"
											class="btn btn-lg btn-success btn-block"/>
										
										</i><span id="payment-button-amount">Pay</span>
										
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			
				
		</div>
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="${pageContext.request.contextPath}/assets/js/jquery-3.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/dashboard.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script> <!-- Moment JS -->
	<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.js"></script> <!-- Boostrap DTP JS -->
	<script src="${pageContext.request.contextPath}/assets/js/search.js"></script>
	
</body>
</html>