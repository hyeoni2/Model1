<%@page import="guestbook.model.dto.GuestBookDTO"%>
<%@page import="guestbook.model.dao.GuestBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String tmp = request.getParameter("no");	
	int no = Integer.parseInt(tmp);
	System.out.println(no);

	GuestBookDTO dto = new GuestBookDTO();
	dto.setNo(no);

	GuestBookDAO dao = new GuestBookDAO();
	int result = dao.delete(dto);
	
	String msg = "";
	String url = "";
	if(result > 0){
		msg = "정상적으로 삭제되었습니다";
		url = "../main/main.jsp?menu_gubun=guestbook_list";
	}else{
		msg = "삭제하는 과정에 오류가 생겼습니다";
		url = "../main/main.jsp?menu_gubun=guestbook_sakjae&no="+no;
	}
		out.println("<script>");
		out.println("alert('"+msg+"');");
		out.println("location.href='"+url+"';");
		out.println("</script>");
%>
