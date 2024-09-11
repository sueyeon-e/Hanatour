package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.TourTicketSearchDto;
import dto.TourTicketSearchPriceDto;

public class TourTicketSearchDao {
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
	
	// 검색결과 수
	public int getCountTourByCity(String cityName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int countGoods = 0;
		try {
			String sql = "SELECT DISTINCT count(g.goods_idx) as count_goods "
					+ "FROM goods g "
					+ "LEFT JOIN city c ON g.city_idx = c.city_idx "
					+ "WHERE c.city_name=? ";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, cityName);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				countGoods = rs.getInt("count_goods");
			}
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
		return countGoods;
	}
	
	// 투어/입장권 검색 결과(상품 한개의 정보)
	public ArrayList<TourTicketSearchDto> getTourSearchList(String inputCityName) {
		ArrayList<TourTicketSearchDto> listRet = new ArrayList<TourTicketSearchDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT g.goods_name, "
					+ "    g.goods_idx, "
					+ "    g.when_use, "
					+ "    ROUND(avg(rv.rating),1) as avg_rating, "
					+ "    COUNT(rv.review_idx) as review_count, "
					+ "    c.city_name, "
					+ "    MIN(th.img_url) KEEP (DENSE_RANK FIRST ORDER BY th.goods_thumbnail_idx) AS first_img_url "
					+ "FROM goods g "
					+ "LEFT JOIN goods_type gt ON g.goods_idx = gt.goods_idx "
					+ "LEFT JOIN goods_review rv ON gt.goods_type_idx = rv.goods_type_idx "
					+ "LEFT JOIN city c ON c.city_idx = g.city_idx "
					+ "LEFT JOIN goods_thumbnail th ON g.goods_idx = th.goods_idx "
					+ "WHERE c.city_name = ? "
					+ "GROUP BY g.goods_name, g.goods_idx, g.when_use, c.city_name "
					+ "ORDER BY g.goods_name ";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputCityName);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String goodsName = rs.getString("goods_name");
				int goodsIdx = rs.getInt("goods_idx");
				String whenUse = rs.getString("when_use");
				double avgRating = rs.getDouble("avg_rating");
				int reviewCount = rs.getInt("review_count");
				String cityName = rs.getString("city_name");
				String firstImgUrl = rs.getString("first_img_url");
				TourTicketSearchDto tourSearchList = new TourTicketSearchDto(goodsName, goodsIdx, whenUse, avgRating, reviewCount, cityName, firstImgUrl);
				listRet.add(tourSearchList);
			}
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
	
	// 상품 최저가
	public ArrayList<TourTicketSearchPriceDto> getTourPriceDto() {
		ArrayList<TourTicketSearchPriceDto> listRet = new ArrayList<TourTicketSearchPriceDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT g.goods_idx, "
					+ "    min(dt.type_price) as lowest_price "
					+ "FROM goods g "
					+ "LEFT JOIN goods_type gt ON g.goods_idx = gt.goods_idx "
					+ "LEFT JOIN goods_detail_type dt ON dt.goods_type_idx = gt.goods_type_idx "
					+ "WHERE dt.detail_type_idx = (SELECT min(dt2.detail_type_idx) "
					+ "                            FROM goods_detail_type dt2 "
					+ "                            WHERE dt.goods_type_idx = dt2.goods_type_idx) "
					+ "GROUP BY g.goods_idx";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int goodsIdx = rs.getInt("goods_idx");
				int lowestPrice = rs.getInt("lowest_price");
				TourTicketSearchPriceDto tourSearchPrice = new TourTicketSearchPriceDto(goodsIdx, lowestPrice);
				listRet.add(tourSearchPrice);
			}
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
