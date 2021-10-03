<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String subject = request.getParameter("subject");
	String place = request.getParameter("place");
	
	out.println("영화제목은 "+subject+"입니다.<br>");
	out.println("상영관은 "+place+"입니다.<br>");
	out.println("<hr>");
	
	String msg = "";
	msg += "영화제목은";
	msg += subject;
	msg += "입니다.<br>";
	msg += "상영관은";
	msg += place;
	msg += "입니다.<br>";
	msg += "<hr>";
	out.println(msg);
%>
영화제목은 <%=subject %>입니다.<br>
상영관은 <%=place %>입니다.<br>

