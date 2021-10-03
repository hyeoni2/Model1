<%@page import="department.model.dao.DepartmentDAO"%>
<%@page import="department.model.dto.DepartmentDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../member/member_header.jsp" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<% 
	DepartmentDAO dao = new DepartmentDAO();

	/* 검색 관련 시작 */
	String search_option = request.getParameter("search_option");
	String search_data = request.getParameter("search_data");
	
	if(search_option == null || search_data == null || search_option.trim().equals("") || search_data.trim().equals("")) {
		search_data = "";
		search_option = "";
	}
	/* 검색 관련 종료 */
	
	
	/*페이지와 관련*/
	String pageNumber_ = request.getParameter("pageNumber");
	if(pageNumber_ == null || pageNumber_.trim().equals("")){//null이나 공백일 경우 1을 강제로 넣음
		pageNumber_ = "1";
	}
	
	
	int pageNumber = Integer.parseInt(pageNumber_);//현재 페이지
	
	int pageSize = 10; //한페이지당 보여지는 최대의 갯수
	int blockSize = 10; //한 화면에 넘길 수 있는 페이지 수(총 1~10까지 나온다는 의미)
	
	int totalRecord = dao.getTotalRecord_search(search_option, search_data);//전체 레코드 갯수
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
	
	ArrayList<DepartmentDTO> list = new ArrayList<>();
	list = dao.selectAll();
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
	<h2>부서 목록</h2>
<div align="left" style="padding-left: 10%;">
<%if(search_data.trim().equals("")){ %>
	전체 부서목록 조회
<%}else{ %>
	검색어 <b style="color: #4A0084"><%=search_data %></b>로 검색된 목록 [<b style="color: #4A0084"><%=count %></b>]건

<%} %>
</div>
	<table id="table">
		<tr>
			<th>
				순번
			</th>
			<th>
				부서번호
			</th>
			<th>
				부서이름
			</th>
			<th>
				등록일
			</th>
		</tr>
<% for(int i = 0; i < list.size(); i++){ 
		DepartmentDTO dto = new DepartmentDTO();
		dto = list.get(i);
%>	
	<tr>
		<td><%=jj %></td>
		<td>
			<a href="../main/main.jsp?menu_gubun=department_view&department_id=<%=dto.getDepartment_id()%>">
				<b style="color: #4A0084"><%=dto.getDepartment_id() %></b>
			</a>
		</td>
		<td><%=dto.getDepartment_name() %></td>
		<td><%=dto.getRegi_date() %></td>
	</tr>	
<%
jj--;
}%>		
	</table>
	<table width = 80%>
		<tr>
			<td align="right">	
				|
				<a href="../main/main.jsp?menu_gubun=department_chuga">
					등록
				</a>
				|
			</td>
		</tr>
	<tr>
		<td>
			<form name="searchForm">
					<select name="search_option">
						<%if(search_option.equals("name")){%>
							<option value="" >-- 선택 -- </option>
							<option value="department_id" selected>부서번호</option>
							<option value="department_name" >부서이름</option>
							<option value="id_name" >부서번호+부서이름</option>
						<%}else if(search_option.equals("department_id")){%>	
							<option value="" >-- 선택 -- </option>
							<option value="department_id" >부서번호</option>
							<option value="department_name" selected>부서이름</option>
							<option value="id_name" >부서번호+부서이름</option>
						<%}else if(search_option.equals("name_department_id")){%>	
							<option value="" >-- 선택 -- </option>
							<option value="department_id" >부서번호</option>
							<option value="department_name" >부서이름</option>
							<option value="id_name" selected >이름+부서번호</option>
						<%}else{%>
							<option value=""  selected>-- 선택 -- </option>
							<option value="department_id" >부서번호</option>
							<option value="department_name" >부서이름</option>
							<option value="id_name"  >부서번호+부서이름</option>
						<%} %>
					</select>
					<input type="text" name="search_data" style="width: 80px;" value="<%=search_data%>">
					<button type="button" onclick="search();">검색</button>
				</form>
			</td>
		</tr>	
		<!-- 페이징관련 -->
<%	if(totalRecord > 0){%>	
	<tr>
		<td style="padding-top: 20px; text-align: center;">
			<a href="#" onclick="Gopage('department_list', '1', '<%=search_option%>', '<%=search_data%>');">[첫페이지]</a> &nbsp;
		
			<%if(startPage > blockSize){ //시작페이지가 10개의 블럭 사이즈보다 크다고 하면 작동%>
			<a href="#" onclick="Gopage('department_list', '<%=startPage - blockSize%>', '<%=search_option%>', '<%=search_data%>');">
			[이전10개]</a> &nbsp;
			<%}else{ %>
				[이전10개]&nbsp;
			<%} %>
			
			<%for(int i = startPage; i <= lastPage; i++){%>
				<%if(pageNumber == i){%>
					<b>[<%=i %>]</b> &nbsp;
				<%}else{ %>
					<a href="#" onclick="Gopage('department_list', '<%=i%>', '<%=search_option%>', '<%=search_data%>');">
					<%=i %>
					</a>&nbsp;
				<%} %>
			<%}%>

			<%if(lastPage < totalPage){ //시작페이지가 10개의 블럭 사이즈보다 크다고 하면 작동%>
			<a href="#" onclick="Gopage('department_list', '<%=startPage + blockSize%>', '<%=search_option%>', '<%=search_data%>');">[다음 10개]</a> &nbsp;
			<%}else{ %>
			[다음 10개] &nbsp;
			<%} %>
			<a href="#" onclick="Gopage('department_list', '<%=totalPage%>', '<%=search_option%>', '<%=search_data%>');">[끝 페이지]</a>
		</td>
	</tr>
<%} %>	
		<!-- 페이징 종료 -->
</table>
<script>
	function Gopage(value1, value2, value3, value4) {
		var url = "";
		url = url+ "../main/main.jsp";
		url = url+ "?menu_gubun="+value1;
		url = url+ "&pageNumber="+value2;
		url = url+ "&search_option="+value3;
		url = url+ "&search_data="+value4;	
		location.href = url;
		
	}
	
	function search() {
		if(confirm('검색하시겠습니까?')){
			searchForm.method = 'post';
			searchForm.action = '../employee/search.jsp';
			searchForm.submit();	
		}	
	}
	

</script>
