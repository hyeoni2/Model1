<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 - 예제 8</title>
</head>
<body>

<h2>구구단</h2>

<form name="danForm">
	<table>
		<tr>
			<td>단 : </td>
			<td>
				<input type="text" name="dan">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="danOn();">확인</button>
			</td>
		</tr>
	</table>
</form>

<script type="text/javascript">
	function danOn() {
		if (confirm('실행하시겠습니까?')) {
			document.danForm.method = 'post';
			document.danForm.action = 'exam08Proc2.jsp';
			document.danForm.submit();
		}
		
	}
</script>


</body>
</html>