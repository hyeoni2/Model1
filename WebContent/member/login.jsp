<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


			<!-- 본문 내용 시작 -->
			
<h2>로그인</h2>
<form name="loginForm">
<table>
	<tr>
		<td>아이디 : </td>
		<td>
			<input type="text" name="id">
		</td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td>
			<input type="password" name="passwd">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onclick="login();">로그인</button>
			<button type="button" onclick="home();">홈으로</button>
		</td>
	</tr>	
</table>
</form>			
			<!-- 본문 내용 종료 -->
<script>
function login() {
	if('로그인하시겠습니까?'){
		document.loginForm.method = 'post';
		document.loginForm.action = '../member/loginProc.jsp';
		document.loginForm.submit();
	}
	
}

function home() {
	location.href = '/jsp_mvc1';	
}
</script>