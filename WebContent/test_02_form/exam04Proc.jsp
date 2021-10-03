<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String tmp; 
	//id
	String id = "";
	//비밀번호
	String passwd = "";
	
	//아이디 검사
	tmp = request.getParameter("id");
	if(!(tmp == null || tmp.trim().equals(""))){
		id = tmp;
	}else{
%> 		<script>
			alert('아이디가 비어있습니다.');
			location.href = 'exam04.jsp';
		</script>
<%
	}
	
	//비밀번호 검사
	tmp = request.getParameter("passwd");
	if(!(tmp == null || tmp.trim().equals(""))){
		passwd = tmp;
	}else{
%>		<script>
			alert('비밀번호가 비어있습니다.');
			location.href = 'exam04.jsp';
		</script>
<%
	}
	
	//디비 아이디
	String dbid = "hong";
	
	//디비 비밀번호
	String dbpass = "1234";
	
	//아이디 비밀번호 검사
	if(dbid.equals(id) && dbpass.equals(passwd)){
		
		out.print("로그인 성공<br>");		
		out.print(id+"님 환영합니다.");		
	}else{
%>
		<script>
			alert('아이디 비밀번호가 틀렸습니다. 다시 시도해주세요');
			location.href = 'exam04.jsp';
		</script>
<%		
	}

%>
