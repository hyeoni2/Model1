<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		//int 타입으로 변형시 문제있음 <문자열 타입으로 넣고 처리해주면 됨>
		request.setCharacterEncoding("UTF-8");
		
		String name = request.getParameter("name");
		String kor = request.getParameter("kor");
		String eng = request.getParameter("eng");
		String mat = request.getParameter("mat");
		String sci = request.getParameter("sci");
		String his = request.getParameter("his");
		
		if(name == null || name.trim().equals("")){
			name = "";
			kor = "";
			eng = "";
			mat = "";
			sci = "";
			his = "";
		}else{
			if(kor == null || kor.trim().equals("") ) kor = "";
			if(eng == null || eng.trim().equals("") ) eng = "";
			if(mat == null || mat.trim().equals("") ) mat = "";
			if(sci == null || sci.trim().equals("") ) sci = "";
			if(his == null || his.trim().equals("") ) his = "";
		}
%>	

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적처리</title>
</head>
<body>

<h2>성적처리</h2>

<form name="form" method="post" action="exam03.jsp" >
	<table border="1" width = "400">
		<tr>
			<td width="150" align="center">이름 </td>
			<td ><input type="text" name="name" value="<%=name%>"></td>
		</tr>
		<tr>
			<td width="150" align="center">국어 </td>
			<td><input type="text" name="kor" value="<%=kor%>"></td>
		</tr>
		<tr>
			<td width="150" align="center">영어 </td>
			<td><input type="text" name="eng" value="<%=eng%>"></td>
		</tr>
		<tr>
			<td width="150" align="center">수학 </td>
			<td><input type="text" name="mat" value="<%=mat%>"></td>
		</tr>
		<tr>
			<td width="150" align="center">과학 </td>
			<td><input type="text" name="sci" value="<%=sci%>"></td>
		</tr>
		<tr>
			<td width="150" align="center">역사 </td>
			<td><input type="text" name="his" value="<%=his%>"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">확인</button>
			</td>
		</tr>
	</table>
</form>
</body>
</html>


