<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>    
<%

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);	

	String id = request.getParameter("id");
	
	String password = request.getParameter("password");

	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	
	MemberDAO dao = new MemberDAO();
	int result = dao.delete(dto);
	System.out.println(id+"값은 이거");


	String msg = "";
	String url = "";	
	if(result > 0){
		msg = "정상적으로 삭제되었습니다.";
		url = "../main/main.jsp?menu_gubun=member_list";
	}else{
		msg = "처리중 오류가 발생했습니다.";
		url = "../main/main.jsp?menu_gubun=member_view&no="+no;
	}
	
	out.println("<script>");
	out.println("alert('"+msg+"');");
	out.println("location.href = '"+url+"';");
	out.println("</script>");

%>

