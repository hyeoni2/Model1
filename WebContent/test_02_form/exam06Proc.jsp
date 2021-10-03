<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%-- 
<jsp:useBean id="dto" class="test_02_form.Exam06DTO" scope="page">
<jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

boss_1 ==> <jsp:getProperty name="dto" property="boss_1"/><br>
boss_2 ==> <jsp:getProperty name="dto" property="boss_2"/><br>
boss_3 ==> <jsp:getProperty name="dto" property="boss_3"/><br>
boss_4 ==> <jsp:getProperty name="dto" property="boss_4"/><br>
boss_5 ==> <jsp:getProperty name="dto" property="boss_5"/><br>

<hr>
boss_1 --> <%=dto.getBoss_1()%><br>
boss_2 --> <%=dto.getBoss_2()%><br>
boss_3 --> <%=dto.getBoss_3()%><br>
boss_4 --> <%=dto.getBoss_4()%><br>
boss_5 --> <%=dto.getBoss_5()%><br>
 --%>

<%@ page import="test_02_form.Exam06DTO"%>
<%
	String boss_1 = request.getParameter("boss_1");
	String boss_2 = request.getParameter("boss_2");
	String boss_3 = request.getParameter("boss_3");
	String boss_4 = request.getParameter("boss_4");
	String boss_5 = request.getParameter("boss_5");


	Exam06DTO dto = new Exam06DTO();
	dto.setBoss_1(boss_1);
	dto.setBoss_2(boss_2);
	dto.setBoss_3(boss_3);
	dto.setBoss_4(boss_4);
	dto.setBoss_5(boss_5);
	
	out.println("boss_1 : "+dto.getBoss_1()+"<br>");
	out.println("boss_2 : "+dto.getBoss_2()+"<br>");
	out.println("boss_3 : "+dto.getBoss_3()+"<br>");
	out.println("boss_4 : "+dto.getBoss_4()+"<br>");
	out.println("boss_5 : "+dto.getBoss_5()+"<br>");
	
%>
