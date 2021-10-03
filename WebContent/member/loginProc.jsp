<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@page import="sungjuk.model.dto.SungjukDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@page import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	

	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPasswd(passwd);
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto2 = dao.setLogin(dto);
	
	String msg = "";
	String url = "";
	
	System.out.println(dto2.getName());
	System.out.println(dto2.getId());
	System.out.println(dto2.getNo());
	

	
		if(dto2.getNo() > 0) {
			session.setAttribute("cookNo", dto2.getNo());
			session.setAttribute("cookId", dto2.getId());
			session.setAttribute("cookName", dto2.getName());
			//session.setMaxInactiveInterval(1*60); 세션 만료값 적용
		
			msg = "로그인 성공했습니다.";
			url = "../main/main.jsp?menu_gubun=member_list";
		/* 	out.println("<script>");
			out.println("location.href = '../main/main.jsp?menu_gubun=member_list';");
			out.println("</script>"); */
		}else{
			
			msg = "아이디 또는 비밀번호가 다릅니다.";
			url = "/jsp_mvc1";

		/* 	out.println("<script>");
			out.println("alert('아이디 또는 비밀번호가 다릅니다.');");
			out.println("location.href = '../main/main.jsp?menu_gubun=member_login';");
			out.println("</script>"); */
		
		}
		//---------------------------------------------------------------

		
%>
<script>
	alert('<%=msg%>');
	location.href = '<%=url%>';
</script>