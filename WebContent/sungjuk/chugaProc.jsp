<%@page import="sungjuk.model.dto.SungjukDTO"%>
<%@page import="sungjuk.model.dao.SungjukDAO"%>
<%@page import="java.sql.*"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	
	String name = request.getParameter("name");
	
	String sihum_name = request.getParameter("sihum_name");

	String tmp = request.getParameter("kor");
	int kor = Integer.parseInt(tmp);

	tmp = request.getParameter("eng");
	int eng = Integer.parseInt(tmp);

	tmp = request.getParameter("mat");
	int mat = Integer.parseInt(tmp);

	tmp= request.getParameter("sci");
	int sci = Integer.parseInt(tmp);

	tmp = request.getParameter("his");
	int his = Integer.parseInt(tmp);
	
	int tot = kor+eng+mat+sci+his;
	double avg = tot/5.0;
	
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
	
	SungjukDTO dto = new SungjukDTO();
	dto.setId(id);
	dto.setName(name);
	dto.setSihum_name(sihum_name);
	dto.setKor(kor);
	dto.setEng(eng);
	dto.setMat(mat);
	dto.setSci(sci);
	dto.setHis(his);
	dto.setTot(tot);
	dto.setAvg(avg);
	dto.setGrade(grade);
	
	
	
	System.out.println(id);
	System.out.println(name);
	System.out.println(sihum_name);
	System.out.println(kor);
	System.out.println(eng);
	System.out.println(mat);
	System.out.println(sci);
	System.out.println(his);
	
	SungjukDAO dao = new SungjukDAO();
	int result = dao.setInsert(dto);
	
	if (result > 0) {
		out.print("<script>");
		out.print("location.href = '../main/main.jsp?menu_gubun=sungjuk_list';");
		out.print("</script>");
	} else {
		out.print("<script>");
		out.print("alert('등록하는 과정에서 오류가 생겼습니다.');");
		out.print("location.href = '../main/main.jsp?menu_gubun=sungjuk_chuga';");
		out.print("</script>");
	}
		/*************************************************************/

%>