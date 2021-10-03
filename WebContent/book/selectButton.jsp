<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String select = request.getParameter("select");

	if(select.equals("y")){
		select = "n";
	}else{
		select = "y";
	}
	
	String url = "../main/main.jsp?menu_gubun=book_list&select="+select;
%>
<script>
	location.href = "<%=url %>";
</script>