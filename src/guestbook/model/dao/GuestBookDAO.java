package guestbook.model.dao;

import java.sql.*;
import java.util.ArrayList;

import config.DB;
import guestbook.model.dto.GuestBookDTO;

public class GuestBookDAO {
	
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
	
	
	public  ArrayList<GuestBookDTO> getSelectAll(String search_option, String search_data) {
		ArrayList<GuestBookDTO> arraylist = new ArrayList<>();
		getConn();		
		try {
			if(search_option == null || search_data == null || search_option.trim().equals("") || search_data.trim().equals("")) {
				search_data = "";
				search_option = "";
			}
			
			String sql = "";
				sql += "select * from guestbook where 1 = 1";
				if(search_option.equals("name") && !search_data.trim().equals("")) {
					sql += " and name like ?";
				}else if(search_option.equals("content")  && !search_data.trim().equals("")) {
					sql += " and content like ?";
				}else if(search_option.equals("name_content")  && !search_data.trim().equals("")) {
					sql += " and (name like ? or content like ?)";
				}
				sql += " order by no desc";
			
	
			
			
			pstmt = conn.prepareStatement(sql);
			
			if(search_option.equals("name") && !search_data.trim().equals("")) {
				pstmt.setString(1, '%'+search_data+'%');
			}else if(search_option.equals("content")  && !search_data.trim().equals("")) {
				pstmt.setString(1, '%'+search_data+'%');
			}else if(search_option.equals("name_content")  && !search_data.trim().equals("")) {
				pstmt.setString(1, '%'+search_data+'%');
				pstmt.setString(2, '%'+search_data+'%');
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GuestBookDTO dto = new GuestBookDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setContent(rs.getString("content"));
				dto.setRegi_date(rs.getDate("regi_date"));
				arraylist.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		
		return arraylist;
	}
	
	//????
	public  ArrayList<GuestBookDTO> getSelectAll_02(String search_option, String search_data, int startRecord, int lastRecord) {
		ArrayList<GuestBookDTO> arraylist = new ArrayList<>();
		getConn();		
		try {
			if(search_option == null || search_data == null || search_option.trim().equals("") || search_data.trim().equals("")) {
				search_data = "";
				search_option = "";
			}
			
			
			String basicSql = "";
			basicSql += "select * from guestbook where 1 = 1";
			if(search_option.equals("name") && !search_data.trim().equals("")) {
				basicSql += " and name like ?";
			}else if(search_option.equals("content")  && !search_data.trim().equals("")) {
				basicSql += " and content like ?";
			}else if(search_option.equals("name_content")  && !search_data.trim().equals("")) {
				basicSql += " and (name like ? or content like ?)";
			}
				basicSql += " order by no desc";
				
				
			String sql = "";
			sql += "select * from (select A.*, rownum rnum from (";
			sql += 	basicSql;
			sql += " ) A) where rnum >= ? and rnum <= ?";	

			pstmt = conn.prepareStatement(sql);
			
			int k = 0;
			if(search_option.equals("name") && !search_data.trim().equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("content")  && !search_data.trim().equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("name_content")  && !search_data.trim().equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
				pstmt.setString(++k, '%'+search_data+'%');
			}
			
				pstmt.setInt(++k, startRecord);
				pstmt.setInt(++k, lastRecord);
			
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				GuestBookDTO dto = new GuestBookDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setContent(rs.getString("content"));
				dto.setRegi_date(rs.getDate("regi_date"));
				arraylist.add(dto);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		
		return arraylist;
	}
	
	//레코드 갯수
	public int getTotalRecord() {
		int result = 0;
		getConn();
		try {
			String sql = "select count(*) from guestbook";
		
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);//count(*)의 순서를 지칭
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		
		return result;
	}
	
	//레코드 갯수??????
	public int getTotalRecord_02(String search_option, String search_data) {
		int result = 0;
		getConn();
		try {
			
			String sql = "select count(*) from guestbook where 1 = 1";
			
			if(search_option.equals("name") && !search_data.trim().equals("")) {
				sql += " and name like ?";
			}else if(search_option.equals("content")  && !search_data.trim().equals("")) {
				sql += " and content like ?";
			}else if(search_option.equals("name_content")  && !search_data.trim().equals("")) {
				sql += " and (name like ? or content like ?)";
			}
		
			pstmt = conn.prepareStatement(sql);
			
			int k = 0;
			if(search_option.equals("name") && !search_data.trim().equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("content")  && !search_data.trim().equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("name_content")  && !search_data.trim().equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
				pstmt.setString(++k, '%'+search_data+'%');
			}			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);//count(*)의 순서를 지칭
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		
		return result;
	}
	
	//뷰
	public GuestBookDTO getSelectOne(GuestBookDTO dto) {
		getConn();
		try {
			String sql = "select * from guestbook where no =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNo());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPasswd(rs.getString("passwd"));
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
	
	public int setInsert(GuestBookDTO dto) {
		getConn();
		int result = 0;
		
		try {
			String sql = "insert into guestbook values(seq_guestbook.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getPasswd());
			pstmt.setString(4, dto.getContent());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		
		return result;
	}
	
	public int setUpdate(GuestBookDTO dto) {
		getConn();
		int result = 0;
		
		try {
			String sql = "update guestbook set name = ?, email = ?, content = ? where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getNo());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		
		return result;
	}
	
	public int delete(GuestBookDTO dto) {
		getConn();
		int result = 0;
		
		try {
			String sql = "delete from guestbook where no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getNo());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		
		return result;
	}
}
