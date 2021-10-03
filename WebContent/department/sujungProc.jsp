<%@page import="department.model.dao.DepartmentDAO"%>
<%@page import="department.model.dto.DepartmentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<%
		String tmp = request.getParameter("department_id");
		int department_id = Integer.parseInt(tmp);
		
		String department_name = request.getParameter("department_name");
		
		DepartmentDAO dao = new DepartmentDAO();
		
		DepartmentDTO dto = new DepartmentDTO();
		dto.setDepartment_id(department_id);
		dto.setDepartment_name(department_name);
		
		int result = dao.setUpdate(dto);

	if(result > 0){//성공
		out.println("<script>");
		out.println("alert('성공적으로 수정되었습니다.');");
		out.println("location.href = '../main/main.jsp?menu_gubun=department_list';");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('부서수정 중 오류가 발생했습니다.');");
		out.println("location.href = '../main/main.jsp?menu_gubun=department_chuga';");
		out.println("</script>");
	}
%>	
	