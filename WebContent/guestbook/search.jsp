<%@page import="java.util.ArrayList"%>
<%@page import="guestbook.model.dto.GuestBookDTO"%>
<%@page import="guestbook.model.dao.GuestBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String search_option = request.getParameter("search_option");
	String search_data = request.getParameter("search_data");

	if(search_option == null || search_data == null || search_option.trim().equals("") || search_data.trim().equals("")) {
		search_data = "";
		search_option = "";
	}
	String url = "../main/main.jsp?menu_gubun=guestbook_list&search_option="+search_option+"&search_data="+search_data;
	
%>
<script>
	location.href = "<%=url%>";
</script>