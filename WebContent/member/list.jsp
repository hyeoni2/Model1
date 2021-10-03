<%@page import="member.model.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="member.model.dto.*" %>
<%@include file="./member_header.jsp" %>
<%

	MemberDAO dao = new MemberDAO();

	/* 검색한 값을 가져오는 부분  */
	String search_option = request.getParameter("search_option");
	String search_data = request.getParameter("search_data");
	/* 검색한 값을 가져오는 부분 종료  */
	
	/* 권한 관련 */
	
	String chugaId = "chuga";
	String sujungId = "sujung";
	String sakjaeId = "sakjae";
	String adminId = "admin";
	
	System.out.println("list : "+cookId);
	
	/* 권한 관련 종료*/
	
	/* 검색한 값의 널값이나 공백 처리 부분  */
	if(search_option == null || search_data == null || search_option.trim().equals("") ||  search_data.trim().equals("")){
		search_option = "";
		search_data = "";
	}
	
	
	System.out.println(search_option);
	System.out.println(search_data);
	
	/* 검색한 값의 널값이나 공백 처리 부분  종료*/
	
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

	
	ArrayList<MemberDTO> list = dao.getSelectAll_02(search_option, search_data, startRecord, lastRecord);
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
<h2>회원목록</h2>
<div align="left" style="padding-left: 10%">
<%if(search_data == null || search_data.trim().equals("")){ %>	
	전체 회원목록 조회
<%}else{ %>
	검색어 <b style="color: #4A0084;"><%=search_data %></b>로 총 [<b style="color: #4A0084;"><%=count %></b>]건 검색완료
<%} %>			
</div>
<table id="table" width = "80%">
	<tr align="center">
		<th>
			순번
		</th>
		<th>
			아이디
		</th>
		<th>
			이름
		</th>
		<th>
			전화번호
		</th>
		<th>
			등록일
		</th>
	</tr>

<%
	for(int i = 0; i < list.size(); i++){		
		MemberDTO dto = list.get(i);	
%>		

	<tr align="center">
			<td><%=jj %></td>
			<td>
<%
		if(cookId.equals(dto.getId()) || cookId.equals(adminId) || cookId.equals(sujungId) || cookId.equals(sakjaeId) || cookId.equals(chugaId)){	
%>			
		<a href="../main/main.jsp?menu_gubun=member_view&no=<%=dto.getNo()%>">
					<b style="color: #4A0084;"><%=dto.getId()%></b>
		</a>
		<%}else{%>
				
				<a><%=dto.getId()%></a>
		<%} %>	
			</td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getPhone()%></td>
			<td><%=dto.getRegi_date() %></td>
	</tr>
	
<%
jj--;
	}%>		
</table>
<table width = 80%;>
	<tr>
		<td align="right">
			|
		<% if(cookId.equals(chugaId) || cookId.equals(adminId)){%>	
			
			<a href="../main/main.jsp?menu_gubun=member_chuga">등록</a>
		
		<%}else{%>
						등록
		<%} %>	
			|	
		</td>
	</tr>
	<tr>
	<!-- 검색을 누르면 작동  -->
		<td>
			<form name="searchForm">
				<select name="search_option">
<%if(search_option.equals("id")){ %>				
					<option value="">-- 선택 -- </option>
					<option value="id" selected>아이디</option>
					<option value="name">이름</option>
					<option value="id_name">아이디+이름</option>		
<%}else if(search_option.equals("name")){ %>				
					<option value="">-- 선택 -- </option>
					<option value="id" >아이디</option>
					<option value="name" selected>이름</option>
					<option value="id_name">아이디+이름</option>		
<%}else if(search_option.equals("id_name")){ %>				
					<option value="">-- 선택 -- </option>
					<option value="id" >아이디</option>
					<option value="name" >이름</option>
					<option value="id_name" selected>아이디+이름</option>		
<%}else if(!(search_option.equals("id") || search_option.equals("name") || search_option.equals("id_name"))){ %>	
					<option value="" selected>-- 선택 -- </option>
					<option value="id" >아이디</option>
					<option value="name" >이름</option>
					<option value="id_name" >아이디+이름</option>										
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
			<a href="../main/main.jsp?menu_gubun=member_list&pageNumber=1&search_option=<%=search_option%>&search_data=<%=search_data%>">[첫페이지]</a> &nbsp;
		
			<%if(startPage > blockSize){ //시작페이지가 10개의 블럭 사이즈보다 크다고 하면 작동%>
			<a href="#">[이전10개]</a> &nbsp;
			<%}else{ %>
				[이전10개]&nbsp;
			<%} %>
			
			<%for(int i = startPage; i <= lastPage; i++){%>
				<%if(pageNumber == i){%>
					<b>[<%=i %>]</b> &nbsp;
				<%}else{ %>
					<a href="../main/main.jsp?menu_gubun=member_list&pageNumber=<%=i %>"><%=i %></a>&nbsp;
				<%} %>
			<%}%>

			<%if(lastPage < totalPage){ //시작페이지가 10개의 블럭 사이즈보다 크다고 하면 작동%>
			<a href="#">[다음 10개]</a> &nbsp;
			<%}else{ %>
			[다음 10개] &nbsp;
			<%} %>
			<a href="../main/main.jsp?menu_gubun=member_list&pageNumber=<%=totalPage%>&search_option=<%=search_option%>&search_data=<%=search_data%>">[끝 페이지]</a>
		</td>
	</tr>
<%} %>	
		<!-- 페이징 종료 -->
</table>
<!-- 본문 내용 종료  -->			
<script>
	function search() {
		if(confirm('검색하시겠습니까?')){
		searchForm.method = 'post';
		searchForm.action = '../main/main.jsp?menu_gubun=member_search';
		searchForm.submit();
		}
		
	}
</script>
