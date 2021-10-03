<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 - 예제 3</title>
</head>
<body>

<h2>문자열 자르기 / 문자열 분리 (split)</h2>

<% 
	//리터럴(literal)
	String name = "이성순";
	String ssn = "961231-2456789";
	
	String[] arr = new String[5];
	String abc = "a-b-c-d-e-f";
	arr = abc.split("-");
	System.out.println(arr[0]);
	System.out.println(arr[1]);
	System.out.println(arr[2]);
	System.out.println(arr[3]);
	System.out.println(arr[4]);
	System.out.println(arr[5]);
	

	
	String tmp = ssn.substring(0, 2); //나이관련
	String tmp2 = ssn.substring(7, 8); //성별관련
	
	String gender = "여자";
	if(tmp2.equals("1") || tmp2.equals("3")){
		gender = "남자";
	}
	
	//나이
	int tmp3;
	if(tmp2.equals("1") || tmp2.equals("2")){
		tmp3 = 1900 + Integer.parseInt(tmp);
	}else{
		tmp3 = 2000 + Integer.parseInt(tmp);
	}
	int age = 2021 - tmp3 + 1;
		
%>

이름 : <%=name %><br>
나이 : <%=age %><br>
성별 : <%=gender %><br>
</body>
</html>