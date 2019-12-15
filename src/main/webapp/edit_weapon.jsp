<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.legolas.dao.WeaponDAO"%>
<%@ page import="com.legolas.bean.Weapon"%>
<%@ page import= "com.legolas.connection.Database"%>


<%@ include file="header.jsp" %>
<body>
	<div id="updateWeapon">
			<div class="modal-dialog">
				<div class="modal-content">
					<form action="WeaponController" method="post">
						<div class="modal-header">
							<h4 class="modal-title" style="text-align: center;">Update Weapon</h4>
						
						</div>
						
						<%
							Weapon w = WeaponDAO.findWeapon(Integer.parseInt(request.getParameter("u")));
							/*int id = Integer.parseInt(request.getParameter("u"));
							
							Connection conn = Database.connect();
							
							String sql = "select * from weapon where id=" + id;
							Statement st = conn.createStatement();
							ResultSet rs = st.executeQuery(sql);
							
							if(rs.next()) {*/
						%>
						
						<!--  <input type="hidden" name="id" value="<%//=rs.getInt("id") %>"> -->
						<input type="hidden" name="id" value="<%=w.getId() %>">  
						<div class="modal-body">
							<div class="form-group">
								<label>Name</label> <input type="text" name="name" value="<%=w.getName() %>" class="form-control"
									required>
							</div>
							<div class="form-group">
								<label>Attack speed</label> <input type="number" name="atk_speed" step="0.01" value="<%=w.getAtk_speed() %>" class="form-control"
									required>
							</div>
							<div class="form-group">
								<label>Droppable</label> <input type="text" name="droppable" value="<%=w.isDroppable() %>"
									class="form-control" required>
							</div>
							<div class="form-group">
								<label>Level</label> <input type="number" name="level" value="<%=w.getLevel() %>"
									class="form-control" required>
							</div>
							<div class="form-group">
								<label>Critical Damage</label> <input type="text" name="c_damage" value="<%=w.getC_damage() %>"
									class="form-control" required>
							</div>
						</div>
						
						<%// } %>
						<div class="modal-footer">
							<a href="weapon_table.jsp"
							style="font-family: 'Lato', sans-serif; background: #7D7D7D; color: #fff;"
							onmouseover="this.style.color='gray', this.style.background='#A9A9A9'"
							onmouseout="this.style.color='white', this.style.background='#7D7D7D'"
							class="btn btn-secondary">Cancel</a>
							 <input type="submit" name="update"
								class="btn btn-primary" value="Update" data-dismiss="modal">
						</div>
					</form>
				</div>
			</div>
		</div>
</body>
<%@ include file="footer.jsp" %>
</html>