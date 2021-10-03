<%@page import="department.model.dao.DepartmentDAO"%>
<%@page import="department.model.dto.DepartmentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  request.setCharacterEncoding("UTF-8"); %>
<%
	String tmp = request.getParameter("department_id");
	int department_id = Integer.parseInt(tmp);

	DepartmentDAO dao = new DepartmentDAO();
	
	DepartmentDTO dto = new DepartmentDTO();
	dto.setDepartment_id(department_id);
	
	int result = dao.delete(dto);

	if(result > 0){//성공
		out.println("<script>");
		out.println("alert('성공적으로 삭제되었습니다.');");
		out.println("location.href = '../main/main.jsp?menu_gubun=department_list';");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('부서삭제 중 오류가 발생했습니다.');");
		out.println("location.href = '../main/main.jsp?menu_gubun=department_sakjae';");
		out.println("</script>");
	}
	
	
%>