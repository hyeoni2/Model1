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
	
	MemberDTO dto = new MemberDTO();
	dto.setNo(no);
	
	MemberDAO dao = new MemberDAO();
	dto = dao.getSelectOne(dto);
	
	/* 권한 관련 */
	String cookId = (String)session.getAttribute("cookId");
	
	String chugaId = "chuga";
	String sujungId = "sujung";
	String sakjaeId = "sakjae";
	String adminId = "admin";
	
	System.out.println("list : "+cookId);
	
	if(!(cookId.equals(sujungId) || cookId.equals(adminId) || cookId.equals(dto.getId()))){
		out.println("<script>");
		out.println("alert('접근할 수 있는 권한이 없습니다.');");
		out.println("location.href = '/jsp_mvc1'");
		out.println("</script>");
	}
	
	/* 권한 관련 종료 */

%>

			<!-- 본문 내용 시작  -->
			<h2>회원수정</h2>
<form name="sujungForm">
<input type="hidden" name="no" value="<%=no%>">
<table>
	<tr>
		<td>아이디 : </td>
		<td>
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
			<input type="text" name="phone1" style="width: 40px;" value="<%=dto.getPhone1()%>">-
			<input type="text" name="phone2" style="width: 40px;"value="<%=dto.getPhone2()%>">-
			<input type="text" name="phone3" style="width: 40px;"value="<%=dto.getPhone3()%>">
		</td>
	</tr>
		<tr>
		<td>이메일 : </td>
		<td>
			<input type="text" name="email" value="<%=dto.getEmail()%>">
		</td>
	</tr>
	<tr>
		<td rowspan="3">주소 : </td>
		<td>
			<input type="text" id="sample6_postcode" placeholder="우편번호" name="sample6_postcode" value="<%=dto.getJuso1()%>">
			<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
		</td>
	</tr>	
	<tr>
		<td>
			<input type="text" id="sample6_address" placeholder="주소" name="sample6_address" value="<%=dto.getJuso2()%>">
		</td>
	</tr>
	<tr>
		<td>	
			<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="sample6_detailAddress" value="<%=dto.getJuso3()%>">
			<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="sample6_extraAddress" value="<%=dto.getJuso4()%>">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onclick="sujung();">수정하기</button>
			<button type="button" onclick="list();">목록으로</button>
		</td>
	</tr>	
</table>
</form>
			
			<!-- 본문 내용 종료  -->



<script type="text/javascript">
	function list() {
		location.href = '../main/main.jsp?menu_gubun=member_list';
	}

	function sujung() {
		
		
		if(confirm('수정하시겠습니까?')){
			sujungForm.method = 'post';
			sujungForm.action =  '../member/sujungProc.jsp';
			sujungForm.submit();
		}
		
	}
</script>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</body>
</html>