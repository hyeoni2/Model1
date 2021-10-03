<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	String addr = request.getParameter("addr");
	String[] arrayHobby = request.getParameterValues("hobby");
	
	
	String hobby = "";
	String hobby1 = "";
	if(arrayHobby == null){
%>
	<script>
		alert('관심분야를 한개 이상 입력해주세요');
		location.href = 'exam05.jsp';
	</script>
<%
	}else{
		for(int i=0; i < arrayHobby.length; i++){
			System.out.println("arrayHobby["+i+"] : "+arrayHobby[i]);
			hobby += i == arrayHobby.length - 1 ? arrayHobby[i] : arrayHobby[i]+", ";
			hobby1 += "," + arrayHobby[i];
		}
		
		hobby1 = hobby1.substring(1);
	}
	
	
	System.out.println("id : "+id);
	System.out.println("passwd : "+passwd);
	System.out.println("name : "+name);
	System.out.println("phone : "+phone);
	System.out.println("gender : "+gender);
	System.out.println("addr : "+addr);
	
	
	
	out.println("취미 : "+ hobby);
	
%>