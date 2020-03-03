<%@ include file="header.jsp" %>

<body>

	<section id="container" class="">

		<header class="header dark-bg">
			<div class="toggle-nav">
				<div class="icon-reorder tooltips"
					data-original-title="Toggle Navigation" data-placement="bottom">
					<i class="icon_menu"></i>
				</div>
			</div>

			<!--logo start-->
			<a href="index.html" class="logo"> <%
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

							<li><a href="login.jsp"><i class="icon_key_alt"></i>
									Log Out</a></li>

						</ul></li>
				</ul>
			</div>
		</header>

		<aside>
			<div id="sidebar" class="nav-collapse ">
				
				<ul class="sidebar-menu">
					<li class="active"><a class="" href="index.jsp"> <i
							class="icon_house_alt"></i> <span>Dashboard</span>
					</a></li>



					<li class="sub-menu"><a href="javascript:;" class=""> <i
							class="icon_table"></i> <span>Tables</span> <span
							class="menu-arrow arrow_carrot-right"></span>
					</a>
						<ul class="sub">
							<li><a class="active" href="admin_table.jsp">Admin</a></li>
							<li><a class="" href="weapon_table.jsp">Weapon</a></li>
							<li><a class="" href="jewel_table.jsp">Jewel</a></li>
						</ul></li>
								
						

					<li class="sub-menu"><a href="javascript:;" class=""> <i
							class="icon_documents_alt"></i> <span>Pages</span> <span
							class="menu-arrow arrow_carrot-right"></span>
					</a>
						<ul class="sub">
							<li><a class="" href="registration.jsp">Registration Page</a></li>
							<li><a class="" href="login.jsp"><span>Login
										Page</span></a></li>
							<li><a class="" href="contact.jsp"><span>Contact
										Page</span></a></li>
						</ul></li>

				</ul>
			</div>
		</aside>

		<section id="main-content">
			<section >
				<div class="row">
					<div class="col-lg-12">
						<h3 class="page-header">
							<i class="fa fa-laptop"></i> Dashboard
						</h3>
						<ol class="breadcrumb">
							<li><i class="fa fa-home"></i><a href="index.html">Home</a></li>
							<li><i class="fa fa-laptop"></i>Dashboard</li>
						</ol>
					</div>
				</div>
			</section>
		</section>
	</section>

	<footer>
		<div class="text-right"
			style="position: relative; text-align: center; top: 480px;">
			Designed by <a href="https://luikz.github.io/me/">Luikz</a>
		</div>
	</footer>

	<script src="js/jquery.js"></script>
	<script src="js/jquery-ui-1.10.4.min.js"></script>
	<script src="js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="js/jquery-ui-1.9.2.custom.min.js"></script>

	<script src="js/bootstrap.min.js"></script>

	<script src="js/jquery.scrollTo.min.js"></script>
	<script src="js/jquery.nicescroll.js" type="text/javascript"></script>

	<script src="assets/jquery-knob/js/jquery.knob.js"></script>
	<script src="js/jquery.sparkline.js" type="text/javascript"></script>
	<script src="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js"></script>
	<script src="js/owl.carousel.js"></script>
	
	<script src="js/fullcalendar.min.js"></script>

	<script src="assets/fullcalendar/fullcalendar/fullcalendar.js"></script>

	<script src="js/calendar-custom.js"></script>
	<script src="js/jquery.rateit.min.js"></script>

	<script src="js/jquery.customSelect.min.js"></script>
	<script src="assets/chart-master/Chart.js"></script>


	<script src="js/scripts.js"></script>

	<script src="js/sparkline-chart.js"></script>
	<script src="js/easy-pie-chart.js"></script>
	<script src="js/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="js/jquery-jvectormap-world-mill-en.js"></script>
	<script src="js/xcharts.min.js"></script>
	<script src="js/jquery.autosize.min.js"></script>
	<script src="js/jquery.placeholder.min.js"></script>
	<script src="js/gdp-data.js"></script>
	<script src="js/morris.min.js"></script>
	<script src="js/sparklines.js"></script>
	<script src="js/charts.js"></script>
	<script src="js/jquery.slimscroll.min.js"></script>
	<script>
		//knob
		$(function() {
			$(".knob").knob({
				'draw' : function() {
					$(this.i).val(this.cv + '%')
				}
			})
		});

		//carousel
		$(document).ready(function() {
			$("#owl-slider").owlCarousel({
				navigation : true,
				slideSpeed : 300,
				paginationSpeed : 400,
				singleItem : true

			});
		});

		//custom select box

		$(function() {
			$('select.styled').customSelect();
		});

		/* ---------- Map ---------- */
		$(function() {
			$('#map').vectorMap({
				map : 'world_mill_en',
				series : {
					regions : [ {
						values : gdpData,
						scale : [ '#000', '#000' ],
						normalizeFunction : 'polynomial'
					} ]
				},
				backgroundColor : '#eef3f7',
				onLabelShow : function(e, el, code) {
					el.html(el.html() + ' (GDP - ' + gdpData[code] + ')');
				}
			});
		});
	</script>
	
	<!-- <%@ include file="footer.jsp" %>  -->	
</body>
</html>
