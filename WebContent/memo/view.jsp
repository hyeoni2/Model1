<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	MemoDTO dto = new MemoDTO();
	dto.setNo(no);
	
	MemoDAO dao = new MemoDAO();
	
	
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

<h2><%=dto.getNo() %>번 메모장</h2>
<table id="table">
	<tr>
		<th width="100px">
			순번
		</th>
		<td>
			<%=dto.getNo() %>
		</td>
	</tr>
		<tr>
		<th>
			작성자
		</th>
		<td>
			<%=dto.getWriter() %>
		</td>
	</tr>
	<tr>
		<th>
			내용
		</th>
		<td>
			<textarea name="content" rows="3" cols="50"><%=dto.getContent() %>
			</textarea>
		</td>
	</tr>
	<tr>
		<th>
			등록일
		</th>
		<td>
			<%=dto.getRegi_date() %>
		</td>
	</tr>
</table>
|
<a href="../main/main.jsp?menu_gubun=memo_chuga">등록</a>
|
<a href="../main/main.jsp?menu_gubun=memo_sujung&no=<%=dto.getNo() %>">수정</a>
|
<a href="../main/main.jsp?menu_gubun=memo_list">목록</a>
|
<a href="../main/main.jsp?menu_gubun=memo_sakjae&no=<%=dto.getNo() %>">삭제</a>