package department.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import department.model.dto.DepartmentDTO;

public class DepartmentDAO {

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
	
	//리스트
	public ArrayList<DepartmentDTO> selectAll() {
		 ArrayList<DepartmentDTO> list = new ArrayList<>();
		getConn();
		try {
			String sql = "select * from department";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DepartmentDTO dto = new DepartmentDTO();
				dto.setDepartment_id(rs.getInt("department_id"));
				dto.setDepartment_name(rs.getString("department_name"));
				dto.setRegi_date(rs.getDate("regi_date"));
				list.add(dto);
			}
			
				System.out.println(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return list;
	}
	
	//리스트 + 검색 + 페이징
	public ArrayList<DepartmentDTO> selectAll_search(String search_option, String search_data,  int startRecord, int lastRecord) {
		ArrayList<DepartmentDTO> list = new ArrayList<>();
		getConn();
		try {
			
			String basicSql = "select * from department where 1 = 1";
			//검색 관련 sql 문장
			if(search_option.equals("department_id") && !search_data.equals("")) {
				basicSql += " and department_id like ?";
			}else if(search_option.equals("department_name") && !search_data.equals("")) {
				basicSql += " and department_name = ?";
			}else if(search_option.equals("id_name") && !search_data.equals("")) {
				basicSql += " and (department_id like ? or department_name = ?)";
			}
				basicSql += " order by department_id desc";
			
			String sql = "";
			sql += "select * from (select A.*, rownum rnum from (";
			sql += 	basicSql;
			sql += " ) A) where rnum >= ? and rnum <= ?";	
			pstmt = conn.prepareStatement(sql);
			
			//검색 관련 ? 채우는 문장
			int k = 0;
			if(search_option.equals("department_id") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("department_name") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("id_name") && !search_data.equals("")) {
				pstmt.setString(++k, '%'+search_data+'%');
				pstmt.setString(++k, '%'+search_data+'%');					
			}
				pstmt.setInt(++k, startRecord);
				pstmt.setInt(++k, lastRecord);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				DepartmentDTO dto = new DepartmentDTO();
				dto.setDepartment_id(rs.getInt("department_id"));
				dto.setDepartment_name(rs.getString("department_name"));
				dto.setRegi_date(rs.getDate("regi_date"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return list;
	}
	
	
	//순번 카운트
	public int getTotalRecord_search(String search_option, String search_data) {
		int result = 0;
		getConn();
		try {
			String sql = "select count(*) from department";
			
			//검색 관련 sql 문장
			if(search_option.equals("department_id") && !search_data.equals("")) {
				sql += " and department_id like ?";
			}else if(search_option.equals("department_name") && !search_data.equals("")) {
				sql += " and department_name = ?";
			}else if(search_option.equals("id_name") && !search_data.equals("")) {
				sql += " and (department_id like ? or department_name = ?)";
			}
			
			pstmt = conn.prepareStatement(sql);
			
			//검색 관련 ? 채우는 문장
			if(search_option.equals("department_id") && !search_data.equals("")) {
				pstmt.setString(1, '%'+search_data+'%');
			}else if(search_option.equals("department_name") && !search_data.equals("")) {
				pstmt.setString(1, '%'+search_data+'%');
			}else if(search_option.equals("id_name") && !search_data.equals("")) {
				pstmt.setString(1, '%'+search_data+'%');
				pstmt.setString(2, '%'+search_data+'%');					
			}
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
	}
	
	//뷰
	public DepartmentDTO selectOne(DepartmentDTO dto) {
		getConn();
		try {
			String sql = "select * from department where department_id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getDepartment_id());

			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				dto.setDepartment_id(rs.getInt("department_id"));
				dto.setDepartment_name(rs.getString("department_name"));
				dto.setRegi_date(rs.getDate("regi_date"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return dto;
	}
	
	//추가
	public int setInsert(DepartmentDTO dto) {
		int result = 0;
			getConn();
		try {
			String sql = "insert into department values( ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getDepartment_id());
			pstmt.setString(2, dto.getDepartment_name());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
	}
	
	//수정
	public int setUpdate(DepartmentDTO dto) {
		int result = 0;
		getConn();
		try {
			String sql = "update department set department_name = ? where department_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getDepartment_name());
			pstmt.setInt(2, dto.getDepartment_id());
			
			result = pstmt.executeUpdate();
						
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
	}
	
	//삭제
	public int delete(DepartmentDTO dto) {
		int result = 0;
		getConn();
		try {
			String sql = "delete department where department_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getDepartment_id());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			getConnClose();
		}
		return result;
	}
}
