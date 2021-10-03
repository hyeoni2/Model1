package member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import config.DB;
import member.model.dto.MemberDTO;
import sungjuk.model.dto.SungjukDTO;


public class MemberDAO {

	//---------------------------공통 부분 시작--------------------------------------
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public void getConn() {
		try {
			conn = DB.dbConn();
			System.out.println("-- 오라클 접속 성공 --");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("-- 오라클 접속 실패 --");		
		}
	}
	
	public void getConnClose() {
		DB.dbConnClose(rs, pstmt, conn);
	}  
	

	//---------------------------공통 부분 종료--------------------------------------
	
	/* 껍데기
	  getConn(); 
	 	try {
	  } 
	  catch (Exception e) { 
	  e.printStackTrace(); 
	  }finally {			
			getConnClose();
		}
	 */
	
	//실행단에서 줄이는게 목적 : 오류가 나기 쉬움을 방지
	
	
	
	//목록
	public ArrayList<MemberDTO> getSelectAll(String search_option, String search_data) {
		
		ArrayList<MemberDTO> arrayList = new ArrayList<>();
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {
			
			String sql = "select no, id, name, (phone1 || '-' || phone2 || '-' || phone3) phone, regi_date from member where 1 = 1";
			
			if(search_option == null || search_data.equals("")) {
				search_option = "";
				search_data = "";
			}
			
			if(search_option.equals("id") && !search_data.equals("")) {
				sql += " and id like ?";
			}else if(search_option.equals("name") && !search_data.equals("")) {
				sql += " and name like ?";
			}else if(search_option.equals("id_name") && !search_data.equals("")) {
				sql += " and (id like ? or name like ?)";
			}
				sql += " order by no desc";
				
			pstmt = conn.prepareStatement(sql);
			
			int k = 0;
			if(search_option.equals("id") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("name") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("id_name") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
				pstmt.setString(++k, '%'+search_data+'%');
			}	
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberDTO dto = new MemberDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setRegi_date(rs.getDate("regi_date"));
				
				arrayList.add(dto);			
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {			
			getConnClose();
		}
		return arrayList;
		
	}
	
	//??
	public ArrayList<MemberDTO> getSelectAll_02(String search_option, String search_data, int startRecord, int lastRecord) {
		
		ArrayList<MemberDTO> arrayList = new ArrayList<>();
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {
			
			String basicSql = "select no, id, name, (phone1 || '-' || phone2 || '-' || phone3) phone, regi_date from member where 1 = 1";
			
			if(search_option == null || search_data.equals("")) {
				search_option = "";
				search_data = "";
			}
			
			if(search_option.equals("id") && !search_data.equals("")) {
				basicSql += " and id like ?";
			}else if(search_option.equals("name") && !search_data.equals("")) {
				basicSql += " and name like ?";
			}else if(search_option.equals("id_name") && !search_data.equals("")) {
				basicSql += " and (id like ? or name like ?)";
			}
				basicSql += " order by no desc";
			
			String sql = "";
			sql += "select * from (select A.*, rownum rnum from ( ";
			sql += basicSql;
			sql += ") A) where rnum >= ? and rnum <= ?";			
			
			pstmt = conn.prepareStatement(sql);
			
			int k = 0;
			if(search_option.equals("id") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("name") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("id_name") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
				pstmt.setString(++k, '%'+search_data+'%');
			}
				pstmt.setInt(++k, startRecord);
				pstmt.setInt(++k, lastRecord);		
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberDTO dto = new MemberDTO();
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone(rs.getString("phone"));
				dto.setRegi_date(rs.getDate("regi_date"));
				
				arrayList.add(dto);			
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {			
			getConnClose();
		}
		return arrayList;
		
	}
	public int getTotalRecord() {
		int result = 0;
		getConn();
		try {
			
			String sql = "select count(*) from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
		}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {			
				getConnClose();
		}
		return result;
	}

	//?????
	public int getTotalRecord_02(String search_option, String search_data) {
		int result = 0;
		getConn();
		try {
			if(search_option == null || search_data == null) {
				search_option  = "";
				search_data = "";
			}
			
			String sql = "select count(*) from member where 1 = 1";
			
			if(search_option.equals("id") && !search_data.equals("")) {
				sql += " and id like ?";
			}else if(search_option.equals("name") && !search_data.equals("")) {
				sql += " and name like ?";
			}else if(search_option.equals("id_name") && !search_data.equals("")) {
				sql += " and (id like ? or name like ?)";
			}
				
			pstmt = conn.prepareStatement(sql);
			
			int k = 0;
			if(search_option.equals("id") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("name") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("id_name") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
				pstmt.setString(++k, '%'+search_data+'%');
			}	
			rs = pstmt.executeQuery();
			if (rs.next()) {
				result = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {			
			getConnClose();
		}
		return result;
	}
	
	//뷰
	public MemberDTO getSelectOne(MemberDTO dto) {
		
		getConn();
		try {
			
			String sql = "select * from member where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNo());
			rs = pstmt.executeQuery();
			if (rs.next()) {

				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPhone1(rs.getString("phone1"));
				dto.setPhone2(rs.getString("phone2"));
				dto.setPhone3(rs.getString("phone3"));
				dto.setEmail(rs.getString("email"));
				dto.setJuso1(rs.getString("juso1"));
				dto.setJuso2(rs.getString("juso2"));
				dto.setJuso3(rs.getString("juso3"));
				dto.setJuso4(rs.getString("juso4"));
				dto.setRegi_date(rs.getDate("regi_date"));
		}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {			
				getConnClose();
		}
		return dto;
		
	}
	
	
	//등록
	public int setInsert(MemberDTO dto) {
		  int result = 0;
		  getConn(); 
		 	try {
		 		String sql = "insert into member values(seq_member.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,sysdate)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPasswd());
				pstmt.setString(3, dto.getName());
				pstmt.setString(4, dto.getPhone1());
				pstmt.setString(5, dto.getPhone2());
				pstmt.setString(6, dto.getPhone3());
				pstmt.setString(7, dto.getEmail());
				pstmt.setString(8, dto.getJuso1());
				pstmt.setString(9, dto.getJuso2());
				pstmt.setString(10, dto.getJuso3());
				pstmt.setString(11, dto.getJuso4());
				result = pstmt.executeUpdate();
		 	
		 	} 	
		  catch (Exception e) { 
		  e.printStackTrace(); 
		  }finally {			
				getConnClose();
			}
		   return result;
	}
	
	
	//로그인
	public MemberDTO setLogin(MemberDTO dto) {
		MemberDTO dto2 = new MemberDTO();
		getConn(); 
		try {
			String sql = "select no, id, name from member where id = ? and passwd = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto2.setNo(rs.getInt("no"));
				dto2.setId(rs.getString("id"));
				dto2.setName(rs.getString("name"));
			}
			
		} 	
		
		catch (Exception e) { 
			e.printStackTrace(); 
		}finally {			
			getConnClose();
		}
		return dto2;
	}
	
	//수정
	public int setUpdate(MemberDTO dto) {
		 	
		int result = 0;
			getConn(); 
		 	try {
		 		String sql = "";
				sql += " update member set ";
				sql += " phone1 = ?, phone2 = ?, phone3 = ?, ";
				sql += " email = ?, ";
				sql += " juso1 = ?, juso2 = ?, juso3 =?, juso4 = ? ";
				sql += " where no = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getPhone1());
				pstmt.setString(2, dto.getPhone2());
				pstmt.setString(3, dto.getPhone3());
				pstmt.setString(4, dto.getEmail());
				pstmt.setString(5, dto.getJuso1());
				pstmt.setString(6, dto.getJuso2());
				pstmt.setString(7, dto.getJuso3());
				pstmt.setString(8, dto.getJuso4());
				pstmt.setInt(9, dto.getNo());

				result = pstmt.executeUpdate();
				
		 	} 
		  catch (Exception e) { 
		  e.printStackTrace(); 
		  }finally {
			 getConnClose();
			
		}
		   return result;
	}
	
	//삭제
	public int delete(MemberDTO dto) {
		 	int result = 0;
			getConn(); 
		 	try {
		 		String sql = "delete from sungjuk where id = ?";
		 		pstmt = conn.prepareStatement(sql);
		 		pstmt.setString(1, dto.getId());
		 		result = pstmt.executeUpdate();

		 		sql = "delete from member where id = ?";
		 		pstmt = conn.prepareStatement(sql);
		 		pstmt.setString(1, dto.getId());
		 		
		 		result = pstmt.executeUpdate();
		  } 
		  catch (Exception e) { 
		  e.printStackTrace(); 
		  }finally {			
				getConnClose();
			}
		 	return result;
	}
	
	
	
	
}
