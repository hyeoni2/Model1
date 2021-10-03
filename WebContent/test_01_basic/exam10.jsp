<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1-예제 10</title>
</head>
<body>

<h2>i++의 중요성</h2>

<table border="1" width = "350">

	<%
		int i =1;
		while(i<=5){
			if(i>3){
				break;
			}
	%>
		<tr>
			<td>11</td>
			<td>22</td>
		</tr>
<%
	i++;
}
%>
</table>




</body>
</html>