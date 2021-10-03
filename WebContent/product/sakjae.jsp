<%@page import="product.model.dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="product.model.dto.ProductDTO"%>
<%@page import="java.util.List"%>
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

		<h2>상품 삭제</h2>
		<form name="sakjaeForm">
		<table border="1" width = "600px" align = "center">
		<input type="hidden" name="product_code" value="<%=dto.getProduct_code()%>">
			<tr>
				<td>상품 코드</td>
				<td><%=dto.getProduct_code() %></td>
			</tr>
			<tr>
				<td>상품 이름</td>
				<td><%=dto.getProduct_name()%></td>
			</tr>
			<tr>
				<td>상품 가격</td>
				<td><%=dto.getProduct_price() %></td>
			</tr>
			<tr>
				<td>상품 브랜드</td>
				<td><%=dto.getMaker()%></td>
			</tr>
			<tr>
				<td>상품 등록 날짜</td>
				<td><%=dto.getRegi_date() %></td>
			</tr>
		
			
		</table>
	</form>		

		<button type="button" onclick="sakjae();" >삭제하기</button>
		<button type="button" onclick="list();" >목록으로</button>


<script type="text/javascript">
	function list() {
		
		location.href = '../main/main.jsp?menu_gubun=product_list';		
	}

	function sakjae() {
		if(confirm('삭제하시겠습니까?')){
			document.sakjaeForm.method = 'post';
			document.sakjaeForm.action = '../product/sakjaeProc.jsp';
			document.sakjaeForm.submit();
		}
		
	}
</script>