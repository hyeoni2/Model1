<%@page import="member.model.dao.MemberDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="member.model.dto.*"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("UTF-8"); %>    

<%
	String no_ = request.getParameter("no");
	System.out.println(no_);
	int no = Integer.parseInt(no_);
	
	
	/* 권한 관련 */
	String cookId = (String)session.getAttribute("cookId");
	
	String chugaId = "chuga";
	String sujungId = "sujung";
	String sakjaeId = "sakjae";
	String adminId = "admin";
	
	System.out.println("list : "+cookId);
	
	if(!(cookId.equals(sakjaeId) || cookId.equals(adminId))){
		out.println("<script>");
		out.println("alert('접근할 수 있는 권한이 없습니다.');");
		out.println("location.href = '/jsp_mvc1'");
		out.println("</script>");
	}
	
	/* 권한 관련 종료 */
	
	
	/* 권한 관련 종료*/
	
	MemberDTO dto = new MemberDTO();
	dto.setNo(no);
	
	MemberDAO dao = new MemberDAO();
	dto = dao.getSelectOne(dto);


%>
			<!-- 본문 내용 시작 -->
			
			<h2>회원삭제</h2>
			
<form name="SakjaeForm">
<input type="hidden" name="no" value="<%=no%>"/>
<table border="1" width="400">
	<tr>
		<td>아이디 : </td>
		<td>
			<input type="hidden" name="id" value="<%=dto.getId()%>">
			<%=dto.getId()%>
		</td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td>
			<input type="password" name="passwd">
		</td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td>
			<%=dto.getName()%>
		</td>
	</tr>
	<tr>
		<td>전화번호 : </td>
		<td>
			<%=dto.getPhone1()%>-<%=dto.getPhone2()%>-<%=dto.getPhone3()%>
		</td>
	</tr>
		<tr>
		<td>이메일 : </td>
		<td>
		<%=dto.getEmail()%>
		</td>
	</tr>
	<tr>
		<td>주소 : </td>
		<td>
			<%=dto.getJuso1()%><br>
			<%=dto.getJuso2()%> <%=dto.getJuso3()%> <%=dto.getJuso4()%><br>
		</td>
	</tr>	
	<tr>
		<td colspan="2" align="center">
			<button type="button" onclick="sakjae();">삭제하기</button>
			<button type="button" onclick="list();">목록으로</button>
		</td>
	</tr>	
</table>
</form>
			
			
			<!-- 본문 내용 종료 -->



<script type="text/javascript">
	function list() {
		location.href = '../main/main.jsp?menu_gubun=member_list';
	}

	function sakjae() {
		
		if(confirm('삭제하시겠습니까?')){
			SakjaeForm.method = 'post';
			SakjaeForm.action =  '../member/sakjaeProc.jsp';
			SakjaeForm.submit();
		}
		
	}
</script>
</body>
</html>