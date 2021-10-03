<%@page import="sungjuk.model.dao.SungjukDAO"%>
<%@page import="sungjuk.model.dto.SungjukDTO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	System.out.println(no);
	
	SungjukDTO dto = new SungjukDTO();
	dto.setNo(no);
	
	SungjukDAO dao = new SungjukDAO();
	
	int result = dao.delete(dto);
	
	
		if(result > 0){
			out.print("<script>");
			out.print("alert('정상적으로 삭제되었습니다');");
			out.print("location.href = '../main/main.jsp?menu_gubun=sungjuk_list';");
			out.print("</script>");	
		}else{
			out.print("<script>");
			out.print("alert('삭제하는 과정에서 오류가 생겼습니다.');");
			out.print("location.href = '../main/main.jsp?menu_gubun=sungjuk_sakjae&id="+no+"';");
			out.print("</script>");	
		}
		
%>
