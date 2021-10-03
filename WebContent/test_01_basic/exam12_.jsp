<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 -예제 13</title>

</head>
<body>

	<a href="exam13.jsp?dan=2">2단 |</a>
	<a href="exam13.jsp?dan=3">3단 |</a>
	<a href="exam13.jsp?dan=4">4단 |</a>
	<a href="exam13.jsp?dan=5">5단 |</a>
	<a href="exam13.jsp?dan=6">6단 |</a>
	<a href="exam13.jsp?dan=7">7단 |</a>
	<a href="exam13.jsp?dan=8">8단 |</a>
	<a href="exam13.jsp?dan=9">9단 </a>
<hr>
<%
	String dan_ = request.getParameter("dan");
	int dan = Integer.parseInt(dan_);
%>

<h2>구구단</h2>
<br>
<b> <%=dan %>단 출력</b><br>
<%		
		for(int i = 1; i < 10; i++){
			String result = dan +" × "+i+" = "+(dan * i)+"<br>";
			out.println(result);
		
		}

%>
</body>
</html>