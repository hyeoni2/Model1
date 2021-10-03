<%@page import="java.util.ArrayList"%>
<%@page import="book.model.dao.BookDAO"%>
<%@page import="book.model.dto.BookDTO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file="../member/member_header.jsp" %>
<%

	request.setCharacterEncoding("UTF-8");		
	
	BookDAO dao = new BookDAO();
	
	String search_option = request.getParameter("search_option");
	String search_data = request.getParameter("search_data");
	
	if(search_option == null || search_data == null || search_option.trim().equals("") ||  search_data.trim().equals("")){
		search_option = "";
		search_data = "";
	}

	ArrayList<BookDTO> list = new ArrayList<>();
	
	//삭제여부 확인 버튼 관련
	String select = request.getParameter("select");
	if(select == null || select.trim().equals("")){
		select = "n";
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
	
	int totalRecord = dao.getTotalRecord_02(select, search_option, search_data);//전체 레코드 갯수
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
	
	
	
	list = dao.getSelectAll_02(select, search_option, search_data, startRecord, lastRecord);
	int count = list.size();
	


	System.out.println("리스트에서검색"+select);
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

<h2>
<%if(select.equals("n")){ %>
		이용가능한 도서 목록
<%}else{ %>
		전체 도서 목록
<%} %>
</h2>
<form name="selectFrom" method="post" action="../main/main.jsp?menu_gubun=book_selectButton&select=<%=select%>">
	<table width = 80%>
		<input type="hidden" name = "select" value="<%=select %>" />
			<tr>
				<td align="left">
				<%if(search_data == null || search_data.trim().equals("")){ %>	
					전체 메모 조회
				<%}else{ %>
					검색어 <b style="color: #4A0084;"><%=search_data %></b>으로 총 [<b style="color: #4A0084;"><%=count %></b>]건 검색완료
				<%} %>			
			</td>
			<td align="right">
				<button type="submit">
					<%if(select.equals("n")){ %>
						전체리스트
					<%
						
					}else{ %>
						이용가능한 도서 목록
					<%} %>
				</button>	
			</td>
		</tr>
	</table>
</form>
<table id="table"> 

	<tr>
		<th>
			순번
		</th>
		<th>
			도서 코드
		</th>
		<th>
			도서 제목
		</th>
		<th>
			작가
		</th>
		<th>
			출판사
		</th>
		<th>
			출판일
		</th>
		<th>
			등록일
		</th>
		<th>
			삭제여부
		</th>
	</tr>
<%	for(int i = 0; i < list.size(); i++){ 
		BookDTO dto = new BookDTO();
		dto = list.get(i);
		
		if(dto.getCon_del() == null){
			String con_del = "N";
			dto.setCon_del(con_del);	
		}		
%>	
	<tr>
		<td>
			<%=jj %>	
		</td>
		<td>
		<a href="../main/main.jsp?menu_gubun=book_view&book_id=<%=dto.getBook_id()%>">
		 <b style="color: #4A0084;"><%=dto.getBook_id() %></b>
		</a>
		</td>
		<td><%=dto.getTitle() %></td>
		<td><%=dto.getAuthor() %></td>
		<td><%=dto.getPublisher() %></td>
		<td><%=dto.getPublisher_date() %></td>
		<td><%=dto.getInsert_date()%></td>
		<td><%=dto.getCon_del()%></td>
	</tr>
	
<%
jj--;
}%>		
</table>
<table width = 80%>
<tr>
	<td align="right">
		|
		<a href="../main/main.jsp?menu_gubun=book_chuga">등록</a>
		|
		</td>
</tr>
<tr>
	<td>
	<form name="searchForm">
			<select name="search_option" style="width: 80px;">
<%if(search_option.equals("title")){ %>				
				<option value="" >-- 선택 --</option>
				<option value="title" selected>도서 제목</option>
				<option value="author">작가</option>
				<option value="title_author">도서 제목+작가</option>	
				
<%}else if(search_option.equals("author")){ %>				
				<option value="" >-- 선택 --</option>
				<option value="title">도서 제목</option>
				<option value="author" selected>작가</option>
				<option value="title_author">도서 제목+작가</option>	
				
<%}else if(search_option.equals("title_author")){ %>				
				<option value="" >-- 선택 --</option>
				<option value="title">도서 제목</option>
				<option value="author">작가</option>
				<option value="title_author" selected>도서 제목+작가</option>	

<%}else if(!(search_option.equals("title") || search_option.equals("author") || search_option.equals("title_author"))){ %>	
				<option value="" selected>-- 선택 --</option>
				<option value="title">도서 제목</option>
				<option value="author">작가</option>
				<option value="title_author">도서 제목+작가</option>									
<%} %>			
			</select>
	
		<input type="text" name="search_data" value="<%=search_data %>" style="width: 80px;">
		<button type="button" onclick="search();">검색</button>
		</td>
	</form>
	</tr>
	<!-- 페이징관련 -->
<%	if(totalRecord > 0){%>	
	<tr>
		<td style="padding-top: 20px; text-align: center;">
			<a href="../main/main.jsp?menu_gubun=book_list&pageNumber=1&search_option=<%=search_option%>&search_data=<%=search_data%>">[첫페이지]</a> &nbsp;
		
			<%if(startPage > blockSize){ //시작페이지가 10개의 블럭 사이즈보다 크다고 하면 작동%>
			<a href="#">[이전10개]</a> &nbsp;
			<%}else{ %>
				[이전10개]&nbsp;
			<%} %>
			
			<%for(int i = startPage; i <= lastPage; i++){%>
				<%if(pageNumber == i){%>
					<b>[<%=i %>]</b> &nbsp;
				<%}else{ %>
					<a href="../main/main.jsp?menu_gubun=book_list&pageNumber=<%=i %>"><%=i %></a>&nbsp;
				<%} %>
			<%}%>

			<%if(lastPage < totalPage){ //시작페이지가 10개의 블럭 사이즈보다 크다고 하면 작동%>
			<a href="#">[다음 10개]</a> &nbsp;
			<%}else{ %>
			[다음 10개] &nbsp;
			<%} %>
			<a href="../main/main.jsp?menu_gubun=book_list&pageNumber=<%=totalPage%>&search_option=<%=search_option%>&search_data=<%=search_data%>">[끝 페이지]</a>
		</td>
	</tr>
<%} %>	
		<!-- 페이징 종료 -->
</table>
<script>
	function search() {
		if(confirm('검색하시겠습니까?')){
		searchForm.method = 'post';
		searchForm.action = '../main/main.jsp?menu_gubun=book_search&select=<%=select%>';
		searchForm.submit();
		}
		
	}
</script>
