
<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	MemoDAO dao = new MemoDAO();
	
	String search_option = request.getParameter("search_option");
	String search_data = request.getParameter("search_data");
	
	if(search_option == null || search_data == null || search_option.trim().equals("") ||  search_data.trim().equals("")){
		search_option = "";
		search_data = "";
	}
	
	System.out.println(search_option);
	System.out.println(search_data);
	
	/*페이지와 관련*/
	String pageNumber_ = request.getParameter("pageNumber");
	if(pageNumber_ == null || pageNumber_.trim().equals("")){//null이나 공백일 경우 1을 강제로 넣음
		pageNumber_ = "1";
	}
	
	
	int pageNumber = Integer.parseInt(pageNumber_);//현재 페이지
	
	int pageSize = 10; //한페이지당 보여지는 최대의 갯수
	int blockSize = 10; //한 화면에 넘길 수 있는 페이지 수(총 1~10까지 나온다는 의미)
	
	int totalRecord = dao.getTotalRecord_02(search_option, search_data);//전체 레코드 갯수
	int jj = totalRecord - pageSize * (pageNumber -1); //화면출력번호
	//어떤 페이지 번호를 물고오느냐에 따라 달라짐
	int startRecord = pageSize * (pageNumber -1) + 1 ; //시작레코드
	int lastRecord = pageSize * pageNumber; //마지막 레코드
	
	if(lastRecord > totalRecord){
		lastRecord = totalRecord;
	}
	
	int totalPage = 0;//1~30까지 있고 10개씩 본다면 total은 3
	int startPage = 1;//회면에 보이는 시작하는 번호
	int lastPage = 1;//화면에 보이는 끝나는 번호
	if(totalRecord > 0){
		totalPage = totalRecord / pageSize + (totalRecord % pageSize == 0? 0:1);
		startPage = (pageNumber / blockSize -(pageNumber % blockSize != 0 ? 0 : 1)) * blockSize + 1;
		lastPage = startPage + blockSize - 1;
		if(lastPage > totalPage){
			lastPage = totalPage;
		}
	}
	
	System.out.println("totalRecord : "+totalRecord);
	System.out.println("startRecord : "+startRecord);
	System.out.println("lastRecord : "+lastRecord);
	System.out.println("totalPage : "+totalPage);
	System.out.println("startPage : "+startPage);
	System.out.println("lastPage : "+lastPage);


	/*페이지와 관련 종료*/

	
	ArrayList<MemoDTO> list = dao.getSelectAll_02(search_option, search_data, startRecord, lastRecord);
	int count = list.size();
%>
<style>
	a{
		text-decoration: none;
		color: black;
	}
	
	#table {
	  font-family: Arial, Helvetica, sans-serif;
	  border-collapse: collapse;
	  width: 80%;
	}
	
	#table td, #table th {
	  border: 1px solid #ddd;
	  padding: 8px;
	}
	
	#table tr:nth-child(even){background-color: #f2f2f2;}
	
	#table tr:hover {background-color: #ddd;}
	
	#table th {
	  padding-top: 12px;
	  padding-bottom: 12px;
	  background-color: #4A0084;
	  color: white;
	}
	
</style>
<!-- 본문 내용 시작  -->			
	<h2>메모 목록</h2>
<div align="left" style="padding-left: 10%">
<%if(search_data == null || search_data.trim().equals("")){ %>	
	전체 메모 조회
<%}else{ %>
	검색어 <b style="color: #4A0084;"><%=search_data %></b>로 총 [<b style="color: 4A0084;"><%=count %></b>]건 검색완료
<%} %>			
</div>
	<table id="table">
	<tr>
		<th>순번</th>
		<th>작성자</th>
		<th>메모 내용</th>
		<th>등록일</th>
	</tr>
<%
	for(int i = 0; i < list.size(); i++){
		
		MemoDTO dto = new MemoDTO();
		
		dto = list.get(i);
%>
	<tr>
		<td><%=dto.getNo()%></td>
		<td>
		<a href="../main/main.jsp?menu_gubun=memo_view&no=<%=dto.getNo()%>">
			<b style="color: #4A0084;"><%=dto.getWriter()%></b>
		</a></td>
		<td><%=dto.getContent()%></td>
		<td><%=dto.getRegi_date()%></td>

	<tr>
<%
}%>
	
</table>
<table width = 80%>
	<tr>
		<td align="right">
			|
			<a href="../main/main.jsp?menu_gubun=memo_chuga">등록</a>
			|
		</td>
	</tr>
		<tr>
		<td>
			<form name="searchForm">
				<select name="search_option">
<%if(search_option.equals("writer")){ %>				
					<option value="">-- 선택 -- </option>
					<option value="writer" selected>작성자</option>
					<option value="content">내용</option>
					<option value="writer_content">작성자+내용</option>		
<%}else if(search_option.equals("content")){ %>				
					<option value="">-- 선택 -- </option>
					<option value="writer">작성자</option>
					<option value="content" selected>내용</option>
					<option value="writer_content">작성자+내용</option>			
<%}else if(search_option.equals("writer_content")){ %>				
					<option value="">-- 선택 -- </option>
					<option value="writer">작성자</option>
					<option value="content">내용</option>
					<option value="writer_content" selected>작성자+내용</option>		
<%}else if(!(search_option.equals("writer") || search_option.equals("content") || search_option.equals("writer_content"))){ %>	
					<option value="" selected>-- 선택 -- </option>
					<option value="writer" >작성자</option>
					<option value="content">내용</option>
					<option value="writer_content">작성자+내용</option>										
<%} %>					
				</select>
				<input type="text" name="search_data" style="width: 100px;" value="<%=search_data%>">
				<button type="button" onclick="search();">검색</button>
			</form>
		</td>
	</tr>
		<!-- 페이징관련 -->
<%	if(totalRecord > 0){%>	
	<tr>
		<td style="padding-top: 20px; text-align: center;">
			<a href="../main/main.jsp?menu_gubun=memo_list&pageNumber=1&search_option=<%=search_option%>&search_data=<%=search_data%>">[첫페이지]</a> &nbsp;
		
			<%if(startPage > blockSize){ //시작페이지가 10개의 블럭 사이즈보다 크다고 하면 작동%>
			<a href="#">[이전10개]</a> &nbsp;
			<%}else{ %>
				[이전10개]&nbsp;
			<%} %>
			
			<%for(int i = startPage; i <= lastPage; i++){%>
				<%if(pageNumber == i){%>
					<b>[<%=i %>]</b> &nbsp;
				<%}else{ %>
					<a href="../main/main.jsp?menu_gubun=memo_list&pageNumber=<%=i %>"><%=i %></a>&nbsp;
				<%} %>
			<%}%>

			<%if(lastPage < totalPage){ //시작페이지가 10개의 블럭 사이즈보다 크다고 하면 작동%>
			<a href="#">[다음 10개]</a> &nbsp;
			<%}else{ %>
			[다음 10개] &nbsp;
			<%} %>
			<a href="../main/main.jsp?menu_gubun=memo_list&pageNumber=<%=totalPage%>&search_option=<%=search_option%>&search_data=<%=search_data%>">[끝 페이지]</a>
		</td>
	</tr>
<%} %>	
		<!-- 페이징 종료 -->
</table>
<script>
	function search() {
		if(confirm('검색하시겠습니까?')){
		searchForm.method = 'post';
		searchForm.action = '../main/main.jsp?menu_gubun=memo_search';
		searchForm.submit();
		}
		
	}
</script>