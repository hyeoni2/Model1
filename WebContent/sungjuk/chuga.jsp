<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../member/member_header.jsp" %>

	<h2>성적 등록</h2>
<form name="sungjukForm">
	<table>
		<tr>
			<td width="100px;">
				아이디 :  
			</td>
			<td>
				<input type="text" name="id">
			</td>
		</tr>
		<tr>
			<td>
				이름:  
			</td>
			<td>
				<input type="text" name="name">
			</td>
		</tr>
		<tr>
			<td>
				시험명 :  
			</td>
			<td>
				<input type="text" name="sihum_name">
			</td>
		</tr>
		<tr>
			<td>
				국어점수 :  
			</td>
			<td>
				<input type="text" name="kor">
			</td>
		</tr>
		<tr>
			<td>
				영어점수 :  
			</td>
			<td>
				<input type="text" name="eng">
			</td>
		</tr>
		<tr>
			<td>
				수학점수 :  
			</td>
			<td>
				<input type="text" name="mat">
			</td>
		</tr>
		<tr>
			<td>
				과학점수 :  
			</td>
			<td>
				<input type="text" name="sci">
			</td>
		</tr>
		<tr>
			<td>
				역사점수 :  
			</td>
			<td>
				<input type="text" name="his">
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
		location.href = '../main/main.jsp?menu_gubun=sungjuk_list';
		
	}
	
	function chuga() {
		
		if(document.sungjukForm.id.value == ""){
			alert('아이디를 입력해주십시오');
			document.sungjukForm.id.focus();
			return;
		}else if(document.sungjukForm.name.value == ""){
			alert('이름을 입력해주십시오');
			document.sungjukForm.name.focus();
			return;
		}else if(document.sungjukForm.sihum_name.value == ""){
			alert('시험명을 입력해주십시오');
			document.sungjukForm.shihum_name.focus();
			return;
		}else if(document.sungjukForm.kor.value == ""){
			alert('국어점수를 입력해주십시오');
			document.sungjukForm.kor.focus();
			return;
		}else if(document.sungjukForm.eng.value == ""){
			alert('영어점수를 입력해주십시오');
			document.sungjukForm.eng.focus();
			return;
		}else if(document.sungjukForm.mat.value == ""){
			alert('수학점수를 입력해주십시오');
			document.sungjukForm.mat.focus();
			return;
		}else if(document.sungjukForm.sci.value == ""){
			alert('과학점수를 입력해주십시오');
			document.sungjukForm.sci.focus();
			return;
		}else if(document.sungjukForm.his.value == ""){
			alert('역사점수를 입력해주십시오');
			document.sungjukForm.his.focus();
			return;
		}
		
		
		if(confirm('등록하시겠습니까?')){
			document.sungjukForm.method = 'post';
			document.sungjukForm.action = '../sungjuk/chugaProc.jsp';
			document.sungjukForm.submit();
			
		}
		
	}
</script>