<%@page import="department.model.dao.DepartmentDAO"%>
<%@page import="department.model.dto.DepartmentDTO"%>
<%@page import="org.apache.catalina.ssi.ByteArrayServletOutputStream"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
 <%
 	DepartmentDAO dao = new DepartmentDAO();
 	
 	ArrayList<DepartmentDTO> list = new ArrayList<>();
 	list = dao.selectAll();
 	System.out.println("ddd"+list.size());

 %>   
<h2>직원 등록</h2>
<form name="chugaForm">
	<table>
		<tr>
			<td>부서번호 : </td>
			<td>
				<select name="department_id">
					<option value="">--선택--</option>
				<%	for(int i = 0 ; i < list.size(); i++){ 
						DepartmentDTO dto = list.get(i);
			
				%>					

				<option value="<%=dto.getDepartment_id() %>"><%=dto.getDepartment_id() %></option>
						
				<%} %>					
				</select>
				
			
			</td>		
		</tr>
		<tr>
			<td>월급 : </td>
			<td>
				<input type="text" name="salary">
			</td>		
		</tr>
		<tr>
			<td>이름 : </td>
			<td>
				<input type="text" name="name">
			</td>		
		</tr>
		<tr>
			<td>이메일 : </td>
			<td>
				<input type="text" name="email">
			</td>		
		</tr>
		<tr>
			<td>전화번호 : </td>
			<td>
				<input type="text" name="phone">
			</td>		
		</tr>
		<tr>
			<td>입사일 : </td>
			<td>
				<input type="text" name="hire_date" placeholder="yyyy-mm-dd로 입력">
			</td>		
		</tr>
		<tr>
		
			<td colspan="2" style="padding-top: 20px;" align="center">
				<button type="button" onclick="chuga();">등록하기</button>
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
	
	/*  추가 Proc로 보내는 함수  */
	function chuga(){
		
		/*  값 검증   */
		if(chugaForm.department_id.value==""){
			alert('부서번호를 선택해주세요.');
			return;
		}else if(chugaForm.salary.value==""){
			alert('월급을 입력해주세요.');
			chugaForm.salary.focus();
			return;
		}else if(chugaForm.name.value==""){
			alert('이름을 입력해주세요.');
			chugaForm.name.focus();
			return;
		}else if(chugaForm.email.value==""){
			alert('이메일을 입력해주세요.');
			chugaForm.email.focus();
			return;
		}else if(chugaForm.phone.value==""){
			alert('전화번호를 입력해주세요.');
			chugaForm.phone.focus();
			return;
		}else if(chugaForm.hire_date.value==""){
			alert('입사일 입력해주세요.');
			chugaForm.hire_date.focus();
			return;
		}			
		
		/*  값 검증 종료  */
		
		if(confirm('등록하시겠습니까?')){
			chugaForm.method = 'post';
			chugaForm.action = '../employee/chugaProc.jsp';
			chugaForm.submit();
		}
		
	}
</script>