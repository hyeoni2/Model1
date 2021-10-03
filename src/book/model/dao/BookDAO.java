package book.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import book.model.dto.BookDTO;
import config.DB;
import member.model.dto.MemberDTO;
import sungjuk.model.dto.SungjukDTO;


public class BookDAO {

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
	public ArrayList<BookDTO> getSelectAll(String select) {
		
		ArrayList<BookDTO> arrayList = new ArrayList<>();
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {
			String sql = "select * from book";
			if(select == null) {
				select = "all_list";
			}
			if(select.equals("before")) {
				sql +=  " where con_del is null or con_del like 'N'";
				
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setBook_id(rs.getString("book_id"));
				dto.setTitle(rs.getString("title"));
				dto.setAuthor(rs.getString("author"));
				dto.setPublisher(rs.getString("publisher"));
				dto.setPublisher_date(rs.getDate("publisher_date"));
				dto.setInsert_date(rs.getDate("insert_date"));
				dto.setCon_del(rs.getString("con_del"));

				arrayList.add(dto);			
			}
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {			
			getConnClose();
		}
		return arrayList;
		
	}
	
	//검색 목록 + 페이징
	public ArrayList<BookDTO> getSelectAll_02(String select, String search_option, String search_data, int startRecord, int lastRecord) {
		
		ArrayList<BookDTO> arrayList = new ArrayList<>();
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {
			if(search_option == null || search_data == null) {
				search_option = "";
				search_data = "";
			}
			
			String basicSql = "select * from book where 1 = 1";
			
			if(select == null || select.trim().equals("")) {
				select = "n";
			}
			
			if(select.equals("n")) {
				basicSql +=  " and (con_del is null or con_del like 'n')";
			}
			
			if(search_option.equals("title") && !search_data.trim().equals("")) {
				basicSql += " and title like ?";
			}else if(search_option.equals("author")  && !search_data.trim().equals("")) {
				basicSql += " and author like ?";
			}else if(search_option.equals("title_author")  && !search_data.trim().equals("")) {
				basicSql += " and (title like ? or author like ?)";
			}
				
			
				
			String sql = "";
			sql += "select * from (select A.*, rownum rnum from (";
			sql += 	basicSql;
			sql += " ) A) where rnum >= ? and rnum <= ?";	

			System.out.println(sql);
			
			pstmt = conn.prepareStatement(sql);
			
			int k = 0;			
			if(search_option.equals("title") && !search_data.trim().equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("author")  && !search_data.trim().equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');			
			}else if(search_option.equals("title_author")  && !search_data.trim().equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');			
				pstmt.setString(++k, '%'+search_data+'%');							
			}
				pstmt.setInt(++k, startRecord);
				pstmt.setInt(++k, lastRecord);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setBook_id(rs.getString("book_id"));
				dto.setTitle(rs.getString("title"));
				dto.setAuthor(rs.getString("author"));
				dto.setPublisher(rs.getString("publisher"));
				dto.setPublisher_date(rs.getDate("publisher_date"));
				dto.setInsert_date(rs.getDate("insert_date"));
				dto.setCon_del(rs.getString("con_del"));
				
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
			String sql = "select count(*) from book";
		
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
	
	//전체레코드+검색레코드
	public int getTotalRecord_02(String select, String search_option, String search_data) {
		
		int result = 0;
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {
			if(search_option == null || search_data == null) {
				search_option = "";
				search_data = "";
			}
			
			String sql = "select count(*) from book where 1 = 1";
			
			if(select == null || select.trim().equals("")) {
				select = "n";
			}
			
			if(select.equals("n")) {
				sql +=  " and (con_del is null or con_del like 'N')";
			}
			
			if(search_option.equals("title") && !search_data.trim().equals("")) {
				sql += " and title like ?";
			}else if(search_option.equals("author")  && !search_data.trim().equals("")) {
				sql += " and author like ?";
			}else if(search_option.equals("title_author")  && !search_data.trim().equals("")) {
				sql += " and (title like ? or author like ?)";
			}
			
			pstmt = conn.prepareStatement(sql);
			int k = 0;
			if(search_option.equals("title") && !search_data.trim().equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("author")  && !search_data.trim().equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');			
			}else if(search_option.equals("title_author")  && !search_data.trim().equals("")) {
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
	public BookDTO getSelectOne(BookDTO dto) {
		
		getConn();
		try {
			String sql = "select * from book where book_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getBook_id());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setBook_id(rs.getString("book_id"));
				dto.setTitle(rs.getString("title"));
				dto.setAuthor(rs.getString("author"));
				dto.setPublisher(rs.getString("publisher"));
				dto.setBook_rev(rs.getString("book_rev"));
				dto.setPublisher_date(rs.getDate("publisher_date"));
				dto.setInsert_date(rs.getDate("insert_date"));
		}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {			
				getConnClose();
		}
		return dto;
		
	}
	
	
	//등록
	public int setInsert(BookDTO dto) {
		  int result = 0;
		  getConn(); 
		 	try {
				String sql = "insert into book values(?, ?, ?, ?, ?, sysdate, '', '')";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getBook_id());
				pstmt.setString(2, dto.getTitle());
				pstmt.setString(3, dto.getAuthor());
				pstmt.setString(4, dto.getPublisher());
				pstmt.setDate(5, dto.getPublisher_date());
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
	public int setUpdate(BookDTO dto) {
		 	
		int result = 0;
			getConn(); 
		 	try {
				String sql = "update book set title = ?, author = ?, book_rev = ?, publisher = ?, publisher_date = ?  where book_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getTitle());
				pstmt.setString(2, dto.getAuthor());
				pstmt.setString(3, dto.getBook_rev());
				pstmt.setString(4, dto.getPublisher());
				pstmt.setDate(5, dto.getPublisher_date());
				pstmt.setString(6, dto.getBook_id());
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
	public int delete(BookDTO dto) {
		 	int result = 0;
			getConn(); 
		 	try {
		 		String sql = "update book set con_del = ?  where book_id = ?";
				
		 		pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getCon_del());
				pstmt.setString(2, dto.getBook_id());
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
