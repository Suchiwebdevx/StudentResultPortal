<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LogOut</title>
</head>
<body>
<%@ page language="java" %>
<%
    session.invalidate();      // Destroy the current session
 response.sendRedirect("index.jsp");   // Go back to the home page
%>
<button>Logging out</button>
</body>
</html>