<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 - 예제 1</title>
</head>
<body>

<h2>Model1 예제</h2>

<% //스크립트릿
	String name = "홍길동";
	int age = 19;
	String gender = "남";

	name = "이성순";
	age = 21;
	gender = "여";
	
	int a = 1;
	int b = 2;
	int c = 3;

%>

당신의 이름은 <%=name%>입니다.<!-- 표현식(Expression) --><br>
당신의 나이는 <%=age%>세입니다.<br>
당신의 성별은 <%=gender%>자입니다.<br>
<%=a+b+c %>
<hr>

당신의 이름은 <%out.print(name);%>입니다.<br>
당신의 나이는 <%out.println(age); %>세입니다.<br>
당신의 성별은 <%out.print(gender);%>자입니다.<br>

<hr>

<%
	name = "이상대";
	age = 66;
%>

이름 : <%=name %> / <%out.println(name); %><br>
나이 : <%=age %> / <%out.println(age); %>

<hr>

<%
//스크립트릿 안에 들어가는 것은 자바코드이다.

	String irum;//선언
	int hakbun;
	
	irum = "김두한";//초기화
	hakbun = 1001;
	
	String addr = "대구";//선언 및 초기화
			
%>

<hr>

<%
	int dan = 9;	
%>

<%=dan %> × 1 = <%=dan * 1 %> <br>
<%out.println(dan); %> × 2 = <%out.println(dan * 2);%> <br>
<%=dan %> × 3 = <%=dan * 3 %> <br>
<%=dan %> × 4 = <%=dan * 4 %> <br>
<%=dan %> × 5 = <%=dan * 5 %> <br>
<%=dan %> × 6 = <%=dan * 6 %> <br>
<%=dan %> × 7 = <%=dan * 7 %> <br>
<%=dan %> × 8 = <%=dan * 8 %> <br>
<%=dan %> × 9 = <%=dan * 9 %>

<hr>

<!-- html주석  -->
<%-- jap 주석 --%>

<%
	for(int i = 1; i < 10; i++){
		out.println(dan + " × " + i + " = " + (dan*i) + "<br>");
	}
%>

</body>
</html>