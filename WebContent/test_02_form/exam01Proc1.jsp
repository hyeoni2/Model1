<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	
	String tmp = request.getParameter("age");
	int age = Integer.parseInt(tmp);
	
	out.println("당신의 이름은 "+name +" 입니다.<br>");
	out.println("당신의 나이는 "+age +" 입니다.<br>");

	out.println("<hr>");

	String msg = "";
	msg += "당신의 이름은 ";
	msg += name;
	msg += "입니다.<br>";
	msg += "당신의 나이는 ";
	msg += age;
	msg += "입니다.<br>";
	out.println(msg);
	out.println("<hr>");
	
	
	
	String nickName = request.getParameter("nickName");
	String subject = request.getParameter("subject");
	String place = request.getParameter("place");
	
	System.out.println("subject : " + subject);
	System.out.println("place : " + place);
	System.out.println("nickName : " + nickName);
%>

	당신의 이름은 <%=name%>입니다.
	<br>
	당신의 나이는 <%=age%>입니다.