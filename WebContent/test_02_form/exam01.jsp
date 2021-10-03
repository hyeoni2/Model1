<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여러가지 form</title>
</head>
<body>
<form name="form1" method="post" action="exam01Proc1.jsp">
	<table border="1" width = "400">
		<tr>
			<td width = "100" align="center">이름</td>
			<td align="center"><input type="text" name="name"></td> 
		</tr>
		<tr>
			<td align="center">나이</td>
			<td align="center"><input type="text" name="age"></td> 
		</tr>
		<tr>
			
			<td colspan="2" align="center" height="40">
			
			닉네임 : <input type="text" name="nickName"><br>
			
				<button type="submit">확인</button>
			</td> 
		</tr>
	</table>
</form>

<hr>

<form name="form2" method="post" action="exam01Proc2.jsp">
	<table border="1" width="400">
		<tr>
			<td width = "100" align="center">영화제목</td>
			<td align="center"><input type="text" name="subject"></td> 
		</tr>
		<tr>
			<td align="center">상영관</td>
			<td align="center"><input type="text" name="place"></td> 
		</tr>
		<tr>
			
			<td colspan="2" align="center" height="40">			
				<button type="submit">확인</button>
			</td> 
		</tr>
	</table>
</form>
<hr>
<button type="submit">확인</button>

</body>
</html>