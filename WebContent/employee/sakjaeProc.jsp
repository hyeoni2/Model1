<%@page import="employee.model.dto.EmployeeDTO"%>
<%@page import="employee.model.dao.EmployeeDAO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");  %>

<% 
	String tmp = request.getParameter("employee_id");
	int employee_id = Integer.parseInt(tmp);

	
	//값들 모두 dao에 넣기
	EmployeeDTO dto = new EmployeeDTO();
	dto.setEmployee_id(employee_id);

	
	//DB연결후 추가작업
	EmployeeDAO dao = new EmployeeDAO();
	int result = dao.delete(dto);
	

	if(result > 0){
		out.println("<script>");
		out.println("location.href = '../main/main.jsp?menu_gubun=employee_list';");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('삭제에 실패했습니다.')");
		out.println("location.href = '../main/main.jsp?menu_gubun=employee_sakjae&employee_id="+employee_id+"';");
		out.println("</script>");
	}
	
%>