<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<h2>메모 등록</h2>
<form name="memoForm">
	<table>
		<tr>
			<td width="100px;">
				작성자 :  
			</td>
			<td>
				<input type="text" name="writer">
			</td>
		</tr>
		<tr>
			<td>
				내용:  
			</td>
			<td>
				<textarea name="content" style="width:300px;, height = 150px;"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="chuga();">메모등록</button>
				<button type="button" onclick="list();">목록으로</button>
			</td>
		</tr>
	</table>
	
</form>

<script>
	function list() {
		location.href = '../main/main.jsp?menu_gubun=memo_list';
		
	}
	
	function chuga() {

		if(confirm('등록하시겠습니까?')){
			document.memoForm.method = 'post';
			document.memoForm.action = '../memo/chugaProc.jsp';
			document.memoForm.submit();
			
		}
		
	}
</script>