<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String laptops[] = request.getParameterValues("laptops");
	String storage[] = request.getParameterValues("storage");
	
	ArrayList<String> cartLaptops = (ArrayList<String>) session.getAttribute("cartLaptops");
	ArrayList<String> cartStorage = (ArrayList<String>) session.getAttribute("cartStorage");
	
	if(cartLaptops == null) {
		cartLaptops = new ArrayList<String>();
	}
	if(cartStorage == null) {
		cartStorage = new ArrayList<String>();
	}
	
	for(String laptop : laptops) {
		cartLaptops.add(laptop);
	}
	
	for(String st : storage) {
		cartStorage.add(st);
	}
	
	session.setAttribute("cartLaptops", cartLaptops);
	session.setAttribute("cartStorage", cartStorage);
	
	out.println("<h2>You have following Laptops:</h2>");
	
	for(String laptop : cartLaptops) {
%>
		<li><%= laptop %> </li>
<%
	}
	
	out.println("<h2>You have following Storages:</h2>");
	for(String st : cartStorage) {
%>
		<li><%= st %> </li>
<%
	}
%>
	<a href="index.html">Back to Items</a>
</body>
</html>