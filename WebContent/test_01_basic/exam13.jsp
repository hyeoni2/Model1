<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 -예제 13</title>
<style type="text/css">
a{
	text-decoration: none;
	color: black;
}

</style>
</head>
<body>
<%

	String dan_ = request.getParameter("dan");
	if(dan_ == null || dan_.equals("")){
		dan_ = "2";
	}
	
	int dan = Integer.parseInt(dan_);
%>
	<%if(dan == 2){%>
		<a href="exam13.jsp?dan=2"><font style="color: blue;">
		<b>2단 |</b>
		</font>
		</a>
	<%}else{%>
		<a href="exam13.jsp?dan=2">2단 |</a>
	<%}%>
	
	<%if(dan == 3){%>
		<a href="exam13.jsp?dan=3"><font style="color: blue;">
		<b>3단 |</b>
		</font>
		</a>
	<%}else{%>
		<a href="exam13.jsp?dan=3">3단 |</a>
	<%}%>
	
	<%if(dan == 4){%>
		<a href="exam13.jsp?dan=4"><font style="color: blue;">
		<b>4단 |</b>
		</font>
		</a>
	<%}else{%>
		<a href="exam13.jsp?dan=4">4단 |</a>
	<%}%>
	
	<%if(dan == 5){%>
		<a href="exam13.jsp?dan=5"><font style="color: blue;">
		<b>5단 |</b>
		</font>
		</a>
	<%}else{%>
		<a href="exam13.jsp?dan=5">5단 |</a>
	<%}%>
	
	<%if(dan == 6){%>
		<a href="exam13.jsp?dan=6"><font style="color: blue;">
		<b>6단 |</b>
		</font>
		</a>
	<%}else{%>
		<a href="exam13.jsp?dan=6">6단 |</a>
	<%}%>
	
	<%if(dan == 7){%>
		<a href="exam13.jsp?dan=7"><font style="color: blue;">
		<b>7단 |</b>
		</font>
		</a>
	<%}else{%>
		<a href="exam13.jsp?dan=7">7단 |</a>
	<%}%>
	
	<%if(dan == 8){%>
		<a href="exam13.jsp?dan=8"><font style="color: blue;">
		<b>8단 |</b>
		</font>
		</a>
	<%}else{%>
		<a href="exam13.jsp?dan=8">8단 |</a>
	<%}%>
	
	<%if(dan == 9){%>
		<a href="exam13.jsp?dan=9"><font style="color: blue;">
		<b>9단 |</b>
		</font>
		</a>
	<%}else{%>
		<a href="exam13.jsp?dan=9">9단 |</a>
	<%}%>

<hr>

<h2>구구단</h2>

<%
	System.out.println(dan);
	
%>
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