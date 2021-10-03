<%@page import="member.model.dao.MemberDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.dto.*"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>

<%
	String no_ = request.getParameter("no");
	System.out.println(no_);
	int no = Integer.parseInt(no_);
	
	MemberDTO dto = new MemberDTO();
	dto.setNo(no);
	
	MemberDAO dao = new MemberDAO();
	dto = dao.getSelectOne(dto);
	
	/* 권한 관련 */
	String cookId = (String)session.getAttribute("cookId");
	
	String chugaId = "chuga";
	String sujungId = "sujung";
	String sakjae = "sakjae";
	String adminId = "admin";
	
	System.out.println("list : "+cookId);
	
	/* 권한 관련 종료*/


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



			<!-- 본문내용 시작 -->
			
			<h2>회원정보</h2>
	<table id="table" width = 80%>
		<tr>
			<th>순번</th>
			<td><%=dto.getNo()%></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%=dto.getId()%></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=dto.getName()%></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><%=dto.getPhone1()%>-<%=dto.getPhone2()%>-<%=dto.getPhone3()%>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><%=dto.getEmail()%></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><%=dto.getJuso1()%>, <%=dto.getJuso2()%>, <%=dto.getJuso3()%>,
				<%=dto.getJuso4()%></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><%=dto.getRegi_date()%></td>
		</tr>

	</table>
	| 
		<% if(cookId.equals(chugaId) || cookId.equals(adminId)){%>		
			<a href="../main/main.jsp?menu_gubun=member_chuga">등록</a>	
		<%}else{%>
			
			등록
		<%} %>	
	|
	<% if(cookId.equals(sujungId) || cookId.equals(adminId) || cookId.equals(dto.getId())){%>		
			<a href="../main/main.jsp?menu_gubun=member_sujung&no=<%=dto.getNo()%>">수정</a> 
	<%}else{%>
			
			수정
	<%} %>	
	|
	<a href="../main/main.jsp?menu_gubun=member_list">목록</a> 
	|
	<% if(cookId.equals(sakjae) || cookId.equals(adminId)){%>		
		<a href="../main/main.jsp?menu_gubun=member_sakjae&no=<%=dto.getNo()%>">삭제</a> 
	<%}else{%>

			삭제
	<%} %>	
	|
			
			<!-- 본문내용 종료 -->
	