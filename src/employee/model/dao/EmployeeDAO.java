package employee.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import employee.model.dto.EmployeeDTO;

public class EmployeeDAO {
	
	
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

		
		//추가
		public int setInsert(EmployeeDTO dto) {
			
			int result = 0;
			getConn();

			try {
					String sql  = "";
					 		sql += "insert into employee values(seq_employee.nextval, ?, ?, ?, ?, ?, ?, sysdate)";
					
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, dto.getName());
					pstmt.setString(2, dto.getEmail());
					pstmt.setString(3, dto.getPhone());
					pstmt.setDate(4, dto.getHire_date());
					pstmt.setInt(5, dto.getSalary());
					pstmt.setInt(6, dto.getDepartment_id());
					
					result = pstmt.executeUpdate();
				
			
			}catch (Exception e) {
				
				e.printStackTrace();
				
			}finally {
				getConnClose();	
			}		
			return result;
		}
			
		//전체보기
		public ArrayList<EmployeeDTO> selectAll() {
				ArrayList<EmployeeDTO> list = new ArrayList<>();
				getConn();
	
				try {
						String sql  = "select * from employee";					
						
						pstmt = conn.prepareStatement(sql);
						
						rs = pstmt.executeQuery();
					
					while(rs.next()) {
						EmployeeDTO dto = new EmployeeDTO();
						dto.setEmployee_id(rs.getInt("employee_id"));
						dto.setName(rs.getString("name"));
						dto.setEmail(rs.getString("email"));
						dto.setPhone(rs.getString("phone"));
						dto.setHire_date(rs.getDate("hire_date"));
						dto.setSalary(rs.getInt("salary"));
						dto.setDepartment_id(rs.getInt("department_id"));
						dto.setRegi_date(rs.getDate("regi_date"));
						list.add(dto);
					}
					

				}catch (Exception e) {
					
					e.printStackTrace();
					
				}finally {
					getConnClose();	
				}		
				return list;
			}
		
		//전체보기 + 검색 추가
		public ArrayList<EmployeeDTO> selectAll_search(String search_option ,String search_data) {
			ArrayList<EmployeeDTO> list = new ArrayList<>();
			getConn();
			
			try {
				
					if(search_option == null || search_data == null) {
						search_option = ""; 
						search_data = "";
					}
	
					String sql  = "select * from  employee";	
					
					//검색 관련 sql 문장
					if(search_option.equals("name") && !search_data.equals("")) {
						sql += " and name like ?";
					}else if(search_option.equals("department_id") && !search_data.equals("")) {
						sql += " and department_id = ?";
					}else if(search_option.equals("name_department_id") && !search_data.equals("")) {
						sql += " and (name like ? or department_id = ?)";
					}
					
					pstmt = conn.prepareStatement(sql);
					
					//검색 관련 ? 채우는 문장
					if(search_option.equals("name") && !search_data.equals("")) {
						pstmt.setString(1, '%'+search_data+'%');
					}else if(search_option.equals("department_id") && !search_data.equals("")) {
						pstmt.setString(1, '%'+search_data+'%');
					}else if(search_option.equals("name_department_id") && !search_data.equals("")) {
						pstmt.setString(1, '%'+search_data+'%');
						pstmt.setString(2, '%'+search_data+'%');					
					}
					
						
					rs = pstmt.executeQuery();
				
				while(rs.next()) {
					EmployeeDTO dto = new EmployeeDTO();
					dto.setEmployee_id(rs.getInt("employee_id"));
					dto.setName(rs.getString("name"));
					dto.setEmail(rs.getString("email"));
					dto.setPhone(rs.getString("phone"));
					dto.setHire_date(rs.getDate("hire_date"));
					dto.setSalary(rs.getInt("salary"));
					dto.setDepartment_id(rs.getInt("department_id"));
					dto.setRegi_date(rs.getDate("regi_date"));
					list.add(dto);
				}
				
				
			}catch (Exception e) {
				
				e.printStackTrace();
				
			}finally {
				getConnClose();	
			}		
			return list;
		}
		
		//전체보기 + 검색 추가 + 페이징
		public ArrayList<EmployeeDTO> selectAll_searchPaging(String search_option ,String search_data, int startRecord, int lastRecord) {
			ArrayList<EmployeeDTO> list = new ArrayList<>();
			getConn();
			
			try {
				
					if(search_option == null || search_data == null) {
						search_option = "";
						search_data = "";
					}
					
					
					  String basicSql  = "";
					  		 basicSql  = "select * from employee";
					  
					
					//검색 관련 sql 문장
					if(search_option.equals("name") && !search_data.equals("")) {
						basicSql += " and name like ?";
					}else if(search_option.equals("department_id") && !search_data.equals("")) {
						basicSql += " and department_id = ?";
					}else if(search_option.equals("name_department_id") && !search_data.equals("")) {
						basicSql += " and (name like ? or department_id = ?)";
					}
						basicSql += "order by employee_id desc";
					
						
					String sql = "";
					sql += "select * from (select A.*, rownum rnum from (";
					sql += 	basicSql;
					sql += " ) A) where rnum >= ? and rnum <= ?";	
				
					pstmt = conn.prepareStatement(sql);
					
					//검색 관련 ? 채우는 문장
					int k = 0;
					if(search_option.equals("name") && !search_data.equals("")) {
						pstmt.setString(++k, '%'+search_data+'%');
					}else if(search_option.equals("department_id") && !search_data.equals("")) {
						pstmt.setString(++k, '%'+search_data+'%');
					}else if(search_option.equals("name_department_id") && !search_data.equals("")) {
						pstmt.setString(++k, '%'+search_data+'%');
						pstmt.setString(++k, '%'+search_data+'%');					
					}
						pstmt.setInt(++k, startRecord);
						pstmt.setInt(++k, lastRecord);
					
					rs = pstmt.executeQuery();
					System.out.println(sql);
					
				while(rs.next()) {
					EmployeeDTO dto = new EmployeeDTO();
					dto.setEmployee_id(rs.getInt("employee_id"));
					dto.setName(rs.getString("name"));
					dto.setEmail(rs.getString("email"));
					dto.setPhone(rs.getString("phone"));
					dto.setHire_date(rs.getDate("hire_date"));
					dto.setSalary(rs.getInt("salary"));
					dto.setDepartment_id(rs.getInt("department_id"));
					dto.setRegi_date(rs.getDate("regi_date"));
					list.add(dto);
				}
				
			}catch (Exception e) {
				
				e.printStackTrace();
				
			}finally {
				getConnClose();	
			}		
			return list;
		}
		
		//전체보기 + 검색 추가 + 페이징 + department
		public ArrayList<EmployeeDTO> selectAllwith_dep_searchPaging(String search_option ,String search_data, int startRecord, int lastRecord) {
			ArrayList<EmployeeDTO> list = new ArrayList<>();
			getConn();
			
			try {
				
				if(search_option == null || search_data == null) {
					search_option = "";
					search_data = "";
				}
				
				String basicSql = "";
				basicSql += "  select  employee.*,                           ";
				basicSql += " (select department_name from department";
				basicSql += "  where department.department_id = employee.department_id) department_name ";
				basicSql += "  from employee where 1 = 1";
						

				
				/*
				--서브쿼리-- 
				 select employee.*,
				 department_name from employee inner join department
				 on employee.department_id = department.department_id;
				  
				 */

				//검색 관련 sql 문장
				if(search_option.equals("name") && !search_data.equals("")) {
					basicSql += " and name like ?";
				}else if(search_option.equals("department_id") && !search_data.equals("")) {
					basicSql += " and department_id = ?";
				}else if(search_option.equals("name_department_id") && !search_data.equals("")) {
					basicSql += " and (name like ? or department_id = ?)";
				}
				basicSql += " order by employee_id desc";
				
				String sql = "";
				sql += "select * from (select A.*, rownum rnum from (";
				sql += 	basicSql;
				sql += " ) A) where rnum >= ? and rnum <= ?";	
				
				pstmt = conn.prepareStatement(sql);
				
				//검색 관련 ? 채우는 문장
				int k = 0;
				if(search_option.equals("name") && !search_data.equals("")) {
					pstmt.setString(++k, '%'+search_data+'%');
				}else if(search_option.equals("department_id") && !search_data.equals("")) {
					pstmt.setString(++k, '%'+search_data+'%');
				}else if(search_option.equals("name_department_id") && !search_data.equals("")) {
					pstmt.setString(++k, '%'+search_data+'%');
					pstmt.setString(++k, '%'+search_data+'%');					
				}
				pstmt.setInt(++k, startRecord);
				pstmt.setInt(++k, lastRecord);
				
				rs = pstmt.executeQuery();
				System.out.println(sql);
				
				while(rs.next()) {
					EmployeeDTO dto = new EmployeeDTO();
					dto.setEmployee_id(rs.getInt("employee_id"));
					dto.setDepartment_name(rs.getString("department_name"));
					dto.setName(rs.getString("name"));
					dto.setEmail(rs.getString("email"));
					dto.setPhone(rs.getString("phone"));
					dto.setHire_date(rs.getDate("hire_date"));
					dto.setSalary(rs.getInt("salary"));
					dto.setDepartment_id(rs.getInt("department_id"));
					dto.setRegi_date(rs.getDate("regi_date"));
					list.add(dto);
				}
				
			}catch (Exception e) {
				
				e.printStackTrace();
				
			}finally {
				getConnClose();	
			}		
			return list;
		}

		
		//전체 레코드 카운트
		public int getTotalRecord() {
			int result = 0;
			getConn();
			try {
				String sql = "select count(*) from employee";
				
				pstmt = conn.prepareStatement(sql);				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				}
				
			}catch (Exception e) {
				
				e.printStackTrace();
				
			}finally {
				getConnClose();	
			}		
			return result;
		}
		
		//전체 레코드 카운트+검색된 카운트 따로
		public int getTotalRecord_search(String search_option ,String search_data) {
			int result = 0;
			getConn();
			try {
				String sql = "select count(*) from employee where 1 = 1";
				
				//검색 관련 sql 문장
				if(search_option.equals("name") && !search_data.equals("")) {
					sql += " and name like ?";
				}else if(search_option.equals("department_id") && !search_data.equals("")) {
					sql += " and department_id = ?";
				}else if(search_option.equals("name_department_id") && !search_data.equals("")) {
					sql += " and (name like ? or department_id = ?)";
				}
				pstmt = conn.prepareStatement(sql);				
				//검색 관련 ? 채우는 문장
				int k = 0;
				if(search_option.equals("name") && !search_data.equals("")) {
					pstmt.setString(++k, '%'+search_data+'%');
				}else if(search_option.equals("department_id") && !search_data.equals("")) {
					pstmt.setString(++k, '%'+search_data+'%');
				}else if(search_option.equals("name_department_id") && !search_data.equals("")) {
					pstmt.setString(++k, '%'+search_data+'%');
					pstmt.setString(++k, '%'+search_data+'%');					
				}
				rs = pstmt.executeQuery();
				if(rs.next()) {
					result = rs.getInt(1);
				}
				
			}catch (Exception e) {
				
				e.printStackTrace();
				
			}finally {
				getConnClose();	
			}		
			return result;
		}
		
		//하나만 보기
		public EmployeeDTO selectOne(EmployeeDTO dto) {
			getConn();
			
			try {
				String sql = "select * from employee where employee_id = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getEmployee_id());
				
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dto.setEmployee_id(rs.getInt("employee_id"));
					dto.setName(rs.getString("name"));
					dto.setEmail(rs.getString("email"));
					dto.setPhone(rs.getString("phone"));
					dto.setHire_date(rs.getDate("hire_date"));
					dto.setSalary(rs.getInt("salary"));
					dto.setDepartment_id(rs.getInt("department_id"));
					dto.setRegi_date(rs.getDate("regi_date"));
				}
				
			}catch (Exception e) {
				
				e.printStackTrace();
				
			}finally {
				getConnClose();	
			}		
			return dto;
		}
		
		//수정
		public int setUpdate(EmployeeDTO dto) {
			
			int result = 0;
			getConn();
			
			try {
				String sql = "update employee set department_id = ?, salary = ?, name = ?, email = ?, phone = ?, hire_date = ? where employee_id = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getDepartment_id());
				pstmt.setInt(2, dto.getSalary());
				pstmt.setString(3, dto.getName());
				pstmt.setString(4, dto.getEmail());
				pstmt.setString(5, dto.getPhone());
				pstmt.setDate(6, dto.getHire_date());
				pstmt.setInt(7, dto.getEmployee_id());
				
				result = pstmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				getConnClose();	
			}		
			return result;
		}
		
		
		//삭제
		public int delete(EmployeeDTO dto) {
			
			int result = 0;
			getConn();
			try {
				String sql = "delete employee where employee_id = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getEmployee_id());
				
				result = pstmt.executeUpdate();
				
			}catch (Exception e) {
				e.printStackTrace();
				
			}finally {
				getConnClose();	
			}		
			return result;
		}
		
		
		
		
//DAO종료		
}
