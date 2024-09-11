package dao;

import java.sql.*;


public class UpdateUserInfoDao {
	
	
	
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
	
	
	
	
	// 아이디 변경
	public void idUpdate(String id, String changeId) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = 
					"UPDATE  user_info " + 
					"SET     user_id = ? " + 
					"WHERE   user_id = ? " + 
					"";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, changeId);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
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
		
	}
	
	
	
	
	// 휴대폰 번호 변경
	public void phoneNumberUpdate(String id, String changePhone) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = 
					"UPDATE  user_info " + 
					"SET     phone = ? " + 
					"WHERE   user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, changePhone);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt !=null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	
	
	
	
	// 이메일 변경
	public void emailUpdate(String id, String email) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = 
					"UPDATE  user_info " + 
					"SET     email = ? " + 
					"WHERE   user_id = ? " + 
					"";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			pstmt.setString(2, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
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
		
	}	
		
	
	
		
	// 여권정보 저장
	public void passportUpdate(String id, String lastName, String firstName,
			String passportNumber, String passportExpirationDate, 
			String nationality, String authority) {
		
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = 
					"UPDATE  user_info " + 
					"SET     last_name = ?, " + 
					"        first_name = ?, " + 
					"        passport_number = ?, " + 
					"        expiration_date = TO_DATE(?, 'YYYYMMDD'), " + 
					"        nationality = ?, " + 
					"        authority = ? " + 
					"WHERE   user_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, lastName);
			pstmt.setString(2, firstName);
			pstmt.setString(3, passportNumber);
			pstmt.setString(4, passportExpirationDate);
			pstmt.setString(5, nationality);
			pstmt.setString(6, authority);
			pstmt.setString(7, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
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
		
	}
	
	
	
	// 여권정보 삭제
	public void passportDelete(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = 
					"UPDATE  user_info " + 
					"SET     last_name = NULL, " + 
					"        first_name = NULL, " + 
					"        passport_number = NULL, " + 
					"        expiration_date = NULL, " + 
					"        nationality = NULL, " + 
					"        authority = NULL " + 
					"WHERE   user_id = ? "  
					;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
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
		
	}
	
	
	
	// 비밀번호 변경
	public void pwUpdate(String id, String pw, String changePw) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = 
					"UPDATE  user_info " + 
					"SET     user_pw = ? " + 
					"WHERE   user_id = ? " + 
					"        AND " + 
					"        user_pw = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, changePw);
			pstmt.setString(2, id);
			pstmt.setString(3, pw);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
			try {
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
		
	}
	
	
	// 계정 탈퇴(삭제)
	public void deleteAccount(String id, String pw) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = 
					"DELETE  " + 
					"FROM    user_info " + 
					"WHERE   user_id = ? " + 
					"        AND " + 
					"        user_pw = ?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
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
		
	}
	
	
	
	
}
