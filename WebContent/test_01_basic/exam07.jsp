<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 - 예제 7</title>
</head>
<body>

<h2>로그인</h2>

<form name="loginForm">
	<table>
		<tr>
			<td>아이디 :</td>	
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호 :</td>	
			<td><input type="password" name="passwd"></td>
		</tr>
		<tr>
			<td colspan="2">
			<button type="button" onclick="login();">로그인</button>
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript">
	function login() {
		if(confirm('로그인하시겠습니까?')){
			document.loginForm.method = 'post';
			document.loginForm.action = 'exam07Proc.jsp';
			document.loginForm.submit();
		}
		
	}
</script>
</body>
</html>