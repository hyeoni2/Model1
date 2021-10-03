<%@page import="sungjuk.model.dao.SungjukDAO"%>
<%@page import="sungjuk.model.dto.SungjukDTO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	SungjukDTO dto = new SungjukDTO();
	dto.setNo(no);
	
	SungjukDAO dao = new SungjukDAO();
	dto = dao.getSelectOne(dto);
	
%>
	<h2>성적 수정</h2>
  <form name = "sujungForm"> 
  	<input type="hidden" name="no" value="<%=dto.getNo()%>"/>
	<table border="0">
		<tr>
			<td width="100px;">
				아이디
			</td>
			<td>
				<%=dto.getId() %>
			</td>
		</tr>
		<tr>
			<td>
				이름
			</td>
			<td>
				<input type="text" value="<%=dto.getName() %>" name="name"> 
			</td>
		</tr>
		<tr>
			<td>
				시험이름
			</td>
			<td>
				<input type="text" value="<%=dto.getSihum_name() %>" name="sihum_name"> 
			</td>
		</tr>
		<tr>
			<td>
				국어점수
			</td>
			<td>
				<input type="text" value="<%=dto.getKor()%>" name="kor"> 
			</td>
		</tr>
		<tr>
			<td>
				영어점수
			</td>
			<td>
				<input type="text" value="<%=dto.getEng() %>" name="eng"> 
			</td>
		</tr>
		<tr>
			<td>
				수학점수
			</td>
			<td>
				<input type="text" value="<%=dto.getMat() %>" name="mat"> 
			</td>
		</tr>
		<tr>
			<td>
				과학점수
			</td>
			<td>
				<input type="text" value="<%=dto.getSci() %>" name="sci"> 
			</td>
		</tr>
		<tr>
			<td>
				사회점수
			</td>
			<td>
				<input type="text" value="<%=dto.getHis()%>" name="his"> 
			</td>
		</tr>
	
			<td colspan="2" align="center">
				<button type="button" onclick="sujung()">수정하기</button>
				<button type="button" onclick="list()">목록으로</button>
			</td>
		</tr>
	</table>
</form>

<script>
	function list() {
		location.href = '../main/main.jsp?menu_gubun=sungjuk_list';
	}
	
	function sujung() {
			
		if(confirm('수정하시겠습니까?')){
			
			sujungForm.method = 'post';
			sujungForm.action = '../sungjuk/sujungProc.jsp';
			sujungForm.submit();
		}
	}
</script>