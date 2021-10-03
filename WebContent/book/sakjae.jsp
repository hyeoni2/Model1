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
	dto= dao.getSelectOne(dto);
	
	if(dto.getBook_rev() == null){
		String book_rev = "";
		dto.setBook_rev(book_rev);
	}
	
%>

<h2>도서 삭제</h2>
<form name="sakjaeForm">
	<input type="hidden" name="book_id" value="<%=dto.getBook_id()%>"> 
	<table>
		<tr>
			<tr>
			<td width="100px">도서 코드</td>
			<td>
				<%=dto.getBook_id()%>
			</td>
		</tr>
		<tr>
			<td>도서 제목</td>
			<td>
				<%=dto.getTitle()%>
			</td>
		</tr>
		<tr>
			<td>작가</td>
			<td>
				<%=dto.getAuthor()%>
			</td>
		</tr>
		<tr>
			<td>책 소개</td>
			<td>
				<textarea rows="3" cols="30" name="book_rev" readonly="readonly">
					<%=dto.getBook_rev()%>
				</textarea>
			</td>
		</tr>
		<tr>
			<td>출판사</td>
			<td>
				<%=dto.getPublisher()%>
			</td>
		</tr>
		<tr>
			<td>출판일</td>
			<td>
				<%=dto.getPublisher_date()%>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="sakjae();">삭제하기</button>
				<button type="button" onclick="list();">목록으로</button>
			</td>
		</tr>
	</table>
</form>
<script>
	function list() {
		location.href = '../main/main.jsp?menu_gubun=book_list'
	}
	function sakjae() {
		
		if(confirm('삭제하시겠습니까?')){
			sakjaeForm.method = 'post';
			sakjaeForm.action = '../book/sakjaeProc.jsp';
			sakjaeForm.submit();
		}	
	}
</script>

