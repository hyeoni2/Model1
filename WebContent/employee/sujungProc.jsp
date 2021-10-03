<%@page import="employee.model.dto.EmployeeDTO"%>
<%@page import="employee.model.dao.EmployeeDAO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8");  %>

<% 
	//String 값 받기(이름,이메일,전화번호)
	String name = request.getParameter("name");  	
	String email = request.getParameter("email");  
	String phone = request.getParameter("phone");  

	//int 값 변환(부서번호, 월급)
	String tmp;
	
	tmp = request.getParameter("employee_id");
	int employee_id = Integer.parseInt(tmp);
	
	tmp = request.getParameter("department_id");  
	int department_id = Integer.parseInt(tmp);
	
	tmp = request.getParameter("salary");  
	int salary = Integer.parseInt(tmp);
	
	
	//date 값 변환(가입일)
	tmp = request.getParameter("hire_date");  
	Date hire_date = Date.valueOf(tmp);
	
	//값들 모두 dao에 넣기
	EmployeeDTO dto = new EmployeeDTO();
	dto.setEmployee_id(employee_id);
	dto.setName(name);
	dto.setEmail(email);
	dto.setPhone(phone);
	dto.setHire_date(hire_date);
	dto.setSalary(salary);
	dto.setDepartment_id(department_id);
	
	//DB연결후 추가작업
	EmployeeDAO dao = new EmployeeDAO();
	int result = dao.setUpdate(dto);
	
	System.out.println(dto.getName());
	System.out.println(dto.getEmail());
	System.out.println(employee_id+ "employee_id");
	System.out.println(dto.getDepartment_id());
	System.out.println(dto.getPhone());
	System.out.println(dto.getSalary());
	System.out.println(dto.getEmployee_id());
	System.out.println(dto.getHire_date());
	System.out.println(result);
	
	if(result > 0){
		out.println("<script>");
		out.println("location.href = '../main/main.jsp?menu_gubun=employee_view&employee_id="+employee_id+"';");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('수정에 실패했습니다.')");
		out.println("location.href = '../main/main.jsp?menu_gubun=employee_sujung';");
		out.println("</script>");
	}
	
%>