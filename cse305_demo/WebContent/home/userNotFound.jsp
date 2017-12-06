<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../home/header.jsp"%>

<div class="container-fluid bg-gray text-center">
	<h2> User is not found</h2>
	
	<h3> Sign In Again</h3>
	<form name="loginForm" action="login" method="POST">
		<div class="form-group">
			<div class="input-group">
				<input type="text" class="form-control" id="id" name = "userID"
					placeholder="Username"> <span class="input-group-addon">
					<span class="glyphicon glyphicon-user"></span>
				</span>
			</div>
		</div>
		<div class="form-group">
			<div class="input-group">
				<input type="password" class="form-control" id="pwd" name = "password"
					placeholder="Password"> <span class="input-group-addon">
					<span class="glyphicon glyphicon-lock"></span>
				</span>
			</div>
		</div>
		<button type="submit" class="btn btn-block log-in-button">
			Log In<span class="glyphicon glyphicon-log-in"></span>
		</button>
 	</form>
 	
	<p> If you're not a customer of Yeo Hang Out</p>
	
	<p> Go to Sign up!!</p> 
	<a href="signup.jsp" id = "signupBt" role = "button" class="btn btn-success btn-md">Sign Up</a>
	
</div>
<%@ include file="../home/footer.jsp"%>

