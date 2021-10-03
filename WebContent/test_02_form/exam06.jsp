<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반장선거</title>
</head>
<body>
<%
	String procPage1 = "exam06Proc.jsp";
%>

<h2>반장선거</h2>
<form name="form" method="post" action="<%=procPage1%>">

1반 반장 :
<input type="radio" name="boss_1" value="홍길동1">홍길동1 &nbsp;&nbsp;
<input type="radio" name="boss_1" value="김철수1">김철수1 &nbsp;&nbsp;
<input type="radio" name="boss_1" value="이영희1">이영희1 &nbsp;&nbsp;
<input type="radio" name="boss_1" value="강감찬1">강감찬1 &nbsp;&nbsp;
<br>
<br>

2반 반장 :
<input type="radio" name="boss_2" value="홍길동2">홍길동2 &nbsp;&nbsp;
<input type="radio" name="boss_2" value="김철수2">김철수2 &nbsp;&nbsp;
<input type="radio" name="boss_2" value="이영희2">이영희2 &nbsp;&nbsp;
<input type="radio" name="boss_2" value="강감찬2">강감찬2 &nbsp;&nbsp;
<br>
<br>

3반 반장 :
<input type="radio" name="boss_3" value="홍길동3">홍길동3 &nbsp;&nbsp;
<input type="radio" name="boss_3" value="김철수3">김철수3 &nbsp;&nbsp;
<input type="radio" name="boss_3" value="이영희3">이영희3 &nbsp;&nbsp;
<input type="radio" name="boss_3" value="강감찬3">강감찬3 &nbsp;&nbsp;
<br>
<br>

4반 반장 :
<input type="radio" name="boss_4" value="홍길동4">홍길동4 &nbsp;&nbsp;
<input type="radio" name="boss_4" value="김철수4">김철수4 &nbsp;&nbsp;
<input type="radio" name="boss_4" value="이영희4">이영희4 &nbsp;&nbsp;
<input type="radio" name="boss_4" value="강감찬4">강감찬4 &nbsp;&nbsp;
<br>
<br>

5반 반장 :
<input type="radio" name="boss_5" value="홍길동5">홍길동5 &nbsp;&nbsp;
<input type="radio" name="boss_5" value="김철수5">김철수5 &nbsp;&nbsp;
<input type="radio" name="boss_5" value="이영희5">이영희5 &nbsp;&nbsp;
<input type="radio" name="boss_5" value="강감찬5">강감찬5 &nbsp;&nbsp;
<br>
<br>
<button type="submit">확인</button>
</form>
</body>
</html>