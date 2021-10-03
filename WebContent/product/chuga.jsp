<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../member/member_header.jsp" %>
		<h2>상품 등록</h2>
		<form name="chugaForm">
			<table>
				<tr>
					<td>상품코드 : </td>
					<td>
						<input type="text" name="product_code">
					</td>					
				</tr>
				<tr>
					<td>상품 이름 : </td>
					<td>
						<input type="text" name="product_name">
					</td>					
				</tr>
				<tr>
					<td>상품 가격 : </td>
					<td>
						<input type="text" name="product_price">
					</td>					
				</tr>
				<tr>
					<td>상품브랜드 : </td>
					<td>
						<input type="text" name="maker">
					</td>					
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="button" onclick="chuga();">등록하기</button>
						<button type="button" onclick="list();" >목록으로</button>
					</td>					
				</tr>
			</table>
		</form>		


<script type="text/javascript">
	function list() {
		location.href = '../main/main.jsp?menu_gubun=product_list';		
	}

	function chuga() {
		
		if(document.chugaForm.product_code.value == ""){
			alert('상품코드를 입력해주세요');
			document.chugaForm.product_code.focus();
			return;
		}else if(document.chugaForm.product_name.value == ""){
			alert('상품이름을 입력해주세요');
			document.chugaForm.product_name.focus();
			return;
		}else if(document.chugaForm.product_price.value == ""){
			alert('상품가격을 입력해주세요');
			document.chugaForm.product_price.focus();
			return;
		}else if(document.chugaForm.maker.value == ""){
			alert('상품브랜드를 입력해주세요');
			document.chugaForm.maker.focus();
			return;
		}
		
		
		if(confirm('등록하시겠습니까?')){
			document.chugaForm.method = 'post';
			document.chugaForm.action = '../product/chugaProc.jsp';
			document.chugaForm.submit();
		}
		
	}
</script>

</body>
</html>