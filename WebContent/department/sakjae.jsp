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
<h2>부서 삭제</h2>
<form name="sakjaeForm">
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
				<%=dto.getDepartment_name()%>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="sakjae();">삭제하기</button>
				<button type="button" onclick="list();">목록으로</button>
			</td>
		</tr>
	</table>
</form>
<script>
	function list() {
		location.href = '../main/main.jsp?menu_gubun=department_list'
	}
	function sakjae() {

		if(confirm('삭제하시겠습니까?')){
			sakjaeForm.method = 'post';
			sakjaeForm.action = '../department/sakjaeProc.jsp';
			sakjaeForm.submit();
		}	
	}
</script>
