<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../include/inc_header.jsp" %>
 <%  request.setCharacterEncoding("UTF-8"); %>
 
 <%
 
 	String menu_gubun = request.getParameter("menu_gubun");
 	String imsi_ = request.getParameter("imsi");
 	
 	if(menu_gubun == null || menu_gubun.trim().equals("")){
 		menu_gubun = "member_list";
 	}
 	
 	String[] arrayTemp = menu_gubun.split("_");
 	String divStr = arrayTemp[0];
 	
 	
 	if(imsi_ == null || imsi_.trim().equals("")){
 		imsi_ = "0";
 	}
 	
 	int imsi = Integer.parseInt(imsi_);
 	
 	String url = "../"+ menu_gubun.replace("_", "/")+".jsp";
 	
 	System.out.println("url "+url);
 	System.out.println("imsi "+imsi); 	
 	System.out.println("menu_gubun "+menu_gubun); 
 	System.out.println("main에서 divStr : " + divStr);
 %>   
    
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>

<table border="1" width = "80%" align = "center" >
	<tr style="background-color: #B988EB;">
		<td style="height: 100px;" align="center">
			<jsp:include page="../include/inc_menu.jsp" flush="true">
				<jsp:param value="<%=divStr %>" name="divStr"/>
			</jsp:include>
		</td>
	</tr>
	
	<tr>
	
		<td style="padding: 50px;" align="center">
		
<%-- 	jsp액션태그 모를시 이렇게 include해야함
		 	<!-- member 메뉴 관련 -->
			<%if(menu_gubun.equals("member_list")){ %>
				<%@ include file="../member/list.jsp" %>
			<%}else if(menu_gubun.equals("member_view")) {%>
				<%@ include file="../member/view.jsp" %>
			<%}else if(menu_gubun.equals("member_chuga")) {%>
				<%@ include file="../member/chuga.jsp" %>
			<%}else if(menu_gubun.equals("member_sujung")) {%>
			<%@ include file="../member/sujung.jsp" %>
			<%}else if(menu_gubun.equals("member_sakjae")) {%>
			<%@ include file="../member/sakjae.jsp" %>
			<%}%>

			<!-- product 메뉴 관련 -->
			<%if(menu_gubun.equals("product_list")){ %>
				<%@ include file="../product/list.jsp" %>
			<%}else if(menu_gubun.equals("product_view")) {%>
				<%@ include file="../product/view.jsp" %>
			<%}else if(menu_gubun.equals("product_chuga")) {%>
				<%@ include file="../product/chuga.jsp" %>
			<%}else if(menu_gubun.equals("product_sujung")) {%>
			<%@ include file="../product/sujung.jsp" %>
			<%}else if(menu_gubun.equals("product_sakjae")) {%>
			<%@ include file="../product/sakjae.jsp" %>
			<%}%>

			<!-- sungjuk 메뉴 관련 -->
			<%if(menu_gubun.equals("sungjuk_list")){ %>
				<%@ include file="../sungjuk/list.jsp" %>
			<%}else if(menu_gubun.equals("sungjuk_view")) {%>
				<%@ include file="../sungjuk/view.jsp" %>
			<%}else if(menu_gubun.equals("sungjuk_chuga")) {%>
				<%@ include file="../sungjuk/chuga.jsp" %>
			<%}else if(menu_gubun.equals("sungjuk_sujung")) {%>
			<%@ include file="../sungjuk/sujung.jsp" %>
			<%}else if(menu_gubun.equals("sungjuk_sakjae")) {%>
			<%@ include file="../sungjuk/sakjae.jsp" %>
			<%}%> 
--%>
			 
		<!-- 해당 페이지를 먼저 컴파일 한 후 진행
			 그래서 param을 붙여서 no값을 함께 보내준다 
			 일반 include는 변수를 공유, jsp액션태그는 param으로 넘겨서 받아야 쓸 수 있음  -->
		
		 	<!-- 사실 여기서는 필요없는 것(하는 방식을 알기위해 임시로 붙임 -->
 		 <jsp:include page="<%=url %>" flush="true">
		 	<jsp:param name="imsi" value="<%=imsi %>" />
		 </jsp:include>
		 
		  
		</td>
	</tr>
	<tr>
		<td style="height: 100px; background-color: #B988EB; color: white" align="center">
			<jsp:include page="../include/inc_bottom.jsp" flush="true"></jsp:include>
		</td>
	</tr>
</table>

</body>
</html>