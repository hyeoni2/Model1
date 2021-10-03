<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
		request.setCharacterEncoding("UTF-8");
		
		String movie_subject = request.getParameter("movie_subject");
		String movie_place = request.getParameter("movie_place");
		/* 		
		out.println("영화 제목 : "+movie_subject+"<br>");
		out.println("상영관 : "+movie_place);
		
		String movePage = "";
		movePage = "exam15Result.jsp";
		movePage += "?movie_subject="+movie_subject;
		movePage += "&movie_place="+movie_place;
		response.sendRedirect(movePage); //get방식
		*/
		
%>

<form name="form01" method="post" action="exam15Result.jsp">
	<input type="hidden" name="movie_subject" value="<%=movie_subject%>"><br>
	<input type="hidden" name="movie_place"  value="<%=movie_place%>">
</form>	

<script>
	document.form01.submit();//자동으로 보내는 것
</script>