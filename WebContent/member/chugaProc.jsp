<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
<%@page import="sungjuk.model.dto.SungjukDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@page import="java.sql.*"%>
<%
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String passwdChk = request.getParameter("passwdChk");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String email = request.getParameter("email");
	String juso1 = request.getParameter("sample6_postcode");
	String juso2 = request.getParameter("sample6_address");
	String juso3 = request.getParameter("sample6_detailAddress");
	String juso4 = request.getParameter("sample6_extraAddress");
	
	
	
	if(!passwd.equals(passwdChk)){
		out.println("<script>");
		out.println("alert('입력하신 비밀번호가 다릅니다.');");
		out.println("history.back();");
		out.println("</script>");
	}
	
	MemberDTO dto = new MemberDTO();
	dto.setId(id);
	dto.setPasswd(passwd);
	dto.setPasswdChk(passwdChk);
	dto.setName(name);
	dto.setPhone1(phone1);
	dto.setPhone2(phone2);
	dto.setPhone3(phone3);
	dto.setEmail(email);
	dto.setJuso1(juso1);
	dto.setJuso2(juso2);
	dto.setJuso3(juso3);
	dto.setJuso4(juso4);
	
	System.out.println("id : "+id);
	System.out.println("passwd : "+passwd);
	System.out.println("passwdChk : "+passwdChk);
	System.out.println("name : "+name);
	System.out.println("phone1 : "+phone1);
	System.out.println("phone2 : "+phone2);
	System.out.println("phone3 : "+phone3);
	System.out.println("email : "+email);
	System.out.println("juso1 : "+juso1);
	System.out.println("juso2 : "+juso2);
	System.out.println("juso3 : "+juso3);
	System.out.println("juso4 : "+juso4);

	MemberDAO dao = new MemberDAO();
	int result = dao.setInsert(dto);
	
		if(result > 0){//성공
			out.println("<script>");
			out.println("alert('성공적으로 등록되었습니다.');");
			out.println("location.href = '../main/main.jsp?menu_gubun=member_list';");
			out.println("</script>");
		}else{
			out.println("<script>");
			out.println("alert('회원등록 중 오류가 발생했습니다.');");
			out.println("location.href = '../main/main.jsp?menu_gubun=member_chuga';");
			out.println("</script>");
		}
		
		//----------------------------------------------------------------
		

%>