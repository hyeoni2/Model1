<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../member/member_header.jsp" %>

<h2>도서 등록</h2>
<form name="chugaForm">
	<table>
		<tr>
			<td width="100px">도서 코드</td>
			<td>
				<input type="text" name="book_id">
			</td>
		</tr>
		<tr>
			<td>도서 제목</td>
			<td>
				<input type="text" name="title">
			</td>
		</tr>
		<tr>
			<td>작가</td>
			<td>
				<input type="text" name="author">
			</td>
		</tr>
		<tr>
			<td>출판사</td>
			<td>
				<input type="text" name="publisher">
			</td>
		</tr>
		<tr>
			<td>출판일</td>
			<td>
				<input type="text" name="publisher_date" placeholder="yyyy-mm-dd형식으로 입력">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="chuga();">등록하기</button>
				<button type="button" onclick="list();">목록으로</button>
			</td>
		</tr>
	</table>
</form>
<script>
	function list() {
		location.href = '../main/main.jsp?menu_gubun=book_list'
	}
	function chuga() {
		if(chugaForm.book_id.value==""){
			alert('도서 코드를 입력해주십시오');
			chugaForm.book_id.focus();
			return;
		}
		if(chugaForm.title.value==""){
			alert('도서 제목을 입력해주십시오');
			chugaForm.title.focus();
			return;
		}
		if(chugaForm.author.value==""){
			alert('작가를 입력해주십시오');
			chugaForm.author.focus();
			return;
		}
		if(chugaForm.publisher.value==""){
			alert('출판사를입력해주십시오');
			chugaForm.publisher.focus();
			return;
		}
		if(chugaForm.publisher_date.value==""){
			alert('출판일(yyyy-mm-dd)을 입력해주십시오');
			chugaForm.publisher_date.focus();
			return;
		}
		
		if(confirm('등록하시겠습니까?')){
			chugaForm.method = 'post';
			chugaForm.action = '../book/chugaProc.jsp';
			chugaForm.submit();
		}	
	}
</script>

