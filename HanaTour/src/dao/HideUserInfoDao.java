package dao;

import java.sql.*;

public class HideUserInfoDao {

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
	
	
	
	
	
	
	
	
	
	// 이름 가운데 숨기기
	public String hideName(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String hideName = null;
		
		try {
			conn = getConnection();
			String sql = 
					"SELECT  name " + 
					"FROM    user_info " + 
					"WHERE   user_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				String name = rs.getString("name");
				
				if(name.length() == 1) { // 이름이 한글자인 경우
					hideName = name;
					
				} else if(name.length() == 2) { // 이름이 두글자인 경우 두번째 글자 숨김
					hideName = name.substring(0, 1) + "*";
					
				} else { // 이름이 세글자 이상인 경우 첫번째, 마지막 글자 제외  전부 숨김
					
					char firstChar = name.charAt(0);
					char lastChar = name.charAt(name.length() - 1);
					StringBuffer sb = new StringBuffer();
					
					sb.append(firstChar);
					
					for(int i = 1; i < name.length() - 1; i++) {
						sb.append("*");
					}
					
					sb.append(lastChar);
					
					hideName = sb.toString();
					
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}
		
		return hideName;
	}
	
	
	
	
	
	// 휴대폰 번호 가운데 자리 숨기기
	public String hidePhone(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String hidePhone = null;
		
		try {
			conn = getConnection();
			String sql = 
					"SELECT  phone " + 
					"FROM    user_info " + 
					"WHERE   user_id = ?"
				;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String phoneNumber = rs.getString("phone");
				hidePhone = phoneNumber.substring(0, 3) + "-****-" + phoneNumber.substring(7, phoneNumber.length());
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
		
		return hidePhone;
	}
	
	
	
	
	
	
	// 생년월일, 성별 글자 숨기기
	public String hideBirthGender(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String hideBirthGender = null;
		
		try {
			conn = getConnection();
			String sql = 
					"SELECT  birth " + 
					"FROM    user_info " + 
					"WHERE   user_id = ?"
					;
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				String birth = rs.getString("birth");
				hideBirthGender = birth.substring(0, 8) + "**/*성";
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
		
		return hideBirthGender;
	}
	
	
	
	
	// 이메일 가운데 숨기기
	public String hideEmail(String id) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String hideEmail = null;
		
		try {
			conn = getConnection();
			String sql = 
					"SELECT  email " + 
					"FROM    user_info " + 
					"WHERE   user_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				String email = rs.getString("email");

				String[] emailSplit = email.split("@"); 
				
				String emailId = emailSplit[0];
				String emailAddress = emailSplit[1];
				
				StringBuffer sb = new StringBuffer();
				
				sb.append(emailId.substring(0, 3));
				
				if(emailId.length() > 3) {
					for(int i = 0; i < emailId.length(); i++) {
						sb.append("*");
					}
				}
				
				sb.append("@");
				sb.append(emailAddress);
				
				hideEmail = sb.toString();
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
		
		return hideEmail;
	}
	
	
	
	
	
}
