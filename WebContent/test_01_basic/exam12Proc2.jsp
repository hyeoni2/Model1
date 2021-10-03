<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String[][] arraySungjuk = new String[2][6];
	String temp;
	temp = request.getParameter("name");
	arraySungjuk[0][0] = temp;

	temp = request.getParameter("kor");
	arraySungjuk[0][1] = temp;

	temp = request.getParameter("eng");
	arraySungjuk[0][2] = temp;

	temp = request.getParameter("mat");
	arraySungjuk[0][3] = temp;

	temp = request.getParameter("sci");
	arraySungjuk[0][4] = temp;
	
	temp = request.getParameter("his");	
	arraySungjuk[0][5] = temp;
	
	/*-----------------------------*/
	temp = request.getParameter("name2");
	arraySungjuk[1][0] = temp;

	temp = request.getParameter("kor2");
	arraySungjuk[1][1] = temp;

	temp = request.getParameter("eng2");
	arraySungjuk[1][2] = temp;

	temp = request.getParameter("mat2");
	arraySungjuk[1][3] = temp;

	temp = request.getParameter("sci2");
	arraySungjuk[1][4] = temp;
	
	temp = request.getParameter("his2");	
	arraySungjuk[1][5] = temp;
	
	for(int i =0; i < arraySungjuk.length; i++){
		int sum = 0;
		double avg = 0;
		int j = 0;
		String grade = "가";
		for(j = 1; j < arraySungjuk[i].length-1; j++){
			
			temp = arraySungjuk[i][j];
			sum += Integer.parseInt(temp);
				
			if(avg >= 90){
				grade = "수";
			}else if(avg >= 80){
				grade = "우";
			}else if(avg >= 70){
				grade = "미";
			}else if(avg >= 60){
				grade = "양";
			}
			avg = sum / (double)5.0;
		}
%>
<table>
	<tr>
		이름 : <%=arraySungjuk[i][0]%><br>
	</tr>
	<tr>
		국어 : <%=arraySungjuk[i][j]%><br>
	</tr>
	<tr>	
		영어 : <%=arraySungjuk[i][j]%><br>
	</tr>
	<tr>	
		수학 : <%=arraySungjuk[i][j]%><br>
	</tr>
	<tr>	
		과학 : <%=arraySungjuk[i][j]%><br>
	</tr>
	<tr>	
		역사 : <%=arraySungjuk[i][j]%><br>
	</tr>

	<tr>	
		<b>총점 : <%=sum %></b><br>
	</tr>
	<tr>	
		<b>평균 : <%=avg %></b><br>
	</tr>
	<tr>		
		등급 : <%=grade %><br>
	</tr>
<hr>
</table>
 <%	
	}

%>
