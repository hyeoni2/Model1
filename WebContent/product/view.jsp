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

<style>

	a{
		text-decoration: none;
		color: black;
	}
	
	#table {
	  font-family: Arial, Helvetica, sans-serif;
	  border-collapse: collapse;
	  width: 80%;
	}
	
	#table td, #table th {
	  border: 1px solid #ddd;
	  padding: 8px;
	}
	
	#table tr:nth-child(even){background-color: #f2f2f2;}
	
	#table tr:hover {background-color: #ddd;}
	
	#table th {
	  padding-top: 12px;
	  padding-bottom: 12px;
	  background-color: #4A0084;
	  color: white;
	}
	
</style>


		<h2>상품 상세 조회</h2>
		<table id="table" width = 80%>
			<tr>
				<th width="160px">상품 코드</th>
				<td><%=dto.getProduct_code() %></td>
			</tr>
			<tr>
				<th>상품 이름</th>
				<td><%=dto.getProduct_name()%></td>
			</tr>
			<tr>
				<th>상품 가격</th>
				<td><%=dto.getProduct_price() %></td>
			</tr>
			<tr>
				<th>상품 브랜드</th>
				<td><%=dto.getMaker()%></td>
			</tr>
			<tr>
				<th>상품 등록 날짜</th>
				<td><%=dto.getRegi_date() %></td>
			</tr>
		
			
		</table>
		|
		<a href="../main/main.jsp?menu_gubun=product_chuga">등록</a>
		|
		<a href="../main/main.jsp?menu_gubun=product_sujung&product_code=<%=dto.getProduct_code()%>">수정</a>
		|
		<a href="../main/main.jsp?menu_gubun=product_list">목록</a>
		|
		<a href="../main/main.jsp?menu_gubun=product_sakjae&product_code=<%=dto.getProduct_code()%>">삭제</a>
		|
		
