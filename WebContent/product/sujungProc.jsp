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
	
	ProductDAO dao = new ProductDAO();
	int result = dao.setUpdate(dto);
			
			
		if(result > 0){
			out.println("<script>");
			out.println("alert('정상적으로 수정이 완료되었습니다.');");
			out.println("location.href = '../main/main.jsp?menu_gubun=product_view&product_code="+product_code+"';");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("alert('수정하는 중 오류가 발생했습니다.');");
			out.println("location.href = '../main/main.jsp?menu_gubun=product_sujung&product_code="+product_code+"';");
			out.println("</script>");
		}

		
%>    
