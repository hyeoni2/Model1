<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>    
<%

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	String passwd = request.getParameter("passwd");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String email = request.getParameter("email");
	String juso1 = request.getParameter("sample6_postcode");
	String juso2 = request.getParameter("sample6_address");
	String juso3 = request.getParameter("sample6_detailAddress");
	String juso4 = request.getParameter("sample6_extraAddress");
	
	MemberDTO dto = new MemberDTO();
	dto.setNo(no);
	dto.setPasswd(passwd);
	dto.setPhone1(phone1);
	dto.setPhone2(phone2);
	dto.setPhone3(phone3);
	dto.setEmail(email);
	dto.setJuso1(juso1);
	dto.setJuso2(juso2);
	dto.setJuso3(juso3);
	dto.setJuso4(juso4);
	
	MemberDAO dao = new MemberDAO();
	int result = dao.setUpdate(dto);

	System.out.println(passwd);
	System.out.println(phone1);
	System.out.println(phone2);
	System.out.println(phone3);
	System.out.println(email);
	System.out.println(juso1);
	System.out.println(juso2);
	System.out.println(juso3);
	System.out.println(juso4);
	System.out.println(no+".");
	
	
		
	String msg = "";
	if(result > 0){
		
		msg = "정상적으로 수정되었습니다.";
	}else{
		msg = "처리 중 오류가 발생했습니다.";
	}

	out.println("<script>"); 
	out.println("alert('"+msg+"');");
	out.println("location.href = '../main/main.jsp?menu_gubun=member_view&no="+no+"';");
	out.println("</script>");
	
	
%>

