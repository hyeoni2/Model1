<%@page import="department.model.dao.DepartmentDAO"%>
<%@page import="employee.model.dao.EmployeeDAO"%>
<%@page import="department.model.dto.DepartmentDTO"%>
<%@page import="product.model.dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>
<%
	String tmp = request.getParameter("department_id");
	int department_id = Integer.parseInt(tmp);
	
	String department_name = request.getParameter("department_name");
	
	DepartmentDTO dto = new DepartmentDTO();
	dto.setDepartment_id(department_id);
	dto.setDepartment_name(department_name);
	
	DepartmentDAO dao = new DepartmentDAO();
	int result = dao.setInsert(dto);
	
	if(result > 0){//성공
		out.println("<script>");
		out.println("alert('성공적으로 등록되었습니다.');");
		out.println("location.href = '../main/main.jsp?menu_gubun=department_list';");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('회원등록 중 오류가 발생했습니다.');");
		out.println("location.href = '../main/main.jsp?menu_gubun=department_chuga';");
		out.println("</script>");
	}
%>

