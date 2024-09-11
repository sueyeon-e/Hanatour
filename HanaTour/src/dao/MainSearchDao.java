package dao;

import java.sql.*;
import java.util.ArrayList;
import dto.*;

public class MainSearchDao {
// 	Connection 객체 
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "project";
		String pw = "pass1234";
		
		Class.forName(driver);
		Connection conn = DriverManager.getConnection(url,id,pw);
		
		return conn;
	}	
// 해외여행 추천 한줄정보 (다음달의 가까운 순으로 나열)	
	public ArrayList<RecommendPackageOneInfoDto> recommendPackageOneInfo(String countryCity) {
		ArrayList<RecommendPackageOneInfoDto> listRet = new ArrayList<RecommendPackageOneInfoDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * " + 
					"FROM ( " + 
					"    SELECT * " + 
					"    FROM ( " + 
					"        SELECT p.package_idx, " + 
					"               p.package_name, " + 
					"               p.travel_period, " + 
					"               p.shopping, " + 
					"               p.shopping_times, " + 
					"               p.guide, " + 
					"               pp.adult, " + 
					"               a.logo, " + 
					"               a.name, " + 
					"               MIN(pf.departure_date) AS departure_date, " + 
					"               p.brand, " + 
					"               p.group_travel, " + 
					"               p.review_star, " + 
					"               p.review_comment, " + 
					"               pth.img_url, " + 
					"               ROW_NUMBER() OVER (PARTITION BY p.package_idx ORDER BY MIN(pf.departure_date)) AS rn " + 
					"        FROM package p " + 
					"        LEFT JOIN category c ON c.category_idx = p.category_idx " + 
					"        LEFT JOIN package_price pp ON pp.package_idx = p.package_idx " + 
					"        LEFT JOIN package_flight pf ON p.package_idx = pf.package_idx " + 
					"        LEFT JOIN airline_ticket at ON at.ticket_idx = pf.ticket_idx " + 
					"        LEFT JOIN airline a ON a.iata = at.airline_iata " + 
					"        LEFT JOIN package_city pr ON pr.package_idx = p.package_idx " + 
					"        LEFT JOIN city ci ON ci.city_idx = pr.city_idx " + 
					"        LEFT JOIN country co ON co.country_idx = ci.country_idx " + 
					"        LEFT JOIN package_thumbnail pth ON pth.package_idx = p.package_idx " + 
					"        WHERE (co.country_name = ? OR ci.city_name = ? ) " + 
					"          AND pth.img_order = 1 " + 
					"        GROUP BY c.category_idx, p.package_idx, p.package_name, p.travel_period, p.shopping, p.shopping_times, p.guide, pp.adult, a.logo, a.name, p.brand, p.group_travel, p.review_star, p.review_comment, pth.img_url " + 
					"        HAVING MIN(pf.departure_date) >= TRUNC(ADD_MONTHS(SYSDATE, 1), 'MM') " + 
					"           AND MIN(pf.departure_date) < TRUNC(ADD_MONTHS(SYSDATE, 2), 'MM') " + 
					"    ) " + 
					"    WHERE rn = 1 " + 
					"    ORDER BY departure_date " + 
					") " + 
					"WHERE ROWNUM <= 5 " + 
					"ORDER BY package_idx " + 
					"";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,countryCity);
			pstmt.setString(2,countryCity);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int packageIdx = rs.getInt("package_idx");
				String packageName = rs.getString("package_name");
				String travelPeriod = rs.getString("travel_period");
				String shopping = rs.getString("shopping");
				String shoppingTimes = rs.getString("shopping_times");
				String guide = rs.getString("guide");
				int adult = rs.getInt("adult");
				String logo = rs.getString("logo");
				String name = rs.getString("name");
				String departureDate = rs.getString("departure_date");
				String brand = rs.getString("brand");
				String groupTravel = rs.getString("group_travel");
				double reviewStar = rs.getDouble("review_star");
				int reviewComment = rs.getInt("review_comment");
				String imgUrl = rs.getString("img_url");
				RecommendPackageOneInfoDto dto = new RecommendPackageOneInfoDto(packageIdx, packageName, travelPeriod, shopping, shoppingTimes, guide, adult, logo, name, departureDate, brand, groupTravel, reviewStar, reviewComment, imgUrl);
				listRet.add(dto);
			} 	
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (rs != null) rs.close();
	    		if (pstmt != null) pstmt.close();
	    		if (conn != null) conn.close();
	    	} catch (SQLException e) {
	    		e.printStackTrace(); 
	    	}
	    }
		return listRet;
	}
	
