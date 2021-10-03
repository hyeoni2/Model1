<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");//post로 넘어오는 한글 꺠짐 방지.
	
	String name = request.getParameter("name");
	String ssn = request.getParameter("ssn");

	/*
	out.println("name : "+name);
	out.println("<br>");
	out.println("ssn : "+ssn);
	*/
	
	String tmp1 = ssn.substring(0, 2);
	String tmp2 = ssn.substring(7, 8);
	
	System.out.println(tmp1);
	System.out.println(tmp2);

	String gender = "여자";
	if(tmp2.equals("1") || tmp2.equals("3")){
		gender = "남자";
	}
	
	int tmp3;
	if(tmp2.equals("1") || tmp2.equals("2")){
		tmp3 = 1900 + Integer.parseInt(tmp1);
	}else{
		tmp3 = 2000 + Integer.parseInt(tmp1);
	}
	
	int age = 2021 - tmp3+1;
	
	
	
%>

이름 : <%=name %><br>
나이 : <%=age %><br>
성별 : <%=gender %><br>
주민번호 : <%=ssn %>

