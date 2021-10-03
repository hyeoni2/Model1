<%@page import="product.model.dao.ProductDAO"%>
<%@page import="product.model.dto.ProductDTO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String product_code_ = request.getParameter("product_code");
	int product_code = Integer.parseInt(product_code_);
	
	String product_name = request.getParameter("product_name");
	
	String product_price_ = request.getParameter("product_price");
	int product_price = Integer.parseInt(product_price_);
	
	String maker = request.getParameter("maker");
	
	ProductDTO dto = new ProductDTO();
	dto.setProduct_code(product_code);
	dto.setProduct_name(product_name);
	dto.setProduct_price(product_price);
	dto.setMaker(maker);
	
	System.out.println(product_code);
	System.out.println(product_name);
	System.out.println(product_price);
	System.out.println(maker);
	
	ProductDAO dao = new ProductDAO();
	int result = dao.setInsert(dto);
	
	
		if(result > 0){
			out.println("<script>");
			out.println("location.href = '../main/main.jsp?menu_gubun=product_list';");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("alert('등록하는 중 오류가 생겼습니다.');");
			out.println("location.href = '../main/main.jsp?menu_gubun=product_chuga';");
			out.println("</script>");
		}
		
	
%>