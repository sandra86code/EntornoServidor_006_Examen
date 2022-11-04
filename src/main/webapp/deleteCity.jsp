<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="com.studentJacaranda.model.City" %>
<%@ page import ="com.studentJacaranda.control.CityControl" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	HttpSession se = request.getSession();
	String isSession = (String) session.getAttribute("login");
	String userSession = (String) session.getAttribute("user");
	if(isSession != null && userSession!=null && isSession.equals("True")){
		String id = request.getParameter("id");
		String ciudad = request.getParameter("ciudad");
		String pais = request.getParameter("pais");
		if(id==null || ciudad == null || pais == null) {
			City city = CityControl.getCity(Integer.parseInt(id));
			
			%>
			<H1>BORRAR LA SIGUIENTE CIUDAD</H1>
			<form action=deleteCityExec.jsp  method="post">
			  <label>Identificador:</label><br>
			  <input type="text" id="id" name="id" value="<%=city.getId()%>"required /><%=city.getId()%><br>
			  <label>Ciudad:</label><br>
			  <input type="text" id="ciudad" name="ciudad" value="<%=city.getCity()%>"><%=city.getCity()%><br><br>
			  <label>País:</label><br>
			  <input type="text" id="pais" name="pais" value="<%=city.getCountry()%>"><%=city.getCountry()%><br><br>
			  <input type="submit" value="Submit">
			</form> 
			<a href="listCity.jsp">Volver al listado</a>
			<%
		}else {%>
			<jsp:forward page="error.jsp?msg='Los campos no pueden ser nulos.'"></jsp:forward><%
		}
	}else {%>
		<jsp:forward page="error.jsp?msg='No estás autenticado.'"></jsp:forward><%
	}%>
</body>
</html>