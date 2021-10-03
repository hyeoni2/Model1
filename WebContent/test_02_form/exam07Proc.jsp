<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test_02_form.Exam07DTO"%>
<% 
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
%>
		<script type="text/javascript">
			alert('아이디를 입력해주세요.');
			location.href = "exam07.jsp;"
		</script>
<%
	}
	
	String passwd = request.getParameter("passwd");
	String confirm_passwd = request.getParameter("confirm_passwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	int birthYear = 0;
	String birthYear_ = request.getParameter("birthYear");
	if(birthYear_ == null || birthYear_.trim().equals("")){
%>
		<script type="text/javascript">
			alert('출생년도를 입력해주세요.');
			location.href = "exam07.jsp;"
		</script>
<%
	}else{
		try{
		birthYear = Integer.parseInt(birthYear_);
		}
		catch(NumberFormatException e){
			%>
			<script type="text/javascript">
				alert('출생년도는 숫자만 가능합니다.');
				location.href = "exam07.jsp;"
			</script>
			<%
			
		}
	}
	
	
	
	
	
	Exam07DTO dto = new Exam07DTO();
	dto.setId(id);
	dto.setPasswd(passwd);
	dto.setConfirm_passwd(confirm_passwd);
	dto.setName(name);
	dto.setPhone(phone);
	dto.setEmail(email);
	dto.setBirthYear(birthYear);

	out.println(dto.getId()+"<br>");
	out.println(dto.getPasswd()+"<br>");
	out.println(dto.getConfirm_passwd()+"<br>");
	out.println(dto.getName()+"<br>");
	out.println(dto.getPhone()+"<br>");
	out.println(dto.getEmail()+"<br>");
	out.println(dto.getBirthYear()+"<br>");
%>