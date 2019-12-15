<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.legolas.dao.JewelDAO"%>
<%@ page import="com.legolas.bean.Jewel"%>
<%@ page import="com.legolas.connection.Database"%>


<%@ include file="header.jsp"%>
<body>
	<div id="updateJewelModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="JewelController" method="post">
					<div class="modal-header">
						<h4 class="modal-title" style="text-align: center;">Update
							Jewel</h4>

					</div>

					<%
							Jewel j = JewelDAO.findWeapon(Integer.parseInt(request.getParameter("u")));
							/*int id = Integer.parseInt(request.getParameter("u"));
							
							Connection conn = Database.connect();
							
							String sql = "select * from jewel where id=" + id;
							Statement st = conn.createStatement();
							ResultSet rs = st.executeQuery(sql);
							
							if(rs.next()) {*/
						%>

					<!--  <input type="hidden" name="id" value="<%//=rs.getInt("id") %>"> -->
					<input type="hidden" name="id" value="<%=j.getId()%>">
					<div class="modal-body">
						<div class="form-group">
							<label>Name</label> <input type="text" name="name"
								value="<%=j.getName()%>" class="form-control" required>
						</div>
						<div class="form-group">
							<label>Physical Defense</label> <input name="p_def" type="number"
								step="0.01" value="<%=j.getP_def()%>" class="form-control"
								required>
						</div>
						<div class="form-group">
							<label>Magic Defense</label> <input name="m_def" type="number"
								step="0.01" value="<%=j.getM_def()%>" class="form-control"
								required>
						</div>
						<div class="form-group">
							<label>Tradable</label> <input type="text" name="tradable"
								value="<%=j.isTradable()%>" class="form-control" required>
						</div>
					</div>

					<%
						// }
					%>
					<div class="modal-footer">
						<a href="jewel_table.jsp"
							style="font-family: 'Lato', sans-serif; background: #7D7D7D; color: #fff;"
							onmouseover="this.style.color='gray', this.style.background='#A9A9A9'"
							onmouseout="this.style.color='white', this.style.background='#7D7D7D'"
							class="btn btn-secondary">Cancel</a> <input type="submit"
							name="update" class="btn btn-primary" value="Update"
							data-dismiss="modal">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>