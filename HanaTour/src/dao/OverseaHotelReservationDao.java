package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.OverseaHotelReservationDto;

public class OverseaHotelReservationDao {
	Connection getConnection() {
		String driver = "oracle.jdbc.driver.OracleDriver";
	      String url = "jdbc:oracle:thin:@localhost:1521:xe";
	      String dbId = "project";
	      String dbPw = "pass1234";
	      
	      Connection conn = null;
	      try {
	    	  Class.forName(driver);
	    	  conn = DriverManager.getConnection(url, dbId, dbPw);
	      } catch(Exception e) {
	    	  e.printStackTrace();
	      }
	      return conn;
	}
	
	// 호텔 예약 정보 출력
	public ArrayList<OverseaHotelReservationDto> getReservation(int roomIdx) {
		ArrayList<OverseaHotelReservationDto> listRet = new ArrayList<OverseaHotelReservationDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT i.inn_kor, "
					+ "    cnt.country_name,  "
					+ "    c.city_name, "
					+ "	   r.room_name "
					+ "FROM room r "
					+ "LEFT JOIN inn i ON r.inn_idx = i.inn_idx "
					+ "LEFT JOIN city c ON i.city_idx = c.city_idx "
					+ "LEFT JOIN country cnt ON cnt.country_idx = c.country_idx "
					+ "WHERE room_idx = ? ";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, roomIdx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String innKor = rs.getString("inn_kor");
				String countryName = rs.getString("country_name");
				String cityName = rs.getString("city_name");
				String roomName = rs.getString("room_name");
				OverseaHotelReservationDto overseaReservation = new OverseaHotelReservationDto(innKor, countryName, cityName, roomName);
				listRet.add(overseaReservation);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {	
			try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return listRet;
	}
}
