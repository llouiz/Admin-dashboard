<%@ include file="header.jsp" %>

<body class="login-img3-body">
	<div class="container">
	
		<form class="login-form" id="contact-form" action="Registration" method="post">
			<div class="login-wrap">
				<p class="login-img">
					<i class="fa fa-user" aria-hidden="true"></i>
				</p>
				
				<div class="input-group">
					<span class="input-group-addon"><i class="icon_profile"></i></span>
					<input type="text" class="form-control" name="user" placeholder="Username"
						autofocus required>
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
					<input type="text" class="form-control" name="email" placeholder="Email"
						autofocus required>
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i class="icon_key_alt"></i></span>
					<input type="password" class="form-control" name="password" placeholder="Password" required>
				</div>
				<label class="checkbox"> <input type="checkbox"
					value="remember-me"> Remember me <span class="pull-right">	
					</span></label>
					
				<button class="btn btn-info btn-lg btn-block" type="submit" id="myBtn">Sign up</button>
				<p style="color: #000;">Have an account already?</p> 
				<a href="login.jsp" class="btn btn-primary btn-lg btn-block">Login</a>
			</div>
		</form>
		
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>
