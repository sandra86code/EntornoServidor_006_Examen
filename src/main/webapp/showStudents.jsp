<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import ="com.studentJacaranda.model.City" %>
<%@ page import ="com.studentJacaranda.control.CityControl" %>
<%@ page import ="com.studentJacaranda.model.Student" %>
<%@page import="java.util.Iterator"%> 
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>

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
		if(id!=null) {
			City city = CityControl.getCity(Integer.parseInt(id));
			%><a href="listCity.jsp">Volver a las ciudades</a>
			<table border=1>
			  <tr>
			    <th>Id</th>
			    <th>Nombre</th>
			    <th>Apellido</th>
			    <th>Email</th>
			    <th>Sexo</th>
			  </tr>
			<%
			if(city!=null) {
				%><a href="listCity.jsp">Volver a las ciudades</a>
				<table border=1>
				  <tr>
				    <th>Id</th>
				    <th>Nombre</th>
				    <th>Apellido</th>
				    <th>Email</th>
				    <th>Sexo</th>
				  </tr>
				 
				  <%
				  ArrayList<Student> students = (ArrayList<Student>) city.getStudents();
				  if(students!=null) {
						Iterator<Student> iterator = students.iterator();  
							
						while(iterator.hasNext()) { 
							
							Student c = iterator.next(); 
					 		out.print("<tr>");
							out.print("<th>" + c.getId() + "</th>");
							out.print("<th>" + c.getName() + "</th>");
							out.print("<th>" + c.getSurname() + "</th>");
							out.print("<th>" + c.getEmail() + "</th>");
							out.print("<th>" + c.getEmail() + "</th>");
							out.print("</tr>");
						}
				  }

				%>
				</table><%
			}else {
				%><jsp:forward page="error.jsp?msg='No existe una ciudad con ese id.'"></jsp:forward><%
			}
		}else {%>
			<jsp:forward page="error.jsp?msg='El id no puede ser nulo'"></jsp:forward><%
		}
	}else {%>
		<jsp:forward page="error.jsp?msg='No estás autenticado.'"></jsp:forward><%
	}%>
 
</body>
</html>