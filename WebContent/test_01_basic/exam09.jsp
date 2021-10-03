<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1-예제 9</title>
</head>
<body>

<h2>무제</h2>

테이블이 4개 생성
<%for(int i =1; i<5; i++){ %>
	<table border="1" width="300">
			<tr>
				<td>111</td>
			</tr>
		</table>
	<br>
<%} %>

<hr>

row가 4개 생성
<table border="1" width="300">
	<%for(int i =1; i<5; i++){ %>
		<tr>
			<td>111</td>
		</tr>
	<%} %>
</table>

<hr>

칸이 4칸 생성
<table border="1" width="300">
	<tr>
		<%for(int i =1; i<5; i++){ %>
			<td>111</td>
		<%} %>
	</tr>
</table>



</body>
</html>