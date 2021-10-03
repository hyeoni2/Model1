<%@page import="employee.model.dto.EmployeeDTO"%>
<%@page import="employee.model.dao.EmployeeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	//view에서 넘긴 번호를 받아서 dto에 저장
	String tmp = request.getParameter("employee_id");
	int employee_id = Integer.parseInt(tmp);

	EmployeeDAO dao = new EmployeeDAO();
	
	EmployeeDTO dto = new EmployeeDTO();
	dto.setEmployee_id(employee_id);
	
	//저장된 번호로 dao돌려서 값을 얻어서 뿌림
	dto = dao.selectOne(dto);
	
%>
<h2>직원 정보 삭제</h2>
<form name="sakjaeForm">
	<input type="hidden" name="employee_id" value="<%=employee_id%>">
	<table>
		<tr>
			<td>부서번호 : </td>
			<td>
				<%=dto.getDepartment_id()%>
			</td>		
		</tr>
		<tr>
			<td>월급 : </td>
			<td>
				<%=dto.getSalary()%>
			</td>		
		</tr>
		<tr>
			<td>이름 : </td>
			<td>
				<%=dto.getName()%>
			</td>		
		</tr>
		<tr>
			<td>이메일 : </td>
			<td>
				<%=dto.getEmail()%>
			</td>		
		</tr>
		<tr>
			<td>전화번호 : </td>
			<td>
				<%=dto.getPhone()%>
			</td>		
		</tr>
		<tr>
			<td>입사일 : </td>
			<td>
				<%=dto.getHire_date()%>
			</td>		
		</tr>
		<tr>
		
			<td colspan="2" style="padding-top: 20px;" align="center">
				<button type="button" onclick="sakjae();">삭제하기</button>
				<button type="button" onclick="list();">목록으로</button>
			</td>		
		</tr>
	</table>
</form>

<script>

	/*  목록으로 보내는 함수  */
	function list() {
		location.href = '../main/main.jsp?menu_gubun=employee_list';		
	}
		
	function sakjae() {
		
		if(confirm('삭제하시겠습니까?')){
				sakjaeForm.method = 'post';
				sakjaeForm.action = '../employee/sakjaeProc.jsp';
				sakjaeForm.submit();
		}
		
	}
</script>