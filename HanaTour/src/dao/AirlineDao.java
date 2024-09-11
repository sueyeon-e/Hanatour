package dao;

import java.sql.*;

public class AirlineDao {
	
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
	
	
	
	// 공항 코드로 공항 한글 이름 가져오기
	public String getAirlineKorNameByIata(String iata) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String result = "";
		
		try {
			conn = getConnection();
			String sql = 
					"SELECT  name " + 
					"FROM    airline " + 
					"WHERE   iata = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, iata);
			
			rs = pstmt.executeQuery();
			
			if( rs.next() ) {
				result = rs.getString(1);
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
		
		return result;
	}
	
	
	
	
	// 특정 공항 위도, 경도 가져오기
	public double[] getAirportLatLonByIATA(String iata) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		double[] airportLatLon = new double[2];
		
		try {
			conn = getConnection();
			String sql = 
					"SELECT  lat, " + 
					"        lon " + 
					"FROM    airport " + 
					"WHERE   iata = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, iata);
			rs = pstmt.executeQuery();
			
			while( rs.next() ) {
				airportLatLon[0] = rs.getDouble("lat");
				airportLatLon[1] = rs.getDouble("lon");
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
		
		return airportLatLon;
	}
	
	
	
	
	
}
