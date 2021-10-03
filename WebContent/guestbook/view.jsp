<%@page import="guestbook.model.dto.GuestBookDTO"%>
<%@page import="guestbook.model.dao.GuestBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String tmp = request.getParameter("no");	
	int no = Integer.parseInt(tmp);
	System.out.println(no);
	
	String search_option = request.getParameter("search_option");
	String search_data = request.getParameter("search_data");
	
	if(search_option == null || search_data == null || search_option.trim().equals("") || search_data.trim().equals("")) {
		search_data = "";
		search_option = "";
	}
	
	GuestBookDTO dto = new GuestBookDTO();
	dto.setNo(no);

	GuestBookDAO dao = new GuestBookDAO();
	dto = dao.getSelectOne(dto);
%>

<style>

	a{
		text-decoration: none;
		color: black;
	}
	
	#table {
	  font-family: Arial, Helvetica, sans-serif;
	  border-collapse: collapse;
	  width: 80%;
	}
	
	#table td, #table th {
	  border: 1px solid #ddd;
	  padding: 8px;
	}
	
	#table tr:nth-child(even){background-color: #f2f2f2;}
	
	#table tr:hover {background-color: #ddd;}
	
	#table th {
	  padding-top: 12px;
	  padding-bottom: 12px;
	  background-color: #4A0084;
	  color: white;
	}
	
</style>

<h2>방명록 상세 조회</h2>
<table id="table">
	<tr>
		<th width="100px;">순번</th>
		<td width="200px;"><%=dto.getNo() %></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><%=dto.getName() %></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><%=dto.getEmail() %></td>
	</tr>
	<tr>
		<th>내용</th>
		<td>		
			<textarea name="content" rows="3" cols="50" readonly="readonly"><%=dto.getContent() %>
			</textarea>
		</td>
	</tr>
	<tr>
		<th>등록일</th>
		<td><%=dto.getRegi_date() %></td>
	</tr>
</table>
|
<a href="../main/main.jsp?menu_gubun=guestbook_chuga">등록</a>
|
<a href="../main/main.jsp?menu_gubun=guestbook_sujung&no=<%=dto.getNo() %>">수정</a>
|
<a href="../main/main.jsp?menu_gubun=guestbook_list&search_option=<%=search_option %>&search_data=<%=search_data%>">목록</a>
|
<a href="../main/main.jsp?menu_gubun=guestbook_sakjae&no=<%=dto.getNo() %>">삭제</a>
|