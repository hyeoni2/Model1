<%@page import="sungjuk.model.dao.SungjukDAO"%>
<%@page import="sungjuk.model.dto.SungjukDTO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	SungjukDTO dto = new SungjukDTO();
	dto.setNo(no);
	
	SungjukDAO dao = new SungjukDAO();
	
	
	dto = dao.getSelectOne(dto);
%>
<style>

	a{
		text-decoration: none;
		color: black;
	}
	
	#table {
	  font-family: Arial, Helvetica, sans-serif;
	  border-collapse: collapse;
	  width: 80%;
	}
	
	#table td, #table th {
	  border: 1px solid #ddd;
	  padding: 8px;
	}
	
	#table tr:nth-child(even){background-color: #f2f2f2;}
	
	#table tr:hover {background-color: #ddd;}
	
	#table th {
	  padding-top: 12px;
	  padding-bottom: 12px;
	  background-color: #4A0084;
	  color: white;
	}
	
	
</style>
<h2><%=dto.getNo() %>번 게시물</h2>
<table id="table">
	<tr>
		<th width="100px">
			순번
		</th>
		<td>
			<%=dto.getNo() %>
		</td>
	</tr>
		<tr>
		<th>
			아이디
		</th>
		<td>
			<%=dto.getId() %>
		</td>
	</tr>
	<tr>
		<th>
			이름
		</th>
		<td>
			<%=dto.getName() %>
		</td>
	</tr>
	<tr>
		<th>
			시험이름
		</td>
		<td>
			<%=dto.getSihum_name() %>
		</td>
	</tr>
	<tr>
		<th>
			국어점수
		</th>
		<td>
			<%=dto.getKor()%>
		</td>
	</tr>
	<tr>
		<th>
			영어점수
		</th>
		<td>
			<%=dto.getEng() %>
		</td>
	</tr>
	<tr>
		<th>
			수학점수
		</th>
		<td>
			<%=dto.getMat() %>
		</td>
	</tr>
	<tr>
		<th>
			과학점수
		</th>
		<td>
			<%=dto.getSci() %>
		</td>
	</tr>
	<tr>
		<th>
			사회점수
		</th>
		<td>
			<%=dto.getHis()%>
		</td>
	</tr>
	<tr>
		<th>
			합계
		</th>
		<td>
			<%=dto.getTot() %>
		</td>
	</tr>
	<tr>
		<th>
			평균
		</th>
		<td>
			<%=dto.getAvg() %>
		</td>
	</tr>
	<tr>
		<th>
			등급
		</th>
		<td>
			<%=dto.getGrade() %>
		</td>
	</tr>
	<tr>
		<th>
			등록일
		</th>
		<td>
			<%=dto.getRegi_date() %>
		</td>
	</tr>
</table>
|
<a href="../main/main.jsp?menu_gubun=sungjuk_chuga">등록</a>
|
<a href="../main/main.jsp?menu_gubun=sungjuk_sujung&no=<%=dto.getNo() %>">수정</a>
|
<a href="../main/main.jsp?menu_gubun=sungjuk_list">목록</a>
|
<a href="../main/main.jsp?menu_gubun=sungjuk_sakjae&no=<%=dto.getNo() %>">삭제</a>