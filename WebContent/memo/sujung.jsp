
<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	MemoDTO dto = new MemoDTO();
	dto.setNo(no);
	
	MemoDAO dao = new MemoDAO();
	dto = dao.getSelectOne(dto);
	
%>
	<h2>메모 수정</h2>
  <form name = "sujungForm"> 
  	<input type="hidden" name="no" value="<%=dto.getNo()%>"/>
	<table border="0">
		<tr>
			<td width="100px">
				작성자
			</td>
			<td>
				<input type="text" name="writer" value="<%=dto.getWriter() %>" >
			</td>
		</tr>
		<tr>
			<td>
				내용
			</td>
			<td>
				<textarea name="content" style="width:300px;, height = 150px;">
					<%=dto.getContent() %>
				</textarea>
			</td>
		</tr>
		<tr>
			<td>
				등록일
			</td>
			<td>
				<%=dto.getRegi_date() %> 
			</td>
		</tr>	
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="sujung()">수정하기</button>
				<button type="button" onclick="list()">목록으로</button>
			</td>
		</tr>
	</table>
</form>

<script>
	function list() {
		location.href = '../main/main.jsp?menu_gubun=memo_list';
	}
	
	function sujung() {
			
		if(confirm('수정하시겠습니까?')){
			
			sujungForm.method = 'post';
			sujungForm.action = '../memo/sujungProc.jsp';
			sujungForm.submit();
		}
	}
</script>