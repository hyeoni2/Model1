<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");


	String dbid = "hong";
	String dbpasswd = "1234";
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	if(id.equals(dbid) && passwd.equals(dbpasswd)){
	
		//response.sendRedirect("main.jsp");//jsp에서 페이지 이동
%>
		<<script type="text/javascript">
			location.href = "main.jsp";
		</script>
<%						
	}else{
		
%>
		<<script type="text/javascript">
			alert('아이디 또는 비밀번호가 다릅니다.\n확인 후 다시 이용하세요');
			location.href = "exam07.jsp";
		</script>
<%		
		
	}
	
%>