<%@page import="guestbook.model.dto.GuestBookDTO"%>
<%@page import="guestbook.model.dao.GuestBookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h2>방명록 등록</h2>
<form name="chugaForm">
	<table border="0">
		<tr>
			<td>이름</td>
			<td><input type="text" name="name" ></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<textarea name="content" style="width: 300px; height: 50px;"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="chuga();">방명록등록</button>
				<button type="button" onclick="list();">목록으로</button>
			</td>
		</tr>
		
	</table>
</form>
<script>
	function list() {
		location.href = "../main/main.jsp?menu_gubun=guestbook_list";
	}
	function chuga() {
		if(confirm('등록하시겠습니까?')){
			chugaForm.method = 'post';
			chugaForm.action = '../guestbook/chugaProc.jsp';
			chugaForm.submit();
		}
	}
</script>