<%@ page import="java.io.*,java.util.*" %>
<html>
<head>
<title>MySingers</title>
</head>
<body>
<%
   // New location to be redirected
   	response.setStatus(response.SC_MOVED_TEMPORARILY);
	session.invalidate();
   	response.setHeader("Location", "http://localhost:8080/MySingers/index.jsp"); 
%>
</body>
</html>