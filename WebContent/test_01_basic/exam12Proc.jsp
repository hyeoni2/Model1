<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String[] arraySungjuk = new String[2];
	
	String name = request.getParameter("name");
	String kor = request.getParameter("kor");
	String eng = request.getParameter("eng");
	String mat = request.getParameter("mat");
	String sci = request.getParameter("sci");
	String his = request.getParameter("his");	

	String imsi = "";
	imsi += name + ",";
	imsi += kor + ",";
	imsi += eng + ",";
	imsi += mat + ",";
	imsi += sci + ",";
	imsi += his;
	arraySungjuk[0] = imsi;
	
	String str = arraySungjuk[0];
	String[] imsiArray = str.split(",");
	name = imsiArray[0]; 
	kor = imsiArray[1]; 
	eng = imsiArray[2]; 
	mat = imsiArray[3]; 
	sci = imsiArray[4]; 
	his = imsiArray[5]; 
%>
	이름1 : <%=name %><br>
	국어1 : <%=kor %><br>
	수학1 : <%=eng %><br>
	영어1 : <%=mat %><br>
	과학1 : <%=sci %><br>
	역사1 : <%=his %><br>
<%	
	int sum = 0;
	double avg = 0;
	for(int i = 1; i < imsiArray.length-1; i++){
		sum += Integer.parseInt(imsiArray[i]);
	}
	avg = sum / (double)5;
	
	String grade = "가";
	if(avg >= 90){
		grade = "수";
	}else if(avg >= 80){
		grade = "우";
	}else if(avg >= 70){
		grade = "미";
	}else if(avg >= 60){
		grade = "양";
	}
%>
	<b>총점1 : <%=sum %></b><br>
	<b>평균1 : <%=avg %> </b><br>
	등급1 : <%=grade %><br>
	<hr>
<%		

//
	String name2 = request.getParameter("name2");
	String kor2 = request.getParameter("kor2");
	String eng2 = request.getParameter("eng2");
	String mat2 = request.getParameter("mat2");
	String sci2 = request.getParameter("sci2");
	String his2 = request.getParameter("his2");	

	imsi = "";
	imsi += name2 + ",";
	imsi += kor2 + ",";
	imsi += eng2 + ",";
	imsi += mat2 + ",";
	imsi += sci2 + ",";
	imsi += his2;
	arraySungjuk[1] = imsi;

	str = arraySungjuk[1];
	String[] imsiArray2 = str.split(",");
	name2 = imsiArray2[0]; 
	kor2 = imsiArray2[1]; 
	eng2 = imsiArray2[2]; 
	mat2 = imsiArray2[3]; 
	sci2 = imsiArray2[4]; 
	his2 = imsiArray2[5]; 
	
	%>
	이름2 : <%=name2 %><br>
	국어2 : <%=kor2 %><br>
	수학2 : <%=eng2 %><br>
	영어2 : <%=mat2 %><br>
	과학2 : <%=sci2 %><br>
	역사2 : <%=his2 %><br>
<%	
	sum = 0;
	avg = 0;
	for(int i = 1; i < imsiArray2.length-1; i++){
		sum += Integer.parseInt(imsiArray2[i]);
	}
	avg = sum / (double)5;
	
	grade = "가";
	if(avg >= 90){
		grade = "수";
	}else if(avg >= 80){
		grade = "우";
	}else if(avg >= 70){
		grade = "미";
	}else if(avg >= 60){
		grade = "양";
	}
%>
	<b>총점1 : <%=sum %></b><br>
	<b>평균1 : <%=avg %> </b><br>
	등급1 : <%=grade %><br>
	