// 추천 해외여행 출발일 도착일 
	public ArrayList<RecommendPackageDateDto> recommendPackageDate() {
		ArrayList<RecommendPackageDateDto> listRet = new ArrayList<RecommendPackageDateDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  p.package_idx,  " + 
					"        TO_CHAR(MIN(pf.departure_date),'MM.DD DY HH:MI')as departure_date,  " + 
					"        TO_CHAR(MAX(pf.arrival_date),'MM.DD DY HH:MI') as arrival_date  " + 
					"FROM package p  " + 
					"LEFT JOIN package_flight pf ON p.package_idx = pf.package_idx  " + 
					"GROUP BY p.package_idx ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int packageIdx = rs.getInt("package_idx");
				String departureDate = rs.getString("departure_date");
				String arrivalDate = rs.getString("arrival_date");
				RecommendPackageDateDto dto = new RecommendPackageDateDto(packageIdx, departureDate, arrivalDate);
				listRet.add(dto);
			}	
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (rs != null) rs.close();
	    		if (pstmt != null) pstmt.close();
	    		if (conn != null) conn.close();
	    	} catch (SQLException e) {
	    		e.printStackTrace(); 
	    	}
	    }
		return listRet;
	}
	
// 추천 해외여행 지역 
	public ArrayList<RecommendPackageCityDto> recommendPackageCity() {
		ArrayList<RecommendPackageCityDto> listRet = new ArrayList<RecommendPackageCityDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  p.package_idx, " + 
					"        ci.city_name " + 
					"FROM package p " + 
					"LEFT JOIN package_city pc ON p.package_idx = pc.package_idx " + 
					"LEFT JOIN city ci ON ci.city_idx = pc.city_idx " ;
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int packageIdx = rs.getInt("package_idx");
				String cityName = rs.getString("city_name");
				RecommendPackageCityDto dto = new RecommendPackageCityDto(packageIdx, cityName);
				listRet.add(dto);
			}	
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (rs != null) rs.close();
	    		if (pstmt != null) pstmt.close();
	    		if (conn != null) conn.close();
	    	} catch (SQLException e) {
	    		e.printStackTrace(); 
	    	}
	    }
		return listRet;
	} 
	
// 추천 여행지 top부분
	public ArrayList<RecommendAttractionTopDto> recommendAttractionTop(String countryCity) {
		ArrayList<RecommendAttractionTopDto> listRet = new ArrayList<RecommendAttractionTopDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT * " + 
					"FROM ( " + 
					"    SELECT at.attraction_idx, " + 
					"           at.attraction_kor, " + 
					"           at.detailed_ex, " + 
					"           ati.img_url, " + 
					"           ROWNUM AS rn " + 
					"    FROM attraction at " + 
					"    LEFT JOIN attraction_img ati ON at.attraction_idx = ati.attraction_idx " + 
					"    LEFT JOIN city ci ON ci.city_idx = at.city_idx " + 
					"    LEFT JOIN country co ON co.country_idx = ci.country_idx " + 
					"    WHERE ati.img_order = 1 " + 
					"    AND (co.country_name = ? OR ci.city_name = ? ) " + 
					") " + 
					"WHERE rn <= 8";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,countryCity);
			pstmt.setString(2,countryCity);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int attractionIdx = rs.getInt("attraction_idx");
				String attractionKor = rs.getString("attraction_kor");
				String detailedEx = rs.getString("detailed_Ex");
				String imgUrl = rs.getString("img_url");
				RecommendAttractionTopDto dto = new RecommendAttractionTopDto(attractionIdx, attractionKor, detailedEx, imgUrl);
				listRet.add(dto);
			}
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (rs != null) rs.close();
	    		if (pstmt != null) pstmt.close();
	    		if (conn != null) conn.close();
	    	} catch (SQLException e) {
	    		e.printStackTrace(); 
	    	}
	    }
		return listRet;
	}
	
