<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h2>부서 등록</h2>
<form name="chugaForm">
	<table>
		<tr>
			<td>부서 번호</td>
			<td>
				<input type="text" name="department_id">
			</td>
		</tr>
		<tr>
			<td>부서 이름</td>
			<td>
				<input type="text" name="department_name">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="chuga();">등록하기</button>
				<button type="button" onclick="list();">목록으로</button>
			</td>
		</tr>
	</table>
</form>
<script>
	function list() {
		location.href = '../main/main.jsp?menu_gubun=department_list'
	}
	function chuga() {
		if(chugaForm.department_id.value==""){
			alert('부서번호를 입력해주십시오');
			chugaForm.department_id.focus();
			return;
		}
		
		if(chugaForm.department_name.value==""){
			alert('부서이름을 입력해주십시오');
			chugaForm.department_name.focus();
			return;
		}
		
		if(confirm('등록하시겠습니까?')){
			chugaForm.method = 'post';
			chugaForm.action = '../department/chugaProc.jsp';
			chugaForm.submit();
		}	
	}
</script>
