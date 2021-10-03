<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width = "80%" align = "center">
	<tr style="background-color: #B988EB;">
		<td style="height: 100px;" align="center">
			<b style="color: white; font-size: 30px">Suhyeon's Homepage</b>
		</td>
	</tr>
	
	<tr>
		<td style="height: 400px;" align="center">
			<font style="font-size: 50px;"><b></b></font>
			<h2>로그인</h2>
			<form name="form" method="post" action="/jsp_mvc1/member/loginProc.jsp">
			<table>
			<tr>
				<td width="100px">
					&nbsp;&nbsp;&nbsp;아이디 :
				</td>
				<td>
					<input type="text" name="id"><br>
				</td>
			</tr>
			<tr>
				<td>
					비밀번호 :
				</td>
				<td> 
					<input type="text" name="passwd">&nbsp;
				</td>
				<td>
					<button type="submit">로그인</button>
				</td>
			</tr>
			</table>
			</form>
			
		</td>
	</tr>
		<tr style="background-color: #B988EB;">
			<td style="height: 100px;" align="center">
				<%@include file="/include/inc_bottom.jsp" %>
		</td>
	</tr>
</table>

</body>
</html>