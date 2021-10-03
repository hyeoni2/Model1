<%@page import="java.sql.Clob"%>
<%@page import="book.model.dao.BookDAO"%>
<%@page import="book.model.dto.BookDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String book_id = request.getParameter("book_id");

	BookDTO dto = new BookDTO();
	dto.setBook_id(book_id);
	
	BookDAO dao = new BookDAO();
	dto = dao.getSelectOne(dto);
	
	if(dto.getBook_rev() == null){
		String book_rev = "";
		dto.setBook_rev(book_rev);
	}

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

<h2><%=dto.getBook_id() %>번 도서 상세 조회</h2>
	<table id="table" >
		<tr>
			<th width="100px">도서 코드</th>
			<td>
				<%=dto.getBook_id()%>
			</td>
		</tr>
		<tr>
			<th>도서 제목</th>
			<td>
				<%=dto.getTitle()%>
			</td>
		</tr>
		<tr>
			<th>작가</th>
			<td>
				<%=dto.getAuthor()%>
			</td>
		</tr>
		<tr>
			<th>책 소개</th>
			<td>
				<textarea rows="3" cols="50" name="book_rev" readonly="readonly" ><%=dto.getBook_rev()%>
				</textarea>
			</td>
		</tr>
		<tr>
			<th>출판사</th>
			<td>
				<%=dto.getPublisher()%>
			</td>
		</tr>
		<tr>
			<th>출판일</th>
			<td>
				<%=dto.getPublisher_date()%>
			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>
				<%=dto.getInsert_date() %>
			</td>
		</tr>
	</table>
	
	|
	<a href="../main/main.jsp?menu_gubun=book_chuga">등록</a>
	|
	<a href="../main/main.jsp?menu_gubun=book_sujung&book_id=<%=dto.getBook_id()%>">수정</a>
	|
	<a href="../main/main.jsp?menu_gubun=book_list">목록</a>
	|
	<a href="../main/main.jsp?menu_gubun=book_sakjae&book_id=<%=dto.getBook_id()%>">삭제</a>
	|



