<%@page import="java.sql.Date"%>
<%@page import="book.model.dao.BookDAO"%>
<%@page import="book.model.dto.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String book_id = request.getParameter("book_id");
	String con_del = "Y";

	BookDTO dto = new BookDTO();
	dto.setBook_id(book_id);
	dto.setCon_del(con_del);

	
	BookDAO dao = new BookDAO();
	int result = dao.delete(dto);
	
	if(result > 0){//성공
		out.println("<script>");
		out.println("alert('성공적으로 삭제되었습니다.');");
		out.println("location.href = '../main/main.jsp?menu_gubun=book_list';");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('회원삭제 중 오류가 발생했습니다.');");
		out.println("location.href = '../main/main.jsp?menu_gubun=book_sakjae&book_id="+book_id+"';");
		out.println("</script>");
	}
	
%>



