<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Model1 - 예제 4</title>
</head>
<body>

	<h2>합계 구하기 : 반복문</h2>
	<!-- 1~10까지 합계, 홀수합, 짝수합을 구한다.  -->
	
<%
	int sum = 0;
	int hab_odd  = 0;
	int hab_even = 0;
	
	
	int startValue = 1;
	int endValue = 10;

	//언제 끝나는지 알 수 있을 때 for, 모를 때는 while
/* 	
	for(int i = startValue; i <= endValue; i++){
		sum += i;
		if(i % 2 == 0){//짝수
			hab_even += i;
			out.println("<font style='color : blue;'><b>"+ i + "</b></font><br>");
		}else{
			hab_odd  += i;
			out.println("<font style='color : red;'><b>"+ i + "</b></font><br>");//홀수 빨간색
		} 
	} 
*/
	//직접 조건 제시 경우
	while(startValue <= endValue){
		sum += startValue;
		if(startValue % 2 == 0){//짝수
			hab_even += startValue;
			out.println("<font style='color : blue;'><b>"+ startValue + "</b></font><br>");
		}else{
			hab_odd  += startValue;
			out.println("<font style='color : red;'><b>"+ startValue + "</b></font><br>");//홀수 빨간색
		}
		startValue++;
	}


	//true로 만들고 중간제시 경우
	while(true){
		if(!(startValue <= endValue)){
			break;
		}
		sum += startValue;
		if(startValue % 2 == 0){//짝수
			hab_even += startValue;
			out.println("<font style='color : blue;'><b>"+ startValue + "</b></font><br>");
		}else{
			hab_odd  += startValue;
			out.println("<font style='color : red;'><b>"+ startValue + "</b></font><br>");//홀수 빨간색
		}
		startValue++;
}

	
%>

=========<br>
총합계 : <%=sum %> <br>
홀수합 : <%=hab_odd  %><br>
짝수합 : <%=hab_even %><br>

</body>
</html>