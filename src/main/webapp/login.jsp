<%@ include file="header.jsp" %>

<body class="login-img3-body">

	<div class="container">

		<form class="login-form" action="Login" method="post">
			<div class="login-wrap">
				<p class="login-img">
					<i class="icon_lock_alt"></i>
				</p>
				<div class="input-group">
					<span class="input-group-addon"><i class="icon_profile"></i></span>
					<input type="text" class="form-control" name="user" placeholder="Username"
						autofocus required>
				</div>
				<div class="input-group">
					<span class="input-group-addon"><i class="icon_key_alt"></i></span>
					<input type="password" class="form-control" name="password" placeholder="Password" required>
				</div>
				<label class="checkbox"> <input type="checkbox"
					value="remember-me"> Remember me <span class="pull-right">
							<a href="#"> Forgot Password?</a>
					</span></label>
				<button class="btn btn-primary btn-lg btn-block" type="submit">Login</button>
				<p style="color: #000;">Still don't have an account?</p> 
				<a href="registration.jsp" class="btn btn-info btn-lg btn-block">Signup</a>
			</div>
		</form>
		<%@ include file="footer.jsp" %>
	</div>
</body>
</html>