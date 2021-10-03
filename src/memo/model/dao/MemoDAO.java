package memo.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import memo.model.dto.MemoDTO;

public class MemoDAO {

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
	public ArrayList<MemoDTO> getSelectAll() {
		
		ArrayList<MemoDTO> arrayList = new ArrayList<>();
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {
			String sql = "select * from memo";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
			
				MemoDTO dto = new MemoDTO();
				
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
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
	public ArrayList<MemoDTO> getSelectAll_02(String search_option, String search_data, int startRecord, int lastRecord) {
		
		ArrayList<MemoDTO> arrayList = new ArrayList<>();
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {
			if(search_option == null || search_data == null) {
				search_option = "";
				search_data = "";
			}
			
			String basicSql = "select * from memo where 1 = 1";
			if(search_option.equals("writer") && !search_data.equals("")) {
				basicSql += " and writer like ?";				
			}else if(search_option.equals("content") && !search_data.equals("")) {
				basicSql += " and content like ?";								
			}else if(search_option.equals("writer_content") && !search_data.equals("")) {
				basicSql += " and (writer like ? or content like ?)";								
			}
				basicSql += "order by no desc";
				
			String sql = "";
			sql += "select * from (select A.*, rownum rnum from ( ";
			sql += basicSql;
			sql += ") A) where rnum >= ? and rnum <= ?";		
			
			pstmt = conn.prepareStatement(sql);
			
			int k = 0;
			if(search_option.equals("writer") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');				
			}else if(search_option.equals("content") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');												
			}else if(search_option.equals("writer_content") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');												
				pstmt.setString(++k, '%'+search_data+'%');																						
			}
				pstmt.setInt(++k, startRecord);
				pstmt.setInt(++k, lastRecord);
				
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				MemoDTO dto = new MemoDTO();
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
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
	
	//전체레코드
	public int getTotalRecord() {
		int result = 0;
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {			
			String sql = "select count(*) from memo";
			
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
	//전체레코드+검색된 레코드
	public int getTotalRecord_02(String search_option , String search_data) {
		int result = 0;
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {			
			if(search_option == null || search_data == null) {
				search_option = "";
				search_data = "";
			}
			String sql = "select count(*) from memo where 1 = 1";
			
			if(search_option.equals("writer") && !search_data.equals("")) {
				sql += " and writer like ?";				
			}else if(search_option.equals("content") && !search_data.equals("")) {
				sql += " and content like ?";								
			}else if(search_option.equals("writer_content") && !search_data.equals("")) {
				sql += " and (writer like ? or content like ?)";								
			}
			
			pstmt = conn.prepareStatement(sql);
			
			int k = 0;
			if(search_option.equals("writer") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');				
			}else if(search_option.equals("content") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');												
			}else if(search_option.equals("writer_content") && !search_data.equals("")) {
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
	public MemoDTO getSelectOne(MemoDTO dto) {
		
		getConn();
		try {
			String sql = "select * from memo where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNo());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setWriter(rs.getString("writer"));
				dto.setContent(rs.getString("content"));
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
	public int setInsert(MemoDTO dto) {
		  int result = 0;
		  getConn(); 
		 	try {
		 		String sql = "insert into memo values(seq_memo.nextval, ?, ?, sysdate)";
		 		pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,dto.getWriter());
				pstmt.setString(2, dto.getContent());
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
	public int setUpdate(MemoDTO dto) {
		 	
		int result = 0;
			getConn(); 
		 	try {
		 		String sql = "update memo set writer = ? , content = ? where no = ? ";
		 		pstmt = conn.prepareStatement(sql);
		 		pstmt.setString(1, dto.getWriter());
		 		pstmt.setString(2, dto.getContent()); 		
		 		pstmt.setInt(3, dto.getNo());
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
	public int delete(MemoDTO dto) {
		 	int result = 0;
			getConn(); 
		 	try {
		 		String sql = "delete from memo where no = ?";
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
