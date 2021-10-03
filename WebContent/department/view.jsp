<%@page import="department.model.dao.DepartmentDAO"%>
<%@page import="department.model.dto.DepartmentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<%
	String tmp = request.getParameter("department_id");
	int department_id = Integer.parseInt(tmp);
	
	DepartmentDTO dto = new DepartmentDTO();
	dto.setDepartment_id(department_id);
	
	DepartmentDAO dao = new DepartmentDAO();
	dto = dao.selectOne(dto);
	
	
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
    
<h2>부서 목록</h2>
	<table id="table">
		<tr>
			<th>부서 번호</th>
			<td>
				<%=dto.getDepartment_id()%>
			</td>
		</tr>
		<tr>
			<th>부서 이름</th>
			<td>
				<%=dto.getDepartment_name()%>
			</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td>
				<%=dto.getRegi_date()%>
			</td>
		</tr>
	</table>
|
<a href="../main/main.jsp?menu_gubun=department_chuga">등록</a>
|
<a href="../main/main.jsp?menu_gubun=department_sujung&department_id=<%=dto.getDepartment_id() %>">수정</a>
|
<a href="../main/main.jsp?menu_gubun=department_list">목록</a>
|
<a href="../main/main.jsp?menu_gubun=department_sakjae&department_id=<%=dto.getDepartment_id() %>">삭제</a>
|


