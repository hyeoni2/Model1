<%@page import="product.model.dao.ProductDAO"%>
<%@page import="product.model.dto.ProductDTO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String product_code_ = request.getParameter("product_code");
	int product_code = Integer.parseInt(product_code_);
	
	ProductDTO dto = new ProductDTO();
	dto.setProduct_code(product_code);
	
	ProductDAO dao = new ProductDAO();
	int result = dao.delete(dto);
	
	if(result > 0){
		out.println("<script>");
		out.println("alert('정상적으로 삭제가 완료되었습니다.');");
		out.println("location.href = '../main/main.jsp?menu_gubun=product_list';");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('삭제하는 중 오류가 발생했습니다.');");
		out.println("location.href = '../main/main.jsp?menu_gubun=product_sakjae&product_code="+product_code+"';");
		out.println("</script>");
	}

		
%>    
