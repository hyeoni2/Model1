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
<h2>방명록 수정</h2>
<form name="sujungForm">
	<table border="0">
	<input type="hidden" name="no" value="<%=no %>">
		<tr>
			<td width="100px;">순번</td>
			<td width="200px;"><%=dto.getNo() %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" value="<%=dto.getName() %>"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>
				<input type="text" name="email" value="<%=dto.getEmail()%>">
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
			<textarea name="content" style="width: 300px; height: 50px;" ><%=dto.getContent() %></textarea>
		</tr>
		<tr>
			<td>등록일</td>
			<td><%=dto.getRegi_date() %></td>
		</tr>
		<tr>
			
			<td colspan="2" align="center">
				<button type="button" onclick="sujung();">수정하기</button>
				<button type="button" onclick="list();">목록으로</button>
			</td>
		</tr>
		
	</table>
</form>
<script>
	function list() {
		location.href = "../main/main.jsp?menu_gubun=guestbook_list";
	}
	function sujung() {
		if(confirm('수정하시겠습니까?')){
		sujungForm.method = 'post';
		sujungForm.action = '../guestbook/sujungProc.jsp';
		sujungForm.submit();
		}
	}
</script>