<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 - 예제 15 Result</title>
</head>
<body>

<h2>예제 15 Result</h2>

<%
	request.setCharacterEncoding("UTF-8");	

	String movie_subject = request.getParameter("movie_subject");
	String movie_place = request.getParameter("movie_place");
	
	out.println("영화 제목 : "+movie_subject+"<br>");
	out.println("상영관 : "+movie_place);
%>
</body>
</html>