package sungjuk.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import sungjuk.model.dto.SungjukDTO;

public class SungjukDAO {

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
	public ArrayList<SungjukDTO> getSelectAll() {
		
		ArrayList<SungjukDTO> arrayList = new ArrayList<>();
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {
			String sql = "select * from sungjuk";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
			
				SungjukDTO dto = new SungjukDTO();
				
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSihum_name(rs.getString("sihum_name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setSci(rs.getInt("sci"));
				dto.setHis(rs.getInt("his"));
				dto.setTot(rs.getInt("tot"));
				dto.setAvg(rs.getDouble("avg"));			
				dto.setGrade(rs.getString("grade"));
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
	
	//검색목록 + 페이징
	public ArrayList<SungjukDTO> getSelectAll_02(String search_option, String search_data, int startRecord, int lastRecord) {
		
		ArrayList<SungjukDTO> arrayList = new ArrayList<>();
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {
			if(search_option == null || search_data == null) {
				search_option = "";
				search_data = "";
			}
			String basicSql = "select * from sungjuk where 1 = 1";
			
			if(search_option.equals("name") && !search_data.trim().equals("")){
				basicSql += " and name like ?";
			}else if(search_option.equals("sihum_name") && !search_data.trim().equals("")){
				basicSql += " and sihum_name like ?";
			}else if((search_option.equals("name") || search_option.equals("sihum_name")) && !search_data.trim().equals("")){
				basicSql += " and (name like ? or sihum_name like ?)";	
			}
			basicSql += " order by no desc";
				

			String sql = "";
			sql += "select * from (select A.*, rownum rnum from ( ";
			sql += basicSql;
			sql += ") A) where rnum >= ? and rnum <= ?";		
			
			pstmt = conn.prepareStatement(sql);
			
			int k = 0;
			if(search_option.equals("name") && !search_data.trim().equals("")){
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("sihum_name") && !search_data.trim().equals("")){
				pstmt.setString(++k, '%'+search_data+'%');					
			}else if((search_option.equals("name") || search_option.equals("sihum_name")) && !search_data.trim().equals("")){
				pstmt.setString(++k, '%'+search_data+'%');					
				pstmt.setString(++k, '%'+search_data+'%');										
			}
				pstmt.setInt(++k, startRecord );
				pstmt.setInt(++k, lastRecord );
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				SungjukDTO dto = new SungjukDTO();
				
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSihum_name(rs.getString("sihum_name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setSci(rs.getInt("sci"));
				dto.setHis(rs.getInt("his"));
				dto.setTot(rs.getInt("tot"));
				dto.setAvg(rs.getDouble("avg"));			
				dto.setGrade(rs.getString("grade"));
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
	
	//전체 레코드
	public int getTotalRecord() {
		int result = 0;
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {
			String sql = "select count(*) from sungjuk";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {			
			getConnClose();
		}
		return result;
		
	}
	
	//전체 레코드+검색된 레코드
	public int getTotalRecord_02(String search_option, String search_data) {
		int result = 0;
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {
			
			if(search_option == null || search_data == null) {
				search_option = "";
				search_data = "";
			}
			
			String sql = "select count(*) from sungjuk where 1 = 1";
			
			if(search_option.equals("name") && !search_data.trim().equals("")){
				sql += " and name like ?";
			}else if(search_option.equals("sihum_name") && !search_data.trim().equals("")){
				sql += " and sihum_name like ?";
			}else if((search_option.equals("name") || search_option.equals("sihum_name")) && !search_data.trim().equals("")){
				sql += " and (name like ? or sihum_name like ?)";	
			}
			
			pstmt = conn.prepareStatement(sql);
			
			int k = 0;
			if(search_option.equals("name") && !search_data.trim().equals("")){
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("sihum_name") && !search_data.trim().equals("")){
				pstmt.setString(++k, '%'+search_data+'%');					
			}else if((search_option.equals("name") || search_option.equals("sihum_name")) && !search_data.trim().equals("")){
				pstmt.setString(++k, '%'+search_data+'%');					
				pstmt.setString(++k, '%'+search_data+'%');										
			}
			rs = pstmt.executeQuery();
			
			if(rs.next()){
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
	public SungjukDTO getSelectOne(SungjukDTO dto) {
		
		getConn();
		try {
			String sql = "select * from sungjuk where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNo());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSihum_name(rs.getString("sihum_name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setSci(rs.getInt("sci"));
				dto.setHis(rs.getInt("his"));
				dto.setTot(rs.getInt("tot"));
				dto.setAvg(rs.getDouble("avg"));
				dto.setGrade(rs.getString("grade"));
				dto.setRegi_date(rs.getDate("regi_date"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {			
				getConnClose();
			}
		return dto;
		
	}
	
	//등록
	public int setInsert(SungjukDTO dto) {
		  int result = 0;
		  getConn(); 
		 	try {
		 		String sql = "insert into sungjuk values(seq_sungjuk.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, ?)";
		 		pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,dto.getName());
				pstmt.setString(2, dto.getSihum_name());
				pstmt.setInt(3, dto.getKor());
				pstmt.setInt(4, dto.getEng());
				pstmt.setInt(5, dto.getMat());
				pstmt.setInt(6, dto.getSci());
				pstmt.setInt(7, dto.getHis());
				pstmt.setInt(8, dto.getTot());
				pstmt.setDouble(9, dto.getAvg());
				pstmt.setString(10, dto.getGrade());
				pstmt.setString(11, dto.getId());
				result = pstmt.executeUpdate();
		 	} 	
		  catch (Exception e) { 
		  e.printStackTrace(); 
		  }finally {			
				getConnClose();
			}
		   return result;
	}
	
	//수정
	public int setUpdate(SungjukDTO dto) {
		 	
		int result = 0;
			getConn(); 
		 	try {
		 		String sql = "update sungjuk set sihum_name = ?, kor = ?, eng = ?, mat = ?, sci = ?, his = ?, tot = ?, avg = ?, grade = ?, regi_date = sysdate where no = ? ";
		 		pstmt = conn.prepareStatement(sql);
		 		pstmt.setString(1, dto.getSihum_name());
		 		pstmt.setInt(2, dto.getKor());
		 		pstmt.setInt(3, dto.getEng());
		 		pstmt.setInt(4, dto.getMat());
		 		pstmt.setInt(5, dto.getSci());
		 		pstmt.setInt(6, dto.getHis());
		 		pstmt.setInt(7, dto.getTot());
		 		pstmt.setDouble(8, dto.getAvg());
		 		pstmt.setString(9, dto.getGrade());		 		
		 		pstmt.setInt(10, dto.getNo());
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
	public int delete(SungjukDTO dto) {
		 	int result = 0;
			getConn(); 
		 	try {
		 		String sql = "delete from sungjuk where no = ?";
		 		pstmt = conn.prepareStatement(sql);
		 		pstmt.setInt(1, dto.getNo());
		 		
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
