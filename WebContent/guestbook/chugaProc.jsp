<%@page import="guestbook.model.dto.GuestBookDTO"%>
<%@page import="guestbook.model.dao.GuestBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	

	String name = request.getParameter("name");
	String passwd = request.getParameter("passwd");
	String email = request.getParameter("email");
	String content = request.getParameter("content");

	
	GuestBookDTO dto = new GuestBookDTO();
	dto.setName(name);
	dto.setPasswd(passwd);
	dto.setEmail(email);
	dto.setContent(content);

	GuestBookDAO dao = new GuestBookDAO();
	int result = dao.setInsert(dto);
	
	String msg = "";
	String url = "";
	if(result > 0){
		out.println("<script>");
		out.println("location.href='../main/main.jsp?menu_gubun=guestbook_list';");
		out.println("</script>");	
	}else{
		out.println("<script>");
		out.println("alert('등록하는 과정에 오류가 생겼습니다');");
		out.println("location.href='../main/main.jsp?menu_gubun=guestbook_chuga';");
		out.println("</script>");
	}

%>
