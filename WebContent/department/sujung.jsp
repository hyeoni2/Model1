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
<h2>부서 수정</h2>
<form name="sujungForm">
<input type="hidden" name="department_id" value="<%=dto.getDepartment_id()%>">
	<table>
		<tr>
			<td>부서 번호</td>
			<td>
				<%=dto.getDepartment_id()%>
			</td>
		</tr>
		<tr>
			<td>부서 이름</td>
			<td>
				<input type="text" name="department_name" value="<%=dto.getDepartment_name()%>">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="sujung();">수정하기</button>
				<button type="button" onclick="list();">목록으로</button>
			</td>
		</tr>
	</table>
</form>
<script>
	function list() {
		location.href = '../main/main.jsp?menu_gubun=department_list'
	}
	function sujung() {

		if(confirm('수정하시겠습니까?')){
			sujungForm.method = 'post';
			sujungForm.action = '../department/sujungProc.jsp';
			sujungForm.submit();
		}	
	}
</script>
