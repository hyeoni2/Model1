<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String temp = request.getParameter("dan");
	String[] danArr = temp.split(",");
	
	int dan;
%>
<table border="2">
	<tr>
		<% for(int i = 0; i < danArr.length; i++){%>
			<td style="padding: 0px 20px;">
				<%
					dan = Integer.parseInt(danArr[i]);
				for(int j = 1; j < 10; j++){ 
					out.print(dan + " × " + j + " = " + (dan*j)+"<br>");	
				}
				%>
			</td>
		<% }%>
	
	</tr>
</table>