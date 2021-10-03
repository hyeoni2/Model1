<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 - 예제 12</title>
</head>
<body>

<h2>성적처리</h2>

<form action="exam12Proc.jsp" method="post" name="sungjukForm">
	<table>
		<tr>
			<td>이름 :</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>국어 :</td>
			<td><input type="text" name="kor"></td>
		</tr>
		<tr>
			<td>영어 :</td>
			<td><input type="text" name="eng"></td>
		</tr>
		<tr>
			<td>수학 :</td>
			<td><input type="text" name="mat"></td>
		</tr>
		<tr>
			<td>과학 :</td>
			<td><input type="text" name="sci"></td>
		</tr>
		<tr>
			<td>역사 :</td>
			<td><input type="text" name="his"></td>
		</tr>
	</table>
	
	<hr>
	
	<table>
		<tr>
			<td>이름 :</td>
			<td><input type="text" name="name2"></td>
		</tr>
		<tr>
			<td>국어 :</td>
			<td><input type="text" name="kor2"></td>
		</tr>
		<tr>
			<td>영어 :</td>
			<td><input type="text" name="eng2"></td>
		</tr>
		<tr>
			<td>수학 :</td>
			<td><input type="text" name="mat2"></td>
		</tr>
		<tr>
			<td>과학 :</td>
			<td><input type="text" name="sci2"></td>
		</tr>
		<tr>
			<td>역사 :</td>
			<td><input type="text" name="his2"></td>
		</tr>
		<tr>
			<td>
				<button type="submit">확인</button>
			</td>
		</tr>
	</table>
</form>

</body>
</html>