// 추천 호텔 
	public ArrayList<RecommendHotelDto> recommendHotel(String countryCity) {
		ArrayList<RecommendHotelDto> listRet = new ArrayList<RecommendHotelDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT DISTINCT inn_img_url, " + 
					"        inn_idx,  " + 
					"        inn_kor,  " + 
					"        inn_type, " + 
					"        star, " + 
					"        city_name, " + 
					"        country_name, " + 
					"        review_avg, " + 
					"        review_num, " + 
					"        min_price, " + 
					"        rn " + 
					"FROM ( " + 
					"    SELECT " + 
					"        im.inn_img_url, " + 
					"        i.inn_idx,  " + 
					"        i.inn_kor,  " + 
					"        i.inn_type, " + 
					"        i.star, " + 
					"        c.city_name, " + 
					"        co.country_name, " + 
					"        AVG(s.clean + s.employee + s.convenient_facility + s.inn_facility) / 4 AS review_avg, " + 
					"        COUNT(DISTINCT rv.review_idx) AS review_num, " + 
					"        MIN(r.price) AS min_price, " + 
					"        ROW_NUMBER() OVER (ORDER BY i.inn_idx) AS rn " + 
					"    FROM inn i " + 
					"    LEFT JOIN room r ON r.inn_idx = i.inn_idx AND r.checkin >= TO_DATE('20240801', 'yyyymmdd') AND r.checkin < TO_DATE('20240901', 'yyyymmdd') " + 
					"    LEFT JOIN inn_img im ON i.inn_idx = im.inn_idx " + 
					"    LEFT JOIN city c ON c.city_idx = i.city_idx " + 
					"    LEFT JOIN country co ON co.country_idx = c.country_idx " + 
					"    LEFT JOIN inn_review rv ON i.inn_idx = rv.inn_idx " + 
					"    LEFT JOIN inn_review_standard s ON s.review_idx = rv.review_idx " + 
					"    WHERE (city_name = ?  " + 
					"    OR country_name = ? ) " + 
					"    AND im.num = 1 " + 
					"    AND i.inn_kor NOT LIKE '%없음%' " + 
					"    AND i.inn_kor NOT LIKE '%기내%' " + 
					"    GROUP BY i.inn_idx, i.inn_kor, i.inn_type, i.star, c.city_name, co.country_name, im.inn_img_url " + 
					") " + 
					"WHERE rn <= 5 ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,countryCity);
			pstmt.setString(2,countryCity);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String innImgUrl = rs.getString("inn_img_url");
				int innIdx = rs.getInt("inn_idx");
				String innKor = rs.getString("inn_kor");
				String innType = rs.getString("inn_type");
				double star = rs.getDouble("star");
				String cityName = rs.getString("city_name");
				String countryName = rs.getString("country_name");
				double reviewAvg = rs.getDouble("review_avg");
				int reviewNum = rs.getInt("review_num");
				int minPrice = rs.getInt("min_price");
				int rn = rs.getInt("rn");
				RecommendHotelDto dto = new RecommendHotelDto(innImgUrl, innIdx, innKor, innType, star, cityName, countryName, reviewAvg, reviewNum, minPrice, rn);
				listRet.add(dto);
			}
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (rs != null) rs.close();
	    		if (pstmt != null) pstmt.close();
	    		if (conn != null) conn.close();
	    	} catch (SQLException e) {
	    		e.printStackTrace(); 
	    	}
	    }
		return listRet;
	}
	
// 추천 투어/입장권
	public ArrayList<RecommendTicketDto> recommendTicket(String countryCity) {
		ArrayList<RecommendTicketDto> listRet = new ArrayList<RecommendTicketDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  goods_idx, " + 
					"        min_img_url, " + 
					"        goods_name, " + 
					"        goods_ticket_type, " + 
					"        city_name, " + 
					"        min_type_price, " + 
					"        avg_rating, " + 
					"        review_count " + 
					"FROM ( " + 
					"    SELECT DISTINCT " + 
					"        g.goods_idx, " + 
					"        MIN(gthmb.img_url) KEEP (DENSE_RANK FIRST ORDER BY gthmb.goods_thumbnail_idx) AS min_img_url, " + 
					"        g.goods_name, " + 
					"        g.goods_ticket_type, " + 
					"        c.city_name, " + 
					"        MIN(gdt.type_price) AS min_type_price, " + 
					"        TRUNC(avg(rv.rating),1) AS avg_rating, " + 
					"        COUNT(DISTINCT rv.review_idx) AS review_count " + 
					"    FROM goods g " + 
					"    LEFT JOIN goods_thumbnail gthmb ON gthmb.goods_idx = g.goods_idx " + 
					"    LEFT JOIN goods_type gt ON g.goods_idx = gt.goods_idx  " + 
					"    LEFT JOIN goods_detail_type gdt ON gt.goods_type_idx= gdt.goods_type_idx " + 
					"    LEFT JOIN goods_review rv ON gt.goods_type_idx = rv.goods_type_idx " + 
					"    LEFT JOIN city c ON g.city_idx = c.city_idx " + 
					"    LEFT JOIN country co ON co.country_idx = c.country_idx " + 
					"    WHERE (c.city_name = ? " + 
					"    OR co.country_name = ?) " + 
					"    GROUP BY g.goods_name, g.goods_ticket_type, c.city_name, g.goods_idx " + 
					") " + 
					"WHERE ROWNUM <= 5 ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,countryCity);
			pstmt.setString(2,countryCity);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int goodsIdx = rs.getInt("goods_idx");
				String minImgUrl = rs.getString("min_img_url");
				String goodsName = rs.getString("goods_name");
				String goodsTicketType = rs.getString("goods_ticket_type");
				String  cityName = rs.getString("city_name");
				int minTypePrice = rs.getInt("min_type_price");
				double avgRating = rs.getDouble("avg_rating");
				int reviewCount = rs.getInt("review_count");
				RecommendTicketDto dto = new RecommendTicketDto(goodsIdx, minImgUrl, goodsName, goodsTicketType, cityName, minTypePrice, avgRating, reviewCount);
				listRet.add(dto);
			}
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	try {
	    		if (rs != null) rs.close();
	    		if (pstmt != null) pstmt.close();
	    		if (conn != null) conn.close();
	    	} catch (SQLException e) {
	    		e.printStackTrace(); 
	    	}
	    }
		return listRet;
	}
	

}
