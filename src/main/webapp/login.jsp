<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "com.studentJacaranda.control.DaoUser" %>
<%@ page import = "com.studentJacaranda.control.DaoException" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check Login</title>
</head>
<body>
	<%
	String user = request.getParameter("name");
	String password = request.getParameter("password");
	DaoUser daou = new DaoUser();
	try {
		boolean userValid = daou.isUserValid(user, password);
		if(userValid) {
			HttpSession sesion = request.getSession();
			session.setAttribute("login", "True");
			session.setAttribute("user", user);%>
			<jsp:forward page="listCity.jsp"></jsp:forward><%
		}else{%>
			<jsp:forward page="error.jsp?msg='El usuario o la clave no son correctos'"></jsp:forward>
	<%}
	}catch(DaoException e) {
		String message = e.getMessage();%>
		<jsp:forward page="error.jsp?msg='<%=message %>'"></jsp:forward><%
	}%>
	
	
</body>
</html>