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

<form name="joinForm"  method="post" action="exam02Proc.jsp">
	<table border="1" width = "400">	
		
		<tr>
			<td width="150" align="center">아이디 : </td>
			<td align="center">
				<input type="text" name="id">
			</td>
		</tr>
		
		<tr>
			<td align="center">비밀번호 : </td>
			<td align="center">
				<input type="password" name="passwd">
			</td>
		</tr>
		
		<tr>
			<td align="center">비밀번호 확인 : </td>
			<td align="center">
				<input type="password" name="confirm_passwd">
			</td>
		</tr>
		
		<tr>
			<td align="center">이름 : </td>
			<td align="center">
				<input type="text" name="name">
			</td>
		</tr>
		
		<tr>
			<td align="center">전화번호 : </td>
			<td align="center">
				<select name="phone1">
					<option selected>선택</option>
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
				</select>
				<input type="text" name="phone2" style="width: 40px;" maxlength="4">-
				<input type="text" name="phone3" style="width: 40px;" maxlength="4">
			</td>
		</tr>
		
		<tr>
			<td align="center">이메일 : </td>
			<td align="center">
				<input type="text" name="email">
			</td>
		</tr>
	
		<tr>
			<td align="center">성별 : </td>
			<td align="center">
				<input type="radio" name="gender" value="M" checked>남자
				<input type="radio" name="gender" value="F">여자

			</td>
		</tr>

		<tr>
			<td colspan="2" align="center">
				<button type="submit">가입하기</button>
			</td>
		</tr>
	</table>
</form>

</body>
</html>