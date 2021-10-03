<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- path 값을 사용하기 위해 include를 걸어줌 -->
<%@ include file="../include/inc_header.jsp" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String divStr = request.getParameter("divStr");

	System.out.println("divStr : " + divStr);
	
%>
<style>
	.a{
		color: white;
		text-decoration: none;
		
	}
	
	.a:hover {
		font-weight: bold;
		border: 1px solid white;
		transition : .5s; 
	}

	
</style>    
<table border="0">
	<tr height="50px;">
		<td style="padding: 5px 5px;" id="home" >
			<ion-icon name="home-outline"></ion-icon>
			<a class="a" href = "<%=path %>">HOME</a>
		</td>
		<td style="padding: 0px 5px;" id="member">	
			<ion-icon name="person-add-outline"></ion-icon>
			<a class="a" href = "<%=path %>/main/main.jsp?menu_gubun=member_list">회원관리</a>
		</td>	
		<td style="padding: 0px 5px;" id="product">	
			<ion-icon name="pricetags-outline"></ion-icon>
			<a class="a" href = "<%=path %>/main/main.jsp?menu_gubun=product_list">상품관리</a>
		</td>
		<td style="padding: 0px 5px;" id="book">	
			<ion-icon name="book-outline"></ion-icon>
			<a class="a" href = "<%=path %>/main/main.jsp?menu_gubun=book_list">도서관리</a>
		</td>
		<td style="padding: 0px 5px;" id="sungjuk">	
			<ion-icon name="school-outline"></ion-icon>
			<a class="a" href = "<%=path %>/main/main.jsp?menu_gubun=sungjuk_list">성적관리</a>
		</td>
		<td style="padding: 0px 5px;" id="memo">	
			<ion-icon name="clipboard-outline"></ion-icon>
			<a class="a" href = "<%=path %>/main/main.jsp?menu_gubun=memo_list">메모장</a>
		</td>
		<td style="padding: 0px 5px;" id="guestbook">
			<ion-icon name="chatbubbles-outline"></ion-icon>
			<a class="a" href = "<%=path %>/main/main.jsp?menu_gubun=guestbook_list">방명록</a>
		</td>
		<td style="padding: 5px 5px; color: white;">
			<%if(cookNo == 0){%>
				<ion-icon name="log-in-outline"></ion-icon>
				<a class="a" href="<%=path %>/main/main.jsp?menu_gubun=member_login">로그인</a>
			<%}else{%>
			<b><%=cookName %>님...</b>
			<a class="a" href="<%=path %>/member/logout.jsp">로그아웃</a>
			<ion-icon name="log-out-outline"></ion-icon>
			<%}%>
		</td>
	</tr>
	<tr height="50px;">
		<td style="padding: 5px 5px;" id="employee">	
			<a class="a" href = "<%=path %>/main/main.jsp?menu_gubun=employee_list">직원관리</a>
		</td>	
		<td style="padding: 0px 10px;" id="department">	
			<a class="a" href = "<%=path %>/main/main.jsp?menu_gubun=department_list">부서관리</a>
		</td>
		<!-- <td style="padding: 0px 5px;" id="a">	
			&nbsp;
		</td>
		<td style="padding: 0px 5px;" id="b">	
			&nbsp;
		</td>
		<td style="padding: 0px 5px;" id="c">	
			&nbsp;
		</td>
		<td style="padding: 0px 5px;" id="d">	
			&nbsp;
		</td>
		<td style="padding: 0px 5px;" id="e">	
			&nbsp;
		</td>
		<td style="padding: 5px 5px;" id="f">	
			&nbsp;
		</td> -->
		
	</tr>
</table>
<script src="//code.jquery.com/jquery-3.3.1.js"></script>
<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script>
	$("#<%=divStr%>").css("border-bottom" , "3px solid #340A94");


</script>





