<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 - 예제 15</title>
</head>
<body>

<h2>SUBMIT</h2>
<form name="submitForm">
	<table>
		<tr>
			<td>영화 제목 :</td>
			<td><input type="text" name="movie_subject"></td>
			
		</tr>
	
		<tr>
			<td>상영관 :</td>
			<td><input type="text" name="movie_place"></td>
			
		</tr>
		<tr>
			<td><button type="button" onclick="submitC();">확인</button></td>
			
		</tr>
		
	</table>
</form>
<script type="text/javascript">
	function submitC() {
		if(confirm('확인하시겠습니까?')){
			document.submitForm.method = 'post';
			document.submitForm.action = 'exam15Proc.jsp';
			document.submitForm.submit();
		}
	}
</script>
</body>
</html>