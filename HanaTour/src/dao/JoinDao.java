package dao;

import java.sql.*;

public class JoinDao {
	
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
	
		
	
	

	
	// 회원 가입 - 약관 동의 
	public void joinAgreementsCheckInsert(String agree1, String agree2, String agree3, 
									String agree4, String agree5, String agree6) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			
			conn = getConnection();
			
			// 임시 아이디'temp_id'를 생성해 DB에 데이터 삽입
			String sql = 
					"INSERT INTO user_info(user_id, agree1, agree2, agree3, agree4, agree5, agree6) " + 
					"VALUES('temp_id' || SEQ_TEMP_ID.nextval, ?, ?, ?, ?, ?, ?)"
			;
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, agree1);
			pstmt.setString(2, agree2);
			pstmt.setString(3, agree3);
			pstmt.setString(4, agree4);
			pstmt.setString(5, agree5);
			pstmt.setString(6, agree6);
			
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	// 회원 가입 - 본인인증
	public void joinVerification(String name, String gender, 
									String birth, String email) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			
			// 임시 아이디에 개인정보 데이터 삽입
			String sql =
					"UPDATE  user_info  " + 
					"SET     name = ?,   " + 
					"gender = ?,    " + 
					"birth = TO_DATE(?, 'YYYY-MM-DD'),   " + 
					"email = ? " + 
					"WHERE   user_id LIKE 'temp_id%'  " + 
					"        AND " + 
					"        TO_NUMBER (SUBSTR (user_id, 8) ) = (  " + 
					"            SELECT  Max( TO_NUMBER (SUBSTR (user_id, 8) ) )  " + 
					"            FROM    user_info  " + 
					"            WHERE   user_id LIKE 'temp_id%'  " + 
					"        )"
					;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, gender);
			pstmt.setString(3, birth);
			pstmt.setString(4, email);
			
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	
	
	
	// 회원 가입 - 아이디 중복 체크
	public boolean joinIdDuplicateCheck(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			conn = getConnection();
			String sql = 
					"SELECT  count(*) " + 
					"FROM    user_info " + 
					"WHERE   user_id = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next( )) { // rs.getInt(1)이 1이면 중복된 아이디
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
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return (result == 1);
	}
	
	
	
	
	
	// 회원 가입 - 아이디, 휴대폰 번호, 비밀번호 설정, 외국인 여부
	public void joinInputPhoneNumberPassword(String id, String phone, String pw, String foreigner) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		 
		try {
			conn = getConnection();
			
			// 임시 아이디를 회원이 설정한 아이디로 변경 
			String sql = 
					"UPDATE  user_info " + 
					"SET     user_id = ?, " + 
					"        phone = ?, " + 
					"		 user_pw = ?,  " + 
					"        foreigner = ?  " + 
					"WHERE   user_id LIKE 'temp_id%' " + 
					"        AND " + 
					"        TO_NUMBER (SUBSTR (user_id, 8) ) = (  " + 
					"            SELECT  Max( TO_NUMBER (SUBSTR (user_id, 8) ) ) " + 
					"            FROM    user_info  " + 
					"            WHERE   user_id LIKE 'temp_id%' " + 
					"        )"
					;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, phone);
			pstmt.setString(3, pw);
			pstmt.setString(4, foreigner);
			
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
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	
	
}
