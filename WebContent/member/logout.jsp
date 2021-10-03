<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	session.invalidate();
	out.println("<script>");
	out.println("alert('로그아웃 되었습니다 좋은 하루 보내세요~');");
	out.println("location.href='/jsp_mvc1';");
	out.println("</script>");
%>