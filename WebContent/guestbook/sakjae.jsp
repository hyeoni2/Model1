<%@page import="guestbook.model.dto.GuestBookDTO"%>
<%@page import="guestbook.model.dao.GuestBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String tmp = request.getParameter("no");	
	int no = Integer.parseInt(tmp);
	System.out.println(no);
	
	GuestBookDTO dto = new GuestBookDTO();
	dto.setNo(no);
	
	

	GuestBookDAO dao = new GuestBookDAO();
	dto = dao.getSelectOne(dto);
%>
<h2>방명록 삭제</h2>
<form name="sakjaeForm">
	<table border="0">
	<input type="hidden" name="no" value="<%=dto.getNo() %>">
		<tr>
			<td width="100px;">순번</td>
			<td width="200px;"><%=dto.getNo() %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=dto.getName() %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=dto.getEmail() %></td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
			<textarea name="content" style="width: 300px; height: 50px;" readonly="readonly"><%=dto.getContent() %></textarea>
		</tr>
		<tr>
			<td>등록일</td>
			<td><%=dto.getRegi_date() %></td>
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
		location.href = "../main/main.jsp?menu_gubun=guestbook_list";
	}
	function sakjae() {
		if(confirm('삭제하시겠습니까?')){
		sakjaeForm.method = 'post';
		sakjaeForm.action = '../guestbook/sakjaeProc.jsp';
		sakjaeForm.submit();
		}
	}
</script>