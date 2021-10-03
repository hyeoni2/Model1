<%@page import="memo.model.dto.MemoDTO"%>
<%@page import="memo.model.dao.MemoDAO"%>

<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String tmp = request.getParameter("no");
	int no = Integer.parseInt(tmp);
	System.out.println(no);
	
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	System.out.println(writer);
	System.out.println(content);
	
	
	MemoDTO dto = new MemoDTO();
	dto.setNo(no);
	dto.setWriter(writer);
	dto.setContent(content);


	
	MemoDAO dao = new MemoDAO();
	int result = dao.setUpdate(dto);
	
	String msg = "";
	
	if(result > 0){
		msg = "정상적으로 수정이 되었습니다.";
	}else{
		msg = "수정하는 과정에서 오류가 생겼습니다.";
	}
		
	out.print("<script>");
	out.print("alert('"+msg+"');");
	out.print("location.href = '../main/main.jsp?menu_gubun=memo_sujung&no="+no+"';");
	out.print("</script>");	
		
	
%>
