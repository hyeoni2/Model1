<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<h2>로그인</h2>
<form name="fff" method="post" action="exam04Proc.jsp">
	<table border="1" width = "400">
		<tr>
			<td width="150" align="center">아이디</td>
			<td align="center"><input type="text" name="id" value=""></td>
		</tr>
		
		<tr>
			<td align="center">비밀번호</td>
			<td align="center"><input type="password" name="passwd" value=""></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center" height="40">
				<button type="button" onclick="formCheck();">로그인</button>
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript">
	function formCheck(){
		
		if(document.fff.id.value == ""){
				alert('아이디를 입력해주세요');
				document.fff.id.focus();
				return;
		}

		if(document.fff.passwd.value == ""){
				alert('비밀번호를 입력해주세요');
				document.fff.passwd.focus();
				return;
		}

		document.fff.submit();
	}
</script>

</body>
</html>


