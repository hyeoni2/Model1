<%@page import="java.sql.Date"%>
<%@page import="book.model.dao.BookDAO"%>
<%@page import="book.model.dto.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String book_id = request.getParameter("book_id");
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String book_rev = request.getParameter("book_rev");
	String publisher = request.getParameter("publisher");
	
	String publisher_date_ = request.getParameter("publisher_date");
	Date publisher_date = Date.valueOf(publisher_date_);

	BookDTO dto = new BookDTO();
	dto.setBook_id(book_id);
	dto.setTitle(title);
	dto.setAuthor(author);
	dto.setBook_rev(book_rev);
	dto.setPublisher(publisher);
	dto.setPublisher_date(publisher_date);
	
	BookDAO dao = new BookDAO();
	int result = dao.setUpdate(dto);
	
	if(result > 0){//성공
		out.println("<script>");
		out.println("alert('성공적으로 수정되었습니다.');");
		out.println("location.href = '../main/main.jsp?menu_gubun=book_view&book_id="+book_id+"';");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('회원수정 중 오류가 발생했습니다.');");
		out.println("location.href = '../main/main.jsp?menu_gubun=book_sujung&book_id="+book_id+"';");
		out.println("</script>");
	}
	
%>



