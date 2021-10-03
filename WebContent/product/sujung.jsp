<%@page import="product.model.dao.ProductDAO"%>
<%@page import="product.model.dto.ProductDTO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String product_code_ = request.getParameter("product_code");
	int product_code = Integer.parseInt(product_code_);
	System.out.println("상품코드"+product_code);

	ProductDTO dto = new ProductDTO();
	dto.setProduct_code(product_code);
	
	ProductDAO dao = new ProductDAO();
	dto = dao.getSelectOne(dto);
	
%>
   

		<h2>상품 수정</h2>
		<form name="sujungForm">
			<table>
				<input type="hidden" name="product_code" value="<%=dto.getProduct_code()%>"/>
				<tr>
					<td>상품코드 : </td>
					<td>
						<%=dto.getProduct_code() %>
					</td>					
				</tr>
				<tr>
					<td>상품 이름 : </td>
					<td>
						<input type="text" name="product_name" value="<%=dto.getProduct_name()%>">
					</td>					
				</tr>
				<tr>
					<td>상품 가격 : </td>
					<td> 
						<input type="text" name="product_price" value="<%=dto.getProduct_price()%>">
					</td>					
				</tr>
				<tr>
					<td>상품브랜드 : </td>
					<td>
						<input type="text" name="maker" value="<%=dto.getMaker()%>">
					</td>					
				</tr>
				<tr>
					<td>등록일 : </td>
					<td>
							<%=dto.getRegi_date() %>
					</td>					
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="button" onclick="sujung();">수정하기</button>
						<button type="button" onclick="list();" >목록으로</button>
					</td>					
				</tr>
			</table>
		</form>		


<script type="text/javascript">
	function list() {
		location.href = '../main/main.jsp?menu_gubun=product_list';		
	}

	function sujung() {
		
		if(document.sujungForm.product_name.value == ""){
			alert('상품이름을 입력해주세요');
			document.chugaForm.product_name.focus();
			return;
		}else if(document.sujungForm.product_price.value == ""){
			alert('상품가격을 입력해주세요');
			document.chugaForm.product_price.focus();
			return;
		}else if(document.sujungForm.maker.value == ""){
			alert('상품브랜드를 입력해주세요');
			document.chugaForm.maker.focus();
			return;
		}
		
		
		if(confirm('수정하시겠습니까?')){
			document.sujungForm.method = 'post';
			document.sujungForm.action = '../product/sujungProc.jsp';
			document.sujungForm.submit();
		}
		
	}
</script>

</body>
</html>