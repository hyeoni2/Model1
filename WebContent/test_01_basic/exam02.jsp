<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 - 예제 2</title>
</head>
<body>

<h2>성적 처리</h2>

<%
	//입력
	String name = "홍길동";
	int kor = 90;
	int eng = 80;
	int mat = 70;
	int sci = 60;
	int his = 50;
	
	//처리
	int tot = kor + eng+ mat + sci + his;//정수와 정수의 연산은 무조건 정수
	double avg = tot / 5.0;
%>
<!-- 출력  -->
이름 : <%=name %><br>
국어 : <%=kor %><br>
영어 : <%=eng %><br>
수학 : <%=mat %><br>
과학 : <%=sci %><br>
역사 : <%=his %><br>
<b>총점 : <%=tot %><br>
평균 : <%=avg %></b><br>


</body>
</html>