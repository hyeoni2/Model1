package product.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import config.DB;
import member.model.dto.MemberDTO;
import product.model.dto.ProductDTO;
import sungjuk.model.dto.SungjukDTO;


public class ProductDAO {

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
	public ArrayList<ProductDTO> getSelectAll(String search_option, String search_data) {
		
		ArrayList<ProductDTO> arrayList = new ArrayList<>();
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {
			if(search_option == null || search_data == null) {
				search_option = "";
				search_data = "";
			}
			
			String sql = "select * from product where 1 = 1";
			if(search_option.equals("name")) {
				sql += " and product_name like ?";				
			}else if(search_option.equals("maker")) {
				sql += " and maker like ?";								
			}else if(search_option.equals("name_maker")) {
				sql += " and (product_name like ? or maker like ?)";								
			}		
			
			pstmt = conn.prepareStatement(sql);
			
			if(search_option.equals("name")) {
				pstmt.setString(1, '%'+search_data+'%');
			}else if(search_option.equals("maker")) {
				pstmt.setString(1, '%'+search_data+'%');
			}else if(search_option.equals("name_maker")) {
				pstmt.setString(1, '%'+search_data+'%');
				pstmt.setString(2, '%'+search_data+'%');
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ProductDTO dto = new ProductDTO();
				dto.setProduct_code(rs.getInt("product_code"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setMaker(rs.getString("maker"));
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
	
	//페이징
	public ArrayList<ProductDTO> getSelectAll_02(String search_option, String search_data, int startRecord, int lastRecord) {
		
		ArrayList<ProductDTO> arrayList = new ArrayList<>();
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {
			if(search_option == null || search_data == null) {
				search_option = "";
				search_data = "";
			}
			
			String basicSql = "select * from product where 1 = 1";
			if(search_option.equals("name")) {
				basicSql += " and product_name like ?";				
			}else if(search_option.equals("maker")) {
				basicSql += " and maker like ?";								
			}else if(search_option.equals("name_maker")) {
				basicSql += " and (product_name like ? or maker like ?)";								
			}		
			
			
			String sql = "";
			sql += "select * from (select A.*, rownum rnum from ( ";
			sql += basicSql;
			sql += ") A) where rnum >= ? and rnum <= ?";		
			
			pstmt = conn.prepareStatement(sql);
			
			int k = 0;
			if(search_option.equals("name")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("maker")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("name_maker")) {
				pstmt.setString(++k, '%'+search_data+'%');
				pstmt.setString(++k, '%'+search_data+'%');			
			}
				pstmt.setInt(++k, '%'+startRecord+'%');
				pstmt.setInt(++k, '%'+lastRecord+'%');
				
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				ProductDTO dto = new ProductDTO();
				dto.setProduct_code(rs.getInt("product_code"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setMaker(rs.getString("maker"));
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
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		try {
			
			String sql = "select count(*) from product where 1 = 1";
			
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
	
	
	//검색 순번 관련
	public int getTotalRecord_02(String search_option, String search_data) {	
		int result = 0;
		//DB열고 try-catch문 안에서 적어줌
		getConn();
		
		try {
			
			if(search_option == null || search_data == null) {
				search_option = "";
				search_data = "";
			}
			
			String sql = "select count(*) from product where 1 = 1";
			
			if(search_option.equals("name")) {
				sql += " and product_name like ?";				
			}else if(search_option.equals("maker")) {
				sql += " and maker like ?";								
			}else if(search_option.equals("name_maker")) {
				sql += " and (product_name like ? or maker like ?)";								
			}		
			int k = 0;
			if(search_option.equals("name")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("maker")) {
				pstmt.setString(++k, '%'+search_data+'%');
			}else if(search_option.equals("name_maker")) {
				pstmt.setString(++k, '%'+search_data+'%');
				pstmt.setString(++k, '%'+search_data+'%');			
			}
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
	
	//뷰
	public ProductDTO getSelectOne(ProductDTO dto) {
		
		getConn();
		try {
			String sql = "select * from product where product_code = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getProduct_code());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				dto.setProduct_code(rs.getInt("product_code"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setMaker(rs.getString("maker"));
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
	public int setInsert(ProductDTO dto) {
		  int result = 0;
		  getConn(); 
		 	try {
		 		String sql = "insert into product values(?, ?, ?, ?, sysdate)";		 	
		 		pstmt = conn.prepareStatement(sql);
		 		pstmt.setInt(1, dto.getProduct_code());
		 		pstmt.setString(2, dto.getProduct_name());
		 		pstmt.setInt(3, dto.getProduct_price());
		 		pstmt.setString(4, dto.getMaker());
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
	public int setUpdate(ProductDTO dto) {
		 	
		int result = 0;
			getConn(); 
		 	try {
		 		String sql = "update product set product_name = ?, product_price = ?, maker = ? where product_code = ?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, dto.getProduct_name());
				pstmt.setInt(2, dto.getProduct_price());
				pstmt.setString(3, dto.getMaker());
				pstmt.setInt(4, dto.getProduct_code());
				
				result = pstmt.executeUpdate();

		 	}catch (Exception e) { 
		  e.printStackTrace(); 
		  }finally {
			 getConnClose();
			
		}
		   return result;
	}
	
	//삭제
	public int delete(ProductDTO dto) {
		 	int result = 0;
			getConn(); 
		 	try {
		 		String sql = "delete from product where product_code = ?";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, dto.getProduct_code());
				result = pstmt.executeUpdate();
		  }catch (Exception e) { 
		  e.printStackTrace(); 
		  }finally {			
				getConnClose();
			}
		 	return result;
	}
	
	
	
	
}
