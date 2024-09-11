package dao;

import java.sql.*;

public class UserInfoDuplicateCheck {
	
	
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String dbId = "project";
		String dbPw = "pass1234";
		
		Class.forName(driver);
		DriverManager.getConnection(url, dbId, dbPw);
		
		Connection conn = DriverManager.getConnection(url, dbId, dbPw);
		return conn;
	}
	
	
	
	// ajax 아이디 중복체크
	public boolean idDuplicateCheck(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = getConnection();
			String sql = 
					"SELECT  count(*) " + 
					"FROM    user_info " + 
					"WHERE   user_id=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return (result == 1);
	}
	
	
	
	
	
	// ajax 이메일 중복체크
	public boolean emailDuplicateCheck(String email) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = getConnection();
			String sql = 
					"SELECT  count(*) " + 
					"FROM    user_info " + 
					"WHERE   email = ? "  
			;
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			
			rs = pstmt.executeQuery();
					
			if(rs.next()) {
				result = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) {
					rs.close();
				} 
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return (result == 1);
	}
	
	
	

	
}
