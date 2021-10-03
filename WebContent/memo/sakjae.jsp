<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	System.out.println(no);
	
	MemoDTO dto = new MemoDTO();
	dto.setNo(no);
	
	MemoDAO dao = new MemoDAO();
	
	dto = dao.getSelectOne(dto);
	
%>
	<h2>메모 삭제</h2>
  <form name = "sakjaeForm"> 
  	<input type="hidden" name="no" value="<%=dto.getNo()%>"/>
	<table border="0">
		<tr>
			<td width="100px">
				작성자
			</td>
			<td>
				<input type="text" value="<%=dto.getWriter() %>" name="writer"> 
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
				<input type="text" value="<%=dto.getRegi_date() %>" name="regi_date"> 
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" onclick="sakjae()">삭제하기</button>
				<button type="button" onclick="list()">목록으로</button>
			</td>
		</tr>
	</table>
</form>

<script>
	function list() {
		location.href = '../main/main.jsp?menu_gubun=memo_list';
	}
	
	function sakjae() {
			
		if(confirm('삭제하시겠습니까?')){
			
			sakjaeForm.method = 'post';
			sakjaeForm.action = '../memo/sakjaeProc.jsp';
			sakjaeForm.submit();
		}
	}
</script>