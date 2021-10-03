<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
 		
	int cookNo = 0;
	String cookId = "";
	String cookName = "";
	
	

 if(session.getAttribute("cookNo")!= null){
	cookNo = (Integer)session.getAttribute("cookNo");
	cookId = (String)session.getAttribute("cookId");
	cookName = (String)session.getAttribute("cookName");
}

	System.out.println("cookNo :"+cookNo);
	System.out.println("cookId :" +cookId);
	System.out.println("cookName :" + cookName);


	if(cookNo == 0){
		out.println("<script>");
		out.println("alert('로그인 하신 후 이용하세요.');");
		out.println("location.href='/jsp_mvc1/';");
		out.println("</script>");
	}  
	


	

%>