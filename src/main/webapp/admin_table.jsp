<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>

<%@ include file="header.jsp"%>
<body>
	<!-- container section start -->
	<section id="container" class="">
		<!--header start-->
		<header class="header dark-bg">
			<div class="toggle-nav">
				<div class="icon-reorder tooltips"
					data-original-title="Toggle Navigation" data-placement="bottom">
					<i class="icon_menu"></i>
				</div>
			</div>


			<a href="index.jsp" class="logo"> <%
 	out.print("Welcome, ");
 %> <span class="lite"> <%
 	out.print(session.getAttribute("user") + "!");
 %></span></a>

			<div class="top-nav notification-row">
				<!-- notificatoin dropdown start-->
				<ul class="nav pull-right top-menu">



					<li class="dropdown"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <b class="caret"></b>
					</a>
						<ul class="dropdown-menu extended logout">
							<div class="log-arrow-up"></div>

							<li><a href="login.jsp"><i class="icon_key_alt"></i> Log
									Out</a></li>

						</ul></li>
				</ul>
			</div>
		</header>

		<aside>
			<div id="sidebar" class="nav-collapse ">

				<ul class="sidebar-menu">
					<li class=""><a class="" href="index.jsp"> <i
							class="icon_house_alt"></i> <span>Dashboard</span>
					</a></li>





					<li class="sub-menu"><a href="javascript:;" class=""> <i
							class="icon_table"></i> <span>Tables</span> <span
							class="menu-arrow arrow_carrot-right"></span>
					</a>
						<ul class="sub">
							<li><a class="active" href="admin_table.jsp">Admin</a></li>
							<li><a class="active" href="weapon_table.jsp">Weapon</a></li>
							<li><a class="active" href="jewel_table.jsp">Product</a></li>
						</ul></li>

					<li class="sub-menu"><a href="javascript:;" class=""> <i
							class="icon_documents_alt"></i> <span>Pages</span> <span
							class="menu-arrow arrow_carrot-right"></span>
					</a>
						<ul class="sub">
							<li><a class="" href="registration.jsp">Registration
									Page</a></li>
							<li><a class="" href="login.jsp"><span>Login Page</span></a></li>
							<li><a class="" href="contact.jsp"><span>Contact
										Page</span></a></li>
						</ul></li>

				</ul>
			</div>
		</aside>

		<section id="main-content">
			<section class="wrapper">
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="fa fa-table"></i> Table
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="index.jsp">Home</a></li>
							<li><i class="fa fa-table"></i>Table</li>
							<li><i class="fa fa-th-list"></i>Manufacture's Table</li>
						</ol>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<section class="panel">
							<header class="panel-heading">
								Admin Table
								<!-- <div class="table-title">
									<div class="row">
										<div class="col-sm-6">
											<a href="#addManufacturerModal" class="btn btn-success"
												data-toggle="modal"><i class="material-icons">&#xE147;</i>
												<span>Add</span></a>
										</div>
									</div>
								</div>  -->
							</header>


							<table id="data-table-basic"
								class="table table-striped table-advance table-hover">
								<thead>
									<tr>
										<th><i class="fa fa-user" aria-hidden="true"></i> ID</th>
										<th><i class="icon_profile"></i> Username</th>
										<th><i class="icon_mail_alt"></i> Email</th>
										<th><i class="icon_key_alt"></i> Password</th>
										<!-- <th><i class="icon_cogs"></i> Action</th>   -->
									</tr>
								</thead>
								<%
									Connection conn = null;
									Statement stt = null;
									ResultSet rs = null;
									Class.forName("com.mysql.cj.jdbc.Driver");
									conn = DriverManager.getConnection(
											"jdbc:mysql://localhost:3306/legolas?useTimezone=true&serverTimezone=UTC", "root", "snippetcode");
									stt = conn.createStatement();
									String data = "select * from users";
									rs = stt.executeQuery(data);

									while (rs.next()) {
								%>
								<tr>
									<td><%=rs.getString("id")%></td>
									<td id="f1"><%=rs.getString("user")%></td>
									<td id="f2"><%=rs.getString("email")%></td>
									<td id="f3"><%=rs.getString("password")%></td>
									<td>
										<!--<div class="btn-group">
											 <a class="btn btn-primary" href="#"><i
												class="icon_plus_alt2"></i></a>
											<a href="#updateManufacturerModal" class="update btn btn-primary" data-toggle="modal" 
											data-uid="1"><i
												class="fa fa-pencil" aria-hidden="true"></i></a> <a
												class="btn btn-danger" href="#"><i
												class="icon_close_alt2"></i></a>
										</div>-->
									</td>
								</tr>
								<%
									}
								%>


								<tfoot>
									<tr>
										<th><i class="fa fa-user" aria-hidden="true"></i> ID</th>
										<th><i class="icon_profile"></i> Username</th>
										<th><i class="icon_mail_alt"></i> Email</th>
										<th><i class="icon_key_alt"></i> Password</th>
									<!-- 	<th><i class="icon_cogs"></i> Action</th>  -->
									</tr>
								</tfoot>
							</table>
						</section>
					</div>
				</div>
				<!-- page end-->
			</section>
		</section>

		<div id="addManufacturerModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="ProductController" method="post">
						<div class="modal-header">
							<h4 class="modal-title">Add Manufacturer</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>Username</label> <input name="user" type="text" class="form-control"
									required>
							</div>
							<div class="form-group">
								<label>Email</label> <input name="email" type="email" class="form-control"
									required>
							</div>
							<div class="form-group">
								<label>Password</label> <input name="password" type="password"
									class="form-control" required>
							</div>
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default" data-dismiss="modal"
								value="Cancel"> <input type="submit"
								class="btn btn-success" value="Add">
						</div>
					</form>
				</div>
			</div>
		</div>
		<font color="green">
			<%
				if(session.getAttribute("sm") != null) {
					out.println(session.getAttribute("sm"));	
					session.setAttribute("sm", null);
				}
			%>
		</font>
		
		<font color="red">
			<%
				if(session.getAttribute("em") != null) {
					out.println(session.getAttribute("em"));	
					session.setAttribute("em", null);
				}
			%>
		</font>
		
		
		<div id="updateManufacturerModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form>
						<div class="modal-header">
							<h4 class="modal-title">Update Manufacturer</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>Username</label> <input id="us" type="text" class="form-control"
									required>
							</div>
							<div class="form-group">
								<label>Email</label> <input id="mail" type="email" class="form-control"
									required>
							</div>
							<div class="form-group">
								<label>Password</label> <input id="pass" type="password"
									class="form-control" required>
							</div>
						</div>
						<div class="modal-footer">
							<input type="button" id="up" class="btn btn-default" data-dismiss="modal"
								value="Cancel"> <input type="submit"
								class="btn btn-primary" value="Update" data-dismiss="modal">
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- javascripts -->
		<script src="js/jquery-1.12.4.min.js"></script>

		<script src="js/jquery.dataTables.min.js"></script>
		<script src="js/data-table-act.js"></script>

		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<!-- nicescroll -->
		<script src="js/jquery.scrollTo.min.js"></script>
		<script src="js/jquery.nicescroll.js" type="text/javascript"></script>
		<!--custome script for all page-->
		<script src="js/scripts.js"></script>

		<%@ include file="footer.jsp"%>

	</section>


</body>
</html>