<%@page import="oracle.sql.DATE"%>
<%@page import="java.sql.Date"%>
<%@page import="book.model.dao.BookDAO"%>
<%@page import="book.model.dto.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<%
	String book_id = request.getParameter("book_id");
	String title = request.getParameter("title");
	String author = request.getParameter("author");
	String publisher = request.getParameter("publisher");
	String publisher_date_ = request.getParameter("publisher_date");
	Date publisher_date  = Date.valueOf(publisher_date_);
	
	System.out.println(book_id);
	System.out.println(title);
	System.out.println(author);
	System.out.println(publisher);
	System.out.println(publisher_date);
	
	BookDTO dto = new BookDTO();
	dto.setBook_id(book_id);
	dto.setTitle(title);
	dto.setAuthor(author);
	dto.setPublisher(publisher);
	dto.setPublisher_date(publisher_date);
	
	BookDAO dao = new BookDAO();
	int result = dao.setInsert(dto);

	if(result > 0){//성공
		out.println("<script>");
		out.println("alert('성공적으로 등록되었습니다.');");
		out.println("location.href = '../main/main.jsp?menu_gubun=book_list';");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('회원등록 중 오류가 발생했습니다.');");
		out.println("location.href = '../main/main.jsp?menu_gubun=book_chuga';");
		out.println("</script>");
	}
	
%>


