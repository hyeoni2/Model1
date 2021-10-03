<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	//id부분
	String id = request.getParameter("id"); 
	
	//password부분
	String passwd = request.getParameter("passwd"); 
	String confirm_passwd = request.getParameter("confirm_passwd"); 
	if(!(passwd.trim().equals(confirm_passwd))){
		System.out.println("비밀번호 다름");
	}
	//name 부분
	String name = request.getParameter("name"); 

	//phone 부분
	String phone1 = request.getParameter("phone1"); 
	String phone2 = request.getParameter("phone2"); 
	String phone3 = request.getParameter("phone3"); 
	String phone = phone1 + "-" + phone2 + "-" + phone3; 
	
	//email부분
	String email = request.getParameter("email"); 
	
	//gender부분
	String gender = request.getParameter("gender"); 
	String genderName = "남자";
	if(gender.equals("F")){
		genderName = "여자";
	}
	
	String imsi = name + "("+id+")";
%>

<%-- 
아이디 : <%=id%><br>
비밀번호 : <%=passwd%><br>
비밀번호 확인 : <%=confirm_passwd%><br>
이름 : <%=name%><br>
전화번호 : <%=phone%><br>
이메일 : <%=email%><br>
성별 : <%=gender%> / <%=genderName%><br> 
--%>

<form name="joinForm2"  method="post" action="exam02ProcResult.jsp">
		<input type="hidden" name="info" value="<%=imsi%>">
</form>
<script>
	document.joinForm2.submit();
</script>
