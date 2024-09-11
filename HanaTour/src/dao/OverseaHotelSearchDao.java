package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.OverseaHotelPrice;
import dto.OverseaHotelSearchDto;

public class OverseaHotelSearchDao {
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
	
	// 호텔 검색 결과
	public ArrayList<OverseaHotelSearchDto> getHotelSearch(String inputCheckin, String inputCheckout, int inputRoom, int inputPersonnel, String inputCityName) {
		ArrayList<OverseaHotelSearchDto> listRet = new ArrayList<OverseaHotelSearchDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT DISTINCT i.inn_idx, "
					+ "    MIN(im.inn_img_url) KEEP (DENSE_RANK FIRST ORDER BY im.inn_img_idx) AS min_img_url, "
					+ "    c.city_name, c.city_idx, "
					+ "    i.inn_kor,  "
					+ "    i.star,  "
					+ "    i.inn_eng,  "
					+ "    i.purple_box,  "
					+ "    i.famous_spot,  "
					+ "    ROUND(avg(s.clean + s.employee + s.convenient_facility + s.inn_facility)/4,1) as review_rating, "
					+ "    COUNT(DISTINCT rv.review_idx)  as review_count "
					+ "FROM inn i "
					+ "LEFT JOIN room r ON i.inn_idx = r.inn_idx "
					+ "LEFT JOIN city c ON i.city_idx = c.city_idx "
					+ "LEFT JOIN inn_img im ON i.inn_idx = im.inn_idx "
					+ "LEFT JOIN inn_review rv ON i.inn_idx = rv.inn_idx "
					+ "LEFT JOIN inn_review_standard s ON s.review_idx = rv.review_idx "
					+ "WHERE  "
					+ "    r.checkin BETWEEN TO_DATE(?, 'YYMMDD') AND (TO_DATE(?, 'YYMMDD') + ?) "
					+ "    AND r.max_room >= ? "
					+ "    AND r.max_personnel >= ? "
					+ "    AND c.city_name = ? "
					+ "GROUP BY i.inn_idx, r.room_idx, i.inn_kor, c.city_name, c.city_idx, i.star, i.inn_eng, i.purple_box, i.famous_spot";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputCheckin);
			pstmt.setString(2, inputCheckin);
			pstmt.setString(3, inputCheckout);
			pstmt.setInt(4, inputRoom);
			pstmt.setInt(5, inputPersonnel);
			pstmt.setString(6, inputCityName);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int innIdx = rs.getInt("inn_idx");
				String minImgUrl = rs.getString("min_img_url");
				String cityName = rs.getString("city_name");
				String innKor = rs.getString("inn_kor");
				String innEng = rs.getString("inn_eng");
				int star = rs.getInt("star");
				String purpleBox = rs.getString("purple_box");
				String famousSpot = rs.getString("famous_spot");
				int reviewRating = rs.getInt("review_rating");
				int reviewCount = rs.getInt("review_count");
				OverseaHotelSearchDto overseaSearch = new OverseaHotelSearchDto(innIdx, minImgUrl, cityName, innKor, innEng, star, purpleBox, famousSpot, reviewRating, reviewCount);
				listRet.add(overseaSearch);
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
	
	// 호텔 최저가
	public ArrayList<OverseaHotelPrice> getLowestPrice() {
		ArrayList<OverseaHotelPrice> listRet = new ArrayList<OverseaHotelPrice>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT min(r.price) as price, "
					+ "    i.inn_idx  "
					+ "FROM inn i "
					+ "LEFT JOIN room r ON i.inn_idx = r.inn_idx "
					+ "WHERE r.checkin > SYSDATE "
					+ "GROUP BY i.inn_idx ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next() ) {
				int price = rs.getInt("price");
				int innIdx = rs.getInt("inn_idx");
				OverseaHotelPrice overseaPrice = new OverseaHotelPrice(price, innIdx);
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
