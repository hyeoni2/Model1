<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h2>회원가입</h2>
<form name="joinForm"  method="post" action="exam07Proc.jsp">
	<table border="1" width = "400">	
		
		<tr>
			<td width="150" align="center">아이디  </td>
			<td align="center">
				<input type="text" name="id" value="">
			</td>
		</tr>
		
		<tr>
			<td align="center">비밀번호  </td>
			<td align="center">
				<input type="password" name="passwd" value="">
			</td>
		</tr>
		
		<tr>
			<td align="center">비밀번호 확인 </td>
			<td align="center">
				<input type="password" name="confirm_passwd" value="">
			</td>
		</tr>
		
		<tr>
			<td align="center">이름  </td>
			<td align="center">
				<input type="text" name="name" value="">
			</td>
		</tr>
		
		<tr>
			<td align="center">전화번호  </td>
			<td align="center">
				<input type="text" name="phone" value="">
			</td>
		</tr>
		
		<tr>
			<td align="center">이메일  </td>
			<td align="center">
				<input type="text" name="email" value="">
			</td>
		</tr>
	
		<tr>
			<td align="center">출생년도 </td>
			<td align="center">
				<input type="text" name="birthYear" value="">
			</td>
		</tr>

		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="join();">가입하기</button>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
	function join() {
		if(document.joinForm.id.value == ""){
			alert('아이디를 입력해주세요');
			document.joinForm.id.focus();
			return;
		}else if(document.joinForm.passwd.value == ""){
			alert('비밀번호를 입력해주세요');
			document.joinForm.passwd.focus();
			return;
		}else if(document.joinForm.confirm_passwd.value == ""){
			alert('비밀번호 확인을 다시한번 입력해주세요');
			document.joinForm.confirm_passwd.focus();
			return;
		}else if(document.joinForm.name.value == ""){
			alert('이름을 입력해주세요');
			document.joinForm.name.focus();
			return;
		}else if(document.joinForm.phone.value == ""){
			alert('전화번호를 입력해주세요');
			document.joinForm.phone.focus();
			return;
		}else if(document.joinForm.email.value == ""){
			alert('이메일을 입력해주세요');
			document.joinForm.email.focus();
			return;
		}else if(document.joinForm.birthYear.value == ""){
			alert('출생년도를 입력해주세요');
			document.joinForm.birthYear.focus();
			return;
		}
		
		if(document.joinForm.confirm_passwd.value != document.joinForm.passwd.value){
			alert('비밀번호가 맞지 않습니다. 다시 확인해주세요');
			document.joinForm.birthYear.focus();
			return;
		}
		
		joinForm.submit();
		
	}
</script>

</body>
</html>