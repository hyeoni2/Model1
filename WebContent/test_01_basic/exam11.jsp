<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1-예제 11</title>
</head>
<body>

<h2>배열</h2>

<%
//String[] arrayStr = {"a", "b", "c", "d", "e"};//배열의 선언 및 초기화

	String[] arrayStr = new String[5];
	arrayStr[0] = "a";
	arrayStr[1] = "b";
	arrayStr[2] = "c";
	arrayStr[3] = "d";
	arrayStr[4] = "e";

	String msg = "";
	int arrayStrLen = arrayStr.length;
	msg += "arrayStr 배열의 길이 : "+arrayStrLen+"<br>";
	
	int i = 0;
	for(i = 0; i < arrayStr.length; i++){
		msg += "arrayStr의 "+i+ "번째 인덱스의 값 : "+ arrayStr[i]+"<br>";
	}
	out.println("i의 값" + i + "<br>");	
	out.println(msg);	
%>





</body>
</html>