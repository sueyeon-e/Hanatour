package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.*;

public class CategoryDao {
	//Connection 객체
	Connection getConnection() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "project";
		String pw = "pass1234";
		
		Connection conn = null;
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url,id,pw);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return conn;
	}
	
// 카테고리 한줄 뿌리기 (이름, 설명, 가격, 별점, 댓글 수, 기간 )
	public ArrayList<ShowCategoryOneLineInfoDto> showCategoryOneLineInfo(String countryCity, String sortOrder ,String tour) {
	    ArrayList<ShowCategoryOneLineInfoDto> listRet = new ArrayList<ShowCategoryOneLineInfoDto>();    
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			 String sql = "SELECT  c.category_name, " + 
			    		"        c.category_idx, " + 
			            "        c.category_ex, " + 
			            "        c.travel_period, " + 
			            "        avg(tr.review_star) as review, " + 
			            "        count(tr.review_idx) as comment_amount, " + 
			            "        c.price, " + 
			            "        c.img_url, " + 
			            "        c.hanapack, " + 
			            "        c.package_tag, " + 
			            "        c.local_departure_tag " + 
			            "FROM category c " + 
			            "LEFT JOIN package p ON c.category_idx = p.category_idx " + 
			            "LEFT JOIN travel_review tr ON tr.package_idx = p.package_idx " + 
			            "LEFT JOIN category_region cr ON c.category_idx = cr.category_idx " + 
			            "LEFT JOIN city ci ON cr.city_idx = ci.city_idx " + 
			            "LEFT JOIN country co ON co.country_idx = ci.country_idx " + 
			            "WHERE (ci.city_name = ? OR co.country_name = ?)  " + 
			            "GROUP BY c.category_name, c.category_idx, c.category_ex, c.travel_period, c.price, c.img_url, c.hanapack, c.package_tag, c.local_departure_tag ";
			    if("review".equals(sortOrder)) {
			    	sql += " ORDER BY review DESC";
			    } else if ("lowPrice".equals(sortOrder)) {
			    	sql += " ORDER BY price";
			    } else if ("highPrice".equals(sortOrder)) {
			    	sql += "ORDER BY price DESC";
			    }
			    System.out.println(sql);
			    conn = getConnection();
			    pstmt = conn.prepareStatement(sql);
			    pstmt.setString(1, countryCity);
			    pstmt.setString(2, countryCity);
			    rs = pstmt.executeQuery();
			    while(rs.next()) {
			        String categoryName = rs.getString("category_name");
			        int categoryIdx = rs.getInt("category_idx");
			        String categoryEx = rs.getString("category_ex");
			        String travelPeriod = rs.getString("travel_period");
			        double reviewStar = rs.getDouble("review");
			        int commentAmount = rs.getInt("comment_amount");
			        int price = rs.getInt("price");
			        String imgUrl = rs.getString("img_url");
			        String hanapack = rs.getString("hanapack");
			        String packageTag = rs.getString("package_tag");
			        String localDepartureTag = rs.getString("local_departure_tag");
			        
			        ShowCategoryOneLineInfoDto dto = new ShowCategoryOneLineInfoDto(categoryName, categoryIdx, categoryEx, travelPeriod, reviewStar, commentAmount, price, imgUrl, hanapack, packageTag, localDepartureTag);
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
	
// 태그 정보 넣기 
	public ArrayList<CategoryTagDto> categoryTag() {
		ArrayList<CategoryTagDto> listRet = new ArrayList<CategoryTagDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  c.category_idx,  " + 
					"        ci.city_name    " + 
					"FROM category c  " + 
					"LEFT JOIN category_region cr ON c.category_idx = cr.category_idx  " + 
					"LEFT JOIN city ci ON ci.city_idx = cr.city_idx " + 
					"LEFT JOIN country co ON co.country_idx = ci.country_idx";
			conn = getConnection();
		    pstmt = conn.prepareStatement(sql);
		    rs = pstmt.executeQuery();
		    while(rs.next()) {
		    	String cityName = rs.getString("city_name");
		    	int categoryIdx = rs.getInt("category_idx");
		    	CategoryTagDto dto = new CategoryTagDto(cityName, categoryIdx);
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
	
//	하단 태그 뿌리기. 여래개의 정보 
	public ArrayList<CategoryBottomTagDto> categoryBottomTag() {
		ArrayList<CategoryBottomTagDto> listRet = new ArrayList<CategoryBottomTagDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT DISTINCT c.category_idx,  " + 
					"        ct.tag  " + 
					" FROM category c  " + 
					"LEFT JOIN category_tag ct ON c.category_idx = ct.category_idx " + 
					"LEFT JOIN category_region cr ON c.category_idx = cr.category_idx  " + 
					"LEFT JOIN city ci ON ci.city_idx = cr.city_idx " + 
					"LEFT JOIN country co ON co.country_idx = ci.country_idx";
			
			conn = getConnection();
		    pstmt = conn.prepareStatement(sql);
		    rs = pstmt.executeQuery();
		    while(rs.next()) {
		    	int categoryIdx = rs.getInt("category_idx");
		    	String tag = rs.getString("tag");
		    	CategoryBottomTagDto dto = new CategoryBottomTagDto(categoryIdx , tag);
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

// 카테고리 패키지 정보
	public ArrayList<CategoryPackageInfoDto> cetegoryPackageInfo(String departureDate, String flight) {
		ArrayList<CategoryPackageInfoDto> listRet = new ArrayList<CategoryPackageInfoDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT c.category_idx, " + 
					"       p.package_idx, " + 
					"       p.package_name, " + 
					"       p.travel_period, " + 
					"       p.shopping, " + 
					"       p.shopping_times, " + 
					"       p.guide, " + 
					"       pp.adult, " + 
					"       MAX(i.star) AS max_star, " + 
					"       a.logo, " + 
					"       a.name, " + 
					"       MIN(pf.departure_date) AS departure_date, " + 
					"       pi.inn " + 
					"FROM package p " + 
					"LEFT JOIN category c ON c.category_idx = p.category_idx " + 
					"LEFT JOIN package_price pp ON pp.package_idx = p.package_idx " + 
					"LEFT JOIN package_flight pf ON p.package_idx = pf.package_idx " + 
					"LEFT JOIN package_inn pi ON p.package_idx = pi.package_idx " + 
					"LEFT JOIN inn i ON i.inn_idx = pi.inn_idx " + 
					"LEFT JOIN airline_ticket at ON at.ticket_idx = pf.ticket_idx " + 
					"LEFT JOIN airline a ON a.iata = at.airline_iata "; 
					
			
			if(flight != null) {
				sql += "WHERE a.name = ? ";
			}
			
			sql += "GROUP BY c.category_idx, p.package_idx, p.package_name, p.travel_period, p.shopping, p.shopping_times, p.guide, pp.adult, a.logo, a.name,pi.inn " + 
					"HAVING TO_CHAR(MIN(pf.departure_date), 'YYYY-MM-DD') = ? ";
					
			conn = getConnection();
		    pstmt = conn.prepareStatement(sql);
		    if (flight != null) {
		        pstmt.setString(1, flight);
		        pstmt.setString(2, departureDate);
		    } else {
		        pstmt.setString(1, departureDate);
		    }
		    rs = pstmt.executeQuery();
		    while(rs.next()) {
		    	int categoryIdx = rs.getInt("category_idx");
		    	int packageIdx = rs.getInt("package_idx");
		    	String pacakgeName = rs.getString("package_name");
		    	String travelPeriod = rs.getString("travel_period");
		    	String shopping = rs.getString("shopping");
		    	String shoppingTimes = rs.getString("shopping_times");
		    	String guide = rs.getString("guide");
		    	int adult = rs.getInt("adult");
		    	int maxStar = rs.getInt("max_star");
		    	String logo = rs.getString("logo");
		    	String name = rs.getString("name");
		    	String inn = rs.getString("inn");
		    	CategoryPackageInfoDto dto = new CategoryPackageInfoDto(categoryIdx, packageIdx, pacakgeName, travelPeriod, shopping, shoppingTimes, guide, adult, maxStar, logo, name, inn) ;
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
	
// 카테고리 패키지 항공정보 	
	public ArrayList<CategoryPackageFlightInfoDto> categoryPackageFligthInfo() {
		ArrayList<CategoryPackageFlightInfoDto> listRet = new ArrayList<CategoryPackageFlightInfoDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  p.package_idx, " + 
					"        TO_CHAR(MIN(pf.departure_date), 'MM/DD Day HH24:MI') as departure_time, " + 
					"        TO_CHAR(MAX(pf.arrival_date), 'MM/DD Day HH24:MI') as arrival_time " + 
					"FROM package p " + 
					"LEFT JOIN package_flight pf ON p.package_idx = pf.package_idx " + 
					"LEFT JOIN airline_ticket at ON at.ticket_idx = pf.ticket_idx " + 
					"LEFT JOIN airline al ON al.iata = at.airline_iata " + 
					"LEFT JOIN airport dep ON dep.iata = at.departure_iata " + 
					"LEFT JOIN airport arr ON arr.iata = at.arrival_iata " + 
					"GROUP BY p.package_idx";
			conn = getConnection();
		    pstmt = conn.prepareStatement(sql);
		    rs = pstmt.executeQuery();
		    while(rs.next()) {
		    	int packageIdx = rs.getInt("package_idx");
		    	String departureTime = rs.getString("departure_time");
		    	String arrivalTime = rs.getString("arrival_time");
		    	CategoryPackageFlightInfoDto dto = new CategoryPackageFlightInfoDto(packageIdx, departureTime, arrivalTime);
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
	
// 나라와 국기 
	public ArrayList<CategoryFlagDto> categoryFlag(String countryCity) {
		ArrayList<CategoryFlagDto> listRet = new ArrayList<CategoryFlagDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT DISTINCT co.country_name, " + 
					"        co.flag_img " + 
					"FROM country co " + 
					"INNER JOIN city ci ON co.country_idx = ci.country_idx " + 
					"WHERE ci.city_name = ? " + 
					"OR co.country_name = ?" ;
			conn = getConnection();
		    pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, countryCity);
		    pstmt.setString(2, countryCity);
		    rs = pstmt.executeQuery();
		    while(rs.next()) {
		    	String countryName = rs.getString("country_name");
		    	String flagImg = rs.getString("flag_img");
		    	CategoryFlagDto dto = new CategoryFlagDto(countryName, flagImg);
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
