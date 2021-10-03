<%@page import="employee.model.dto.EmployeeDTO"%>
<%@page import="employee.model.dao.EmployeeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//list에서 넘긴 번호를 받아서 dto에 저장
	String tmp = request.getParameter("employee_id");
	int employee_id = Integer.parseInt(tmp);

	EmployeeDAO dao = new EmployeeDAO();
	
	EmployeeDTO dto = new EmployeeDTO();
	dto.setEmployee_id(employee_id);
	
	//저장된 번호로 dao돌려서 값을 얻어서 뿌림
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

<h2>아이디 <%=dto.getDepartment_id() %>번 직원 목록</h2>
	<table id="table">
		<tr>
			<th>
				직원 아이디
			</th>
			<td>
				<%=dto.getEmployee_id() %>
			</td>
		</tr>
		<tr>
			<th>
				부서번호
			</th>
			<td>
				<%=dto.getDepartment_id() %>
			</td>
		</tr>
		<tr>
			<th>
				월급
			</th>
			<td>
				<%=dto.getSalary() %>
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
				이메일
			</th>
			<td>
				<%=dto.getEmail()%>
			</td>
		</tr>
		<tr>
			<th>
				전화번호
			</th>
			<td>
				<%=dto.getPhone() %>
			</td>
		</tr>
		<tr>
			<th>
				입사일
			</th>
			<td>
				<%=dto.getHire_date() %>
			</td>
		</tr>
		<tr>
			<th>
				등록일
			</th>
			<td>
				<%=dto.getRegi_date()%>
			</td>
		</tr>
	</table>
|
<a href="../main/main.jsp?menu_gubun=employee_chuga">등록</a>
|
<a href="../main/main.jsp?menu_gubun=employee_sujung&employee_id=<%=dto.getEmployee_id() %>">수정</a>
|
<a href="../main/main.jsp?menu_gubun=employee_list">목록</a>
|
<a href="../main/main.jsp?menu_gubun=employee_sakjae&employee_id=<%=dto.getEmployee_id() %>">삭제</a>
|