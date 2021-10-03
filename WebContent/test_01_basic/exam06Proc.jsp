<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	
	String tmp = request.getParameter("kor");
	int kor = Integer.parseInt(tmp);
	
	tmp = request.getParameter("eng");
	int eng = Integer.parseInt(tmp);
	
	tmp = request.getParameter("mat");
	int mat = Integer.parseInt(tmp);
	
	tmp = request.getParameter("sci");
	int sci = Integer.parseInt(tmp);
	
	tmp = request.getParameter("his");
	int his = Integer.parseInt(tmp);
	
	System.out.println(name);
	System.out.println(kor);
	System.out.println(eng);
	System.out.println(mat);
	System.out.println(sci);
	System.out.println(his);
	
	
	int tot = kor + eng + mat + sci + his;
	double avg = tot / 5.0;
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

이름 : <%=name%><br>
국어 : <%=kor%><br>
영어 : <%=eng%><br>
수학 : <%=mat%><br>
과학 : <%=sci%><br>
역사 : <%=his%><br>
<b>총점 : <%=tot%><br>
<b>평균 : <%=avg%><br>
등급 : <%=grade%><br>
