<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>회원가입</h2>

<form name="form" method="post" action="exam05Proc.jsp">
<table border="1" width = "400">
	<tr>
		<td width="100">
			아이디(*) :
		</td>
		<td>
		 	<input type="text" name="id" value=""><br>
		</td>
	</tr>
	<tr>
		<td>
			비밀번호(*) :
		</td>
		<td>	
			 <input type="password" name="passwd" value=""><br>
		</td>
	</tr>
	<tr>
		<td>
			이름(*) :
		</td>
		<td>
		 	<input type="text" name="name" value=""><br>
		</td>
	</tr>
	<tr>
		<td>
			연락처(*) :
		</td>
		<td>
	 		<input type="text" name="phone" value=""><br>
	 	</td>
	</tr>
	<tr>
		<td>
			성별 :
		</td> 
		<td>
			<input type="radio" name="gender" value="M" checked>남자 &nbsp;
			<input type="radio" name="gender" value="F">여자<br>
		</td>
	</tr>
	<tr>
		<td>
			주소(*) :
		</td>
		<td>
			<select name="addr">
				<option value="">선택하세요</option>
				<option value="서울">서울</option>
				<option value="경기">경기</option>
				<option value="대전">대전</option>
				<option value="부산">부산</option>
				<option value="광주">광주</option>
				<option value="전주">전주</option>
				<option value="강원">강원</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>
			관심분야 :
		</td>
		<td>
			<input type="checkbox" name="hobby" value="여행">여행 &nbsp;
			<input type="checkbox" name="hobby" value="독서">독서 &nbsp;
			<input type="checkbox" name="hobby" value="영화감상">영화감상<br>
			<input type="checkbox" name="hobby" value="골프">골프 &nbsp;
			<input type="checkbox" name="hobby" value="게임">게임 &nbsp;
			<input type="checkbox" name="hobby" value="기타">기타 &nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onclick="join();">확인</button>
		</td>
	</tr>
</table>
</form>
<script>
	function join() {
		if(document.form.id.value == ""){
			alert('아이디를 입력해주세요');
			document.form.id.focus();
			return;
		}else if(document.form.passwd.value == ""){
			alert('비밀번호를 입력해주세요');
			document.form.passwd.focus();
			return;
		}else if(document.form.name.value == ""){
			alert('이름을 입력해주세요');
			document.form.name.focus();
			return;
		}else if(document.form.phone.value == ""){
			alert('연락처를 입력해주세요');
			document.form.phone.focus();
			return;
		}else if(document.form.addr.value == ""){
			alert('주소를 선택해주세요');
			return;
		}
		
		document.form.submit();
		
	}
</script>
</body>
</html>