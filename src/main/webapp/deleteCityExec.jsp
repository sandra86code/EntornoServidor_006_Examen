<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.studentJacaranda.control.CityControl" %>
<%@ page import ="com.studentJacaranda.control.DaoException" %>
<%@ page import ="com.studentJacaranda.model.City" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete city Persistence</title>
</head>
<body>
<% 
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession !=null && isSession.equals("True")){ 
		String id = request.getParameter("id");
		String ciudad = request.getParameter("ciudad");
		String pais = request.getParameter("pais");
		if(id==null || ciudad == null || pais == null) {
			%><jsp:forward page="error.jsp?msg='Los campos no pueden estar vacíos.'"></jsp:forward> <%
		}else {
			City city = new City(Integer.parseInt(id), ciudad, pais);
			try {
				boolean delete = CityControl.deleteCity(city);
				if(delete) {
					%><jsp:forward page="listCity.jsp"></jsp:forward><%
				}
			}catch(DaoException e) {
				String message = e.getMessage();
				%><jsp:forward page="error.jsp?msg='<%=message %>'"></jsp:forward><%
			}
			
		}
	}else {%>
		<jsp:forward page="error.jsp?msg='No estás autenticado.'"></jsp:forward><%
	}%>
</body>
</html>