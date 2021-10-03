<%@page import="memo.model.dto.MemoDTO"%>
<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	

	
	MemoDTO dto = new MemoDTO();
	dto.setWriter(writer);
	dto.setContent(content);
	
	System.out.println(writer);
	System.out.println(content);


	
	MemoDAO dao = new MemoDAO();
	int result = dao.setInsert(dto);
	
	if (result > 0) {
		out.print("<script>");
		out.print("location.href = '../main/main.jsp?menu_gubun=memo_list';");
		out.print("</script>");
	} else {
		out.print("<script>");
		out.print("alert('등록하는 과정에서 오류가 생겼습니다.');");
		out.print("location.href = '../main/main.jsp?menu_gubun=memo_chuga';");
		out.print("</script>");
	}
		/*************************************************************/

%>