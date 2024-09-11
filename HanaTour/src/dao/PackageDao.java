package dao;
import java.sql.*;
import java.util.ArrayList;
import dto.*;

public class PackageDao {
	//Connection 객체
	Connection getConnection() {
	    String driver = "oracle.jdbc.driver.OracleDriver";
	    String url = "jdbc:oracle:thin:@localhost:1521:xe";
	    String id = "project";
	    String pw = "pass1234";
	    Connection conn = null;

	    try {
	        Class.forName(driver);
	        conn = DriverManager.getConnection(url, id, pw);
	    } catch (ClassNotFoundException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return conn;
	}

	
	public ArrayList<PackageTopOneLineInfoDto> packageTopOneLineInfo(int packageIdx) {
	    ArrayList<PackageTopOneLineInfoDto> ptoliDto = new ArrayList<PackageTopOneLineInfoDto>();
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    try {
	        conn = getConnection();
	        String sql = "SELECT p.package_number, " + 
	                     "        p.package_name, " + 
	                     "        p.package_ex, " + 
	                     "        p.travel_period, " + 
	                     "        p.flight, " + 
	                     "        p.airline, " + 
	                     "        p.free_tour, " + 
	                     "        p.shopping, " + 
	                     "        p.shopping_times, " + 
	                     "        p.group_travel, " + 
	                     "        p.leader,  " + 
	                     "        p.guide, " + 
	                     "        p.guide_fee, " + 
	                     "        p.optional_tour, " + 
	                     "        p.review_star, " + 
	                     "        p.review_comment, " + 
	                     "        pp.adult " + 
	                     " FROM package p " + 
	                     " LEFT JOIN package_price pp ON pp.package_idx = p.package_idx " + 
	                     " WHERE p.package_idx = ? ";

	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, packageIdx);
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            String packageNumber = rs.getString("package_number");
	            String packageName = rs.getString("package_name");
	            String packageEx = rs.getString("package_ex");
	            String travelPeriod = rs.getString("travel_period");
	            String flight = rs.getNString("flight");
	            String airline  = rs.getString("airline");
	            String freeTour = rs.getString("free_tour");
	            String shopping = rs.getString("shopping");
	            String shoppingTimes = rs.getString("shopping_times");
	            String groupTravel = rs.getString("group_travel");
	            String leader = rs.getString("leader");
	            String guide = rs.getString("guide");
	            String guideFee = rs.getString("guide_fee");
	            String optionalTour = rs.getString("optional_tour");
	            String reviewStar = rs.getString("review_star");
	            String reviewComment = rs.getString("review_comment");
	            String adult = rs.getString("adult");
	            PackageTopOneLineInfoDto dto = new PackageTopOneLineInfoDto(packageNumber, packageName, packageEx, travelPeriod, flight, airline, freeTour, shopping, shoppingTimes, groupTravel, leader, guide, guideFee, optionalTour, reviewStar, reviewComment, adult); 
	            ptoliDto.add(dto);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace(); // 예외 발생 시 로그 출력
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (pstmt != null) pstmt.close();
	            if (conn != null) conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace(); 
	        }
	    }
	    return ptoliDto;
	}

	
// package_top 이미지 
	public ArrayList<String> packageTopImg(int packageIdx) {
		ArrayList<String> listRet = new ArrayList<String>();
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    
	    try {
	    	String sql = "SELECT pt.img_url " + 
					"FROM package p " + 
					"LEFT JOIN package_thumbnail pt ON p.package_idx = pt.package_idx " + 
					"WHERE p.package_idx = ? " + 
					"ORDER BY pt.img_order ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String imgUrl = rs.getString("img_url");
				listRet.add(imgUrl);
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
	
// package 상단 tag 글자 
	public ArrayList<String> packageTopTag(int packageIdx) {
		ArrayList<String> listRet = new ArrayList<String>();
		Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
		try {
			String sql = "SELECT pt.tag " + 
					"FROM package p " + 
					"LEFT JOIN package_tag pt ON p.package_idx = pt.package_idx " + 
					"WHERE p.package_idx = ? " ;
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String tag = rs.getString("Tag");
				listRet.add(tag);
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
	
// 패키지 항공 두줄 정보 
	public ArrayList<PackageTwoFlightInfoDto> packageTwoFlightInfo(int packageIdx) {
		ArrayList<PackageTwoFlightInfoDto> listRet = new ArrayList<PackageTwoFlightInfoDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT " + 
					"    TO_CHAR(MAX(pf.departure_date), 'YYYY.MM.DD (DY) HH24:MI') AS departure_date, " + 
					"    TO_CHAR(MAX(pf.arrival_date), 'YYYY.MM.DD (DY) HH24:MI') AS arrival_date, " + 
					"    at.flight_number, " + 
					"    TRUNC((MAX(pf.arrival_date) - MIN(pf.departure_date)) * 24) || ' 시간 ' || " + 
					"    TRUNC( " + 
					"        (MAX(pf.arrival_date) - MIN(pf.departure_date)) * 24 * 60 - " + 
					"        TRUNC((MAX(pf.arrival_date) - MIN(pf.departure_date)) * 24) * 60 " + 
					"    ) || '분' AS period " + 
					"FROM package p " + 
					"LEFT JOIN package_flight pf ON p.package_idx = pf.package_idx " + 
					"LEFT JOIN airline_ticket at ON at.ticket_idx = pf.ticket_idx " + 
					"LEFT JOIN airline a ON a.iata = at.departure_iata  " + 
					"WHERE p.package_idx = ? " + 
					"GROUP BY at.flight_number " +
					"ORDER BY departure_date ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				 String departureDate = rs.getString("departure_date");
				 String arrivalDate = rs.getString("arrival_date");
				 String flightNumber = rs.getString("flight_number");
				 String period = rs.getString("period");
				 PackageTwoFlightInfoDto dto = new PackageTwoFlightInfoDto(departureDate, arrivalDate, flightNumber, period);
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
	
// 패키지 항공 한줄 정보 
	public ArrayList<PackageOneFlightInfoDto> packageOneFlightInfo(int packageIdx) {
		ArrayList<PackageOneFlightInfoDto> listRet = new ArrayList<PackageOneFlightInfoDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  TRUNC( MAX(pf.arrival_date) - MIN(pf.departure_date)) AS period, " + 
					"        al.logo, " + 
					"        al.name " + 
					"FROM package p " + 
					"LEFT JOIN package_flight pf ON p.package_idx = pf.package_idx " + 
					"LEFT JOIN airline_ticket at ON pf.ticket_idx = at.ticket_idx " + 
					"LEFT JOIN airline al ON al.iata = at.airline_iata " + 
					"WHERE p.package_idx = ? " + 
					"GROUP BY al.logo, al.name ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int period = rs.getInt("period");
				String logo = rs.getString("logo");
				String name = rs.getString("name");
				PackageOneFlightInfoDto dto = new PackageOneFlightInfoDto(period, logo, name);
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
	
// 여행지역과 예약현황
	public ArrayList<PackageReservationInfoDto> packageReservationInfo(int packageIdx) {
		ArrayList<PackageReservationInfoDto> listRet = new ArrayList<PackageReservationInfoDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  p.travel_city, " + 
					"        p.total_seat, " + 
					"        p.minimum_number, " + 
					"        COUNT(CASE WHEN p.package_idx = 1 THEN 1 END) AS reservation_count " + 
					"FROM package p " + 
					"LEFT JOIN travel_reservation pr ON p.package_idx = pr.package_idx " + 
					"WHERE p.package_idx = ? " + 
					"GROUP BY p.travel_city, p.total_seat, p.minimum_number ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String travelCity = rs.getString("travel_city");
				int totalSeat = rs.getInt("total_seat");
				int minimumNumber = rs.getInt("minimum_number");
				int reservationCount = rs.getInt("reservation_count");
				PackageReservationInfoDto dto = new PackageReservationInfoDto(travelCity, totalSeat, minimumNumber, reservationCount);
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
	
// 패키지 가격 
	public ArrayList<PackagePriceDto> packagePrice(int packageIdx) {
		ArrayList<PackagePriceDto> listRet = new ArrayList<PackagePriceDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  pp.adult,  " + 
					"        pp.child,  " + 
					"        pp.infant " + 
					"FROM package_price pp  " + 
					"INNER JOIN package p ON pp.package_idx = p.package_idx  " + 
					" WHERE pp.package_idx = ? ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int adult = rs.getInt("adult");
				int child = rs.getInt("child");
				int infant = rs.getInt("infant");
				PackagePriceDto dto = new PackagePriceDto(adult, child, infant);
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
	
// 패키지 정보 
	public ArrayList<PackageInfoDto> packageInfo(int packageIdx) {
		ArrayList<PackageInfoDto> listRet = new ArrayList<PackageInfoDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  package_idx, " + 
					"        contain, " + 
					"        bold_text, " + 
					"        thin_text         " + 
					"FROM package_info " + 
					"WHERE package_idx = ? " + 
					"ORDER BY info_order";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//int packageIdx = rs.getInt("package_idx");
				String contain = rs.getString("contain");
				String boldText = rs.getString("bold_text");
				String thinText = rs.getString("thin_text");
				PackageInfoDto dto = new PackageInfoDto(contain, boldText, thinText);
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
	
// 	패키지 경비 
	public ArrayList<PackageContainInfoDto> packageContainInfo(int packageIdx) {
		ArrayList<PackageContainInfoDto> listRet = new ArrayList<PackageContainInfoDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  package_idx, " + 
					"        contain, " + 
					"        non_contain, " + 
					"        choice_price " + 
					"FROM package  " + 
					"WHERE package_idx = ? " ;
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String contain = rs.getString("contain");
				String nonContain = rs.getString("non_contain");
				String choicePrice = rs.getString("choice_price");      
				PackageContainInfoDto dto = new PackageContainInfoDto(contain, nonContain, choicePrice);
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
	
//	패키지 예약 유의사항 
	public ArrayList<PackageReservationNoticeDto> packageReservationNotice(int packageIdx) {
		ArrayList<PackageReservationNoticeDto> listRet = new ArrayList<PackageReservationNoticeDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  rn.package_idx, " + 
					"        rnt2.bold_text, " + 
					"        rnt2.thin_text " + 
					"FROM reservation_notice rn " + 
					"LEFT JOIN reservation_notice_type2 rnt2 ON rn.notice_type2_idx = rnt2.notice_type2_idx " + 
					"WHERE rn.package_idx = ? " + 
					"ORDER BY rn.notice_order";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String boldText = rs.getString("bold_text");
				String thinText = rs.getString("thin_text");
				PackageReservationNoticeDto dto = new PackageReservationNoticeDto(boldText, thinText);
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
	
//	패키지 미팅 정보 
	public ArrayList<PackageMeetingInfoDto> packageMeetingInfo(int packageIdx) {
		ArrayList<PackageMeetingInfoDto> listRet = new ArrayList<PackageMeetingInfoDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT p.leader, " + 
					"       p.guide, " + 
					"       TO_CHAR(pmi.info_date, 'MM\"월\" DD\"일\" AM HH24:MI') AS info_date, " + 
					"       pmi.location, " + 
					"       pmi.map_url, " + 
					"       pmi.purple_info, " + 
					"       pmi.thin_info " + 
					"FROM package p " + 
					"LEFT JOIN package_meeting_info pmi ON p.package_idx = pmi.package_idx " + 
					"WHERE p.package_idx = ? ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String leader = rs.getString("leader");
				String guide = rs.getString("guide");
				String infoDate = rs.getString("info_date");
				String location = rs.getString("location");
				String mapUrl = rs.getString("map_url");
				String purpleInfo = rs.getString("purple_info");
				String thinInfo = rs.getString("thin_info");
				PackageMeetingInfoDto dto = new PackageMeetingInfoDto(leader, guide, infoDate, location, mapUrl, purpleInfo, thinInfo);
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
	
// 탭 호텔&관광지 속 관광지 정보 
	public ArrayList<HotelAttractionAttractionDto> HotelAttractionAttraction(int packageIdx) {
		ArrayList<HotelAttractionAttractionDto> listRet = new ArrayList<HotelAttractionAttractionDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  DISTINCT tp.day, " + 
					"        att.attraction_kor, " + 
					"        atti.img_url, " + 
					"        att.detailed_ex, " + 
					"        MIN(TO_CHAR(pf.departure_date,'YYYY.MM.DD\"(\"DY\")\"')) as attraction_date " + 
					"FROM package p " + 
					"LEFT JOIN package_flight pf ON p.package_idx = pf.package_idx " + 
					"LEFT JOIN travel_plan_detail tpd ON tpd.package_idx = p.package_idx " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx " + 
					"LEFT JOIN plan_type5 pt5 ON pt5.plan_type5_idx = tpd.plan_type5_idx " + 
					"LEFT JOIN plan_type5_detail ptd5 ON  ptd5.plan_type5_idx = pt5.plan_type5_idx " + 
					"LEFT JOIN attraction att ON att.attraction_idx = ptd5.attraction_idx " + 
					"LEFT JOIN attraction_img atti ON atti.attraction_idx = att.attraction_idx " + 
					"WHERE p.package_idx = ? " + 
					"AND atti.img_order = 1 " + 
					"AND att.attraction_kor IS NOT NULL " + 
					"GROUP BY tp.day, att.attraction_kor, atti.img_url, att.detailed_ex " + 
					"ORDER BY tp.day";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int day = rs.getInt("day");
				String attractionKor = rs.getString("attraction_kor");
				String imgUrl = rs.getString("img_url");
				String detailedEx = rs.getString("detailed_ex");
				String attractionDate = rs.getString("attraction_date");
				HotelAttractionAttractionDto dto = new HotelAttractionAttractionDto(day, attractionKor, imgUrl, detailedEx, attractionDate);
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
	
// 탭 호텔&관광지 호텔 작은 상자 정보 
	public ArrayList<TabSmallHotelBoxDto> tabSmallHotelBox(int packageIdx) {
		ArrayList<TabSmallHotelBoxDto> listRet = new ArrayList<TabSmallHotelBoxDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  co.country_name || '('|| ci.city_name || ')' as location, " + 
					"        i.inn_kor " + 
					"FROM package_inn pi  " + 
					"LEFT JOIN inn i ON pi.inn_idx = i.inn_idx " + 
					"LEFT JOIN city ci ON ci.city_idx = i.city_idx " + 
					"LEFT JOIN country co ON co.country_idx = ci.country_idx " + 
					"WHERE package_idx = ? " + 
					"AND i.inn_kor NOT LIKE '%숙박%' " +
					"AND ci.city_name IS NOT NULL ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String location = rs.getString("location");
				String innKor = rs.getString("inn_kor");
				TabSmallHotelBoxDto dto = new TabSmallHotelBoxDto(location, innKor);
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

// 	탭 호텔&관광지 호텔 전체 정보 
	public ArrayList<TabHotelInfoDto> tabHotelInfo(int packageIdx) {
		ArrayList<TabHotelInfoDto> listRet = new ArrayList<TabHotelInfoDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  co.country_name || ','|| ci.city_name  as location, " + 
					"        i.inn_kor, " + 
					"        i.inn_eng, " + 
					"        i.address, " + 
					"        i.phone, " + 
					"        i.homepage_url, " + 
					"        i.famous_spot, " + 
					"        i.floors, " + 
					"        i.room_num, " + 
					"        i.checkin_checkout, " + 
					"        ii.inn_img_url " + 
					"FROM package_inn pi  " + 
					"LEFT JOIN inn i ON pi.inn_idx = i.inn_idx " + 
					"LEFT JOIN city ci ON ci.city_idx = i.city_idx " + 
					"LEFT JOIN country co ON co.country_idx = ci.country_idx " + 
					"LEFT JOIN inn_img ii ON ii.inn_idx = i.inn_idx " + 
					"WHERE package_idx = ? " + 
					"AND ci.city_name IS NOT NULL " + 
					"AND i.inn_kor NOT LIKE '%숙박%' " +
					"AND ii.num = 1 ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String location = rs.getString("location");
				String innKor = rs.getString("inn_kor");
				String innEng = rs.getString("inn_eng");
				String address = rs.getString("address");
				String phone = rs.getString("phone");
				String homepageUrl = rs.getString("homepage_url");
				String famousSpot = rs.getString("famous_spot");
				String floors = rs.getString("floors");
				String roomNum = rs.getString("room_num");
				String checkInCheckOut = rs.getString("checkin_checkout");
				String imgUrl = rs.getString("inn_img_url");
				TabHotelInfoDto dto = new TabHotelInfoDto(location, innKor, innEng, address, phone, homepageUrl, famousSpot, floors, roomNum, checkInCheckOut, imgUrl);
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
	
//	 관광&호텔 호텔 부대정보	
	public ArrayList<HotelAmenityDto> hotelAmenity() {
		ArrayList<HotelAmenityDto> listRet = new ArrayList<HotelAmenityDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  i.inn_kor, " + 
					"        at.amenity_title_name " + 
					"FROM amenity am  " + 
					"LEFT JOIN amenity_subtitle amsub ON amsub.amenity_subt_idx = am.amenity_subt_idx " + 
					"LEFT JOIN inn i ON i.inn_idx = am.inn_idx  " + 
					"LEFT JOIN amenity_title at ON at.amenity_title_idx = amsub.amenity_title_idx " + 
					"WHERE at.amenity_title_name IS NOT NULL";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String innKor = rs.getString("inn_kor");
				String titleName = rs.getString("amenity_title_name");
				HotelAmenityDto dto = new HotelAmenityDto(innKor, titleName);
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
	
//	관광&호텔 호텔 객실시설정보 
	public ArrayList<HotelFacilityDto> hotelFacility() {
		ArrayList<HotelFacilityDto> listRet = new ArrayList<HotelFacilityDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  i.inn_kor, " + 
					"        ft.facility_title_name " + 
					"FROM inn i " + 
					"LEFT JOIN facility f ON f.inn_idx = i.inn_idx " + 
					"LEFT JOIN facility_subtitle fsub ON fsub.facility_subt_idx = f.facility_subt_idx " + 
					"LEFT JOIN facility_title ft ON ft.facility_title_idx = fsub.facility_title_idx " + 
					"WHERE ft.facility_title_name IS NOT NULL";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String innKor = rs.getString("inn_kor");
				String titleName = rs.getString("facility_title_name");
				HotelFacilityDto dto = new HotelFacilityDto(innKor, titleName);
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
	
//  관광&호텔 관광지 일차 계산 (해결안됨)
	public String countDay(String date) {
		String countDate = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT TO_CHAR(TO_DATE( ? ,'YYYY.MM.DD\"(\"DY\")\"')+1,'YYYY.MM.DD(DY)') as date1 " + 
					"FROM dual";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			rs = pstmt.executeQuery();
			while (rs.next()) {
		        countDate = rs.getString("date1"); // 변수 이름 중복 문제 해결
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
	    return countDate;
	}
	
// 해외안전정보 
	public ArrayList<SafetyInfoDto>safetyInfo(int packageIdx) {
		ArrayList<SafetyInfoDto> listRet = new ArrayList<SafetyInfoDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  co.country_name, " + 
					"        co.accident, " + 
					"        co.contact, " + 
					"        si.not_applicable, " + 
					"        si.travel_notice, " + 
					"        si.travel_caution, " + 
					"        si.recommed_withdrawal " + 
					"FROM package p  " + 
					"LEFT JOIN package_city pc ON p.package_idx = pc.package_idx " + 
					"LEFT JOIN city ci ON ci.city_idx = pc.city_idx " + 
					"LEFT JOIN country co ON co.country_idx = ci.country_idx " + 
					"LEFT JOIN safety_info si ON si.country_idx = co.country_idx " + 
					"WHERE p.package_idx = ?  ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String countryName = rs.getString("country_name");
				String accident = rs.getString("accident");
				String contact = rs.getString("contact");
				String notApplicable = rs.getString("not_applicable");
				String travelNotice = rs.getString("travel_notice");
				String travelCaution = rs.getString("travel_caution");
				String recommendWithdrawal = rs.getString("recommed_withdrawal");
				SafetyInfoDto dto = new SafetyInfoDto(countryName, accident, contact, notApplicable, travelNotice, travelCaution, recommendWithdrawal);
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
	
//	선택관광 
	public ArrayList<OptionalTourDto> optionalTourContent(int packageIdx) {
		ArrayList<OptionalTourDto> listRet = new ArrayList<OptionalTourDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  co.country_name, " + 
					"        ci.city_name, " + 
					"        ot.tour_name, " + 
					"        ot.ex, " + 
					"        ot.img_url, " + 
					"        ot.fee, " + 
					"        ot.period, " + 
					"        ot.alternative_schedule, " + 
					"        ot.non_selected_guide " + 
					"FROM package p  " + 
					"LEFT JOIN package_optional_tour pot ON p.package_idx = pot.package_idx " + 
					"LEFT JOIN optional_tour ot ON ot.optional_tour_idx = pot.optional_tour_idx " + 
					"LEFT JOIN package_city pc ON p.package_idx = pc.package_idx " + 
					"LEFT JOIN city ci ON ci.city_idx = pc.city_idx " + 
					"LEFT JOIN country co ON co.country_idx = ci.country_idx " + 
					"WHERE p.package_idx = ? ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String countryName = rs.getString("country_name");
				String cityName = rs.getString("city_name");
				String tourName = rs.getString("tour_name");
				String ex = rs.getString("ex");
				String imgUrl = rs.getString("img_url");
				String fee = rs.getString("fee");
				String period = rs.getString("period");
				String alternativeSchedule = rs.getString("alternative_schedule");
				String nonSelectedGuide = rs.getString("non_selected_guide");
				OptionalTourDto dto = new OptionalTourDto(countryName, cityName, tourName, ex, imgUrl, fee, period, alternativeSchedule, nonSelectedGuide);
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
	
	public ArrayList<OptionalTourDto> optionalTourTitle(int packageIdx) {
		ArrayList<OptionalTourDto> listRet = new ArrayList<OptionalTourDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  DISTINCT co.country_name, " + 
					"        ci.city_name " + 
					"FROM package p  " + 
					"LEFT JOIN package_optional_tour pot ON p.package_idx = pot.package_idx " + 
					"LEFT JOIN optional_tour ot ON ot.optional_tour_idx = pot.optional_tour_idx " + 
					"LEFT JOIN package_city pc ON p.package_idx = pc.package_idx " + 
					"LEFT JOIN city ci ON ci.city_idx = pc.city_idx " + 
					"LEFT JOIN country co ON co.country_idx = ci.country_idx " + 
					"WHERE p.package_idx = ? ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String countryName = rs.getString("country_name");
				String cityName = rs.getString("city_name");
				OptionalTourDto dto = new OptionalTourDto(countryName, cityName);
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
	
// 여행일정 타이틀
	public ArrayList<ScheduleTitleDto> scheduleTitle(int packageIdx) {
		ArrayList<ScheduleTitleDto> listRet = new ArrayList<ScheduleTitleDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  DISTINCT tp.travel_plan_idx, " + 
					"        tp.day, " + 
					"        tp.title, " + 
					"        tp.subtitle " + 
					"FROM package p  " + 
					"LEFT JOIN travel_plan_detail tpd ON p.package_idx = tpd.package_idx " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx " + 
					"WHERE p.package_idx = ? " + 
					"ORDER BY day";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int travelPlanIdx = rs.getInt("travel_plan_idx");
				int day = rs.getInt("day");
				String title = rs.getString("title");
				String subtitle = rs.getString("subtitle");
				ScheduleTitleDto dto = new ScheduleTitleDto(travelPlanIdx, day, title, subtitle);
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
	
// 	여행일정 순서 
	public ArrayList<ScheduleOrderDto> scheduleOrder(int packageIdx) {
		ArrayList<ScheduleOrderDto> listRet = new ArrayList<ScheduleOrderDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  tp.day, " + 
					"        tpd.travel_plan_idx, " + 
					"        tpd.plan_detail_order, " + 
					"        tpd.plan_type, " + 
					"        tpd.plan_type1_idx, " + 
					"        tpd.plan_type2_idx, " + 
					"        tpd.plan_type3_idx, " + 
					"        tpd.plan_type4_idx, " + 
					"        tpd.plan_type5_idx, " + 
					"        tpd.plan_type6_idx, " + 
					"        tpd.plan_type7_idx, " + 
					"        tpd.plan_type8_idx, " + 
					"        tpd.plan_type9_idx, " + 
					"        tpd.plan_type10_idx " + 
					"FROM package p  " + 
					"LEFT JOIN travel_plan_detail tpd ON p.package_idx = tpd.package_idx " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx " + 
					"WHERE p.package_idx = ? " + 
					"ORDER BY tp.day, tpd.plan_detail_order " ;
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int day = rs.getInt("day");
				int travelPlanIdx = rs.getInt("travel_plan_idx");
				int planDetailOrder = rs.getInt("plan_detail_order");
				int planType = rs.getInt("plan_type");
				int planType1Idx = rs.getInt("plan_type1_idx");
				int planType2Idx = rs.getInt("plan_type2_idx");
				int planType3Idx = rs.getInt("plan_type3_idx");
				int planType4Idx = rs.getInt("plan_type4_idx");
				int planType5Idx = rs.getInt("plan_type5_idx");
				int planType6Idx = rs.getInt("plan_type6_idx");
				int planType7Idx = rs.getInt("plan_type7_idx");
				int planType8Idx = rs.getInt("plan_type8_idx");
				int planType9Idx = rs.getInt("plan_type9_idx");
				int planType10Idx = rs.getInt("plan_type10_idx");
				ScheduleOrderDto dto = new ScheduleOrderDto(day, travelPlanIdx, planDetailOrder, planType, planType1Idx, planType2Idx, planType3Idx, planType4Idx, planType5Idx, planType6Idx, planType7Idx, planType8Idx, planType9Idx, planType10Idx);
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
	
// 여행일정 유형1 항공 정보 
	public ArrayList<Type1FlightDto> type1Flight(int packageIdx) {
		ArrayList<Type1FlightDto> listRet = new ArrayList<Type1FlightDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT DISTINCT  " + 
					"        al.name, " + 
					"        al.logo, " + 
					"        at.flight_number, " + 
					"        TO_CHAR(at.departure_time, 'YYYY.MM.DD(DY)') as departure_date, " + 
					"        TO_CHAR(at.departure_time, 'HH24:MI') as departure_time, " + 
					"        TO_CHAR(at.arrival_time,'YYYY.MM.DD(DY)') as arrival_date, " + 
					"        TO_CHAR(at.arrival_time,'HH24:MI') as arrival_time, " + 
					"        apd.city_kor || ' ' || apd.iata as departure, " + 
					"        apa.city_kor || ' ' || apa.iata as arrival, " + 
					"        TRUNC((at.arrival_time - at.departure_time) * 24) || '시간 ' || " + 
					"        MOD(TRUNC((at.arrival_time - at.departure_time) * 1440), 60) || '분' as period, " + 
					"        tpd.plan_detail_order, " + 
					"        tpd.plan_type1_idx, " + 
					"        tp.day " + 
					"FROM package p  " + 
					"LEFT JOIN travel_plan_detail tpd ON tpd.package_idx = p.package_idx " + 
					"LEFT JOIN plan_type1 pt1 ON tpd.plan_type1_idx = pt1.plan_type1_idx " + 
					"LEFT JOIN airline_ticket at ON at.ticket_idx = pt1.ticket_idx " + 
					"LEFT JOIN airline al ON al.iata = at.airline_iata " + 
					"LEFT JOIN airport apd ON apd.iata = at.departure_iata " + 
					"LEFT JOIN airport apa ON apa.iata = at.arrival_iata " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx " + 
					"WHERE tpd.package_idx = ? " + 
					"AND tpd.plan_type = 1 " + 
					"ORDER BY tp.day, tpd.plan_detail_order ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				String logo = rs.getString("logo");
				String flightNumber = rs.getString("flight_number");
				String departureDate = rs.getString("departure_date");
				String departureTime = rs.getString("departure_time");
				String arrivalDate = rs.getString("arrival_date");
				String arrivalTime = rs.getString("arrival_time");
				String departure = rs.getString("departure");
				String arrival = rs.getString("arrival");
				String period = rs.getString("period");
				int planDetailOrder = rs.getInt("plan_detail_order");
				int planType1Idx = rs.getInt("plan_type1_idx");
				int day = rs.getInt("day");
				Type1FlightDto dto = new Type1FlightDto(name, logo, flightNumber, departureDate, departureTime, arrivalDate, arrivalTime, departure, arrival, period, planDetailOrder, planType1Idx, day);
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
	
// 여행일정 유형2 도시 정보 	
	public ArrayList<Type2CityDto> type2City(int packageIdx) {
		ArrayList<Type2CityDto> listRet = new ArrayList<Type2CityDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  tpd.plan_type2_idx, " + 
					"        ci.city_name, " + 
					"        pt2.thin_text, " + 
					"        tp.day " + 
					"FROM package p " + 
					"LEFT JOIN travel_plan_detail tpd ON tpd.package_idx = p.package_idx " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx " + 
					"LEFT JOIN plan_type2 pt2 ON tpd.plan_type2_idx = pt2.plan_type2_idx " + 
					"LEFT JOIN city ci ON ci.city_idx = pt2.city_idx " + 
					"WHERE tpd.package_idx = ? " + 
					"AND tpd.plan_type = 2 " + 
					"ORDER BY tp.day, tpd.plan_detail_order";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int planType2Idx = rs.getInt("plan_type2_idx");
				String cityName = rs.getString("city_name");
				String thinText = rs.getString("thin_text");
				int day = rs.getInt("day");
				Type2CityDto dto = new Type2CityDto(planType2Idx, cityName, thinText, day);
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

// 여행일정 유형3 얇은 글씨
	public ArrayList<Type3ThinTextDto> type3ThinText(int packageIdx) {
		ArrayList<Type3ThinTextDto> listRet = new ArrayList<Type3ThinTextDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT tpd.plan_type3_idx, " + 
					"        pt3.thin_text, " + 
					"        tp.day " + 
					"FROM package p " + 
					"LEFT JOIN travel_plan_detail tpd ON tpd.package_idx = p.package_idx " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx " + 
					"LEFT JOIN plan_type3 pt3 ON tpd.plan_type3_idx = pt3.plan_type3_idx " + 
					"WHERE tpd.package_idx = ? " + 
					"AND tpd.plan_type = 3 " + 
					"ORDER BY tp.day, tpd.plan_detail_order";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int planType3Idx = rs.getInt("plan_type3_idx");
				String thin_text = rs.getString("thin_text");
				int day = rs.getInt("day");
				Type3ThinTextDto dto = new Type3ThinTextDto(planType3Idx, thin_text, day);
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

// 여행일정 유형4 굵은 글씨
	public ArrayList<Type4BoldTextDto> type4BoldText(int packageIdx) {
		ArrayList<Type4BoldTextDto> listRet = new ArrayList<Type4BoldTextDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  tpd.plan_type4_idx, " + 
					"        pt4.bold_text, " + 
					"        pt4.thin_text, " + 
					"        tp.day " + 
					"FROM package p " + 
					"LEFT JOIN travel_plan_detail tpd ON tpd.package_idx = p.package_idx " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx " + 
					"LEFT JOIN plan_type4 pt4 ON tpd.plan_type4_idx = pt4.plan_type4_idx " + 
					"WHERE tpd.package_idx = ? " + 
					"AND tpd.plan_type = 4 " + 
					"ORDER BY tp.day, tpd.plan_detail_order ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int planType4Idx= rs.getInt("plan_type4_idx");
				String boldText = rs.getString("bold_text");
				String thinText = rs.getString("thin_text");
				int day = rs.getInt("day");
				Type4BoldTextDto dto = new Type4BoldTextDto(planType4Idx, boldText, thinText, day);
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
	
// 여행일정 유형5 관광지 
	public ArrayList<Type5AttractionDto> type5Attraction(int packageIdx) {
		ArrayList<Type5AttractionDto> listRet = new ArrayList<Type5AttractionDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  DISTINCT pt5.title, " + 
					"        tpd.plan_type5_idx,  " + 
					"        att.attraction_kor, " + 
					"        att.attraction_eng,  " + 
					"        att.ex, " + 
					"        att.detailed_ex,  " + 
					"        tp.day,  " + 
					"        tpd.plan_detail_order,  " + 
					"        ptd.attraction_idx  " + 
					"FROM package p  " + 
					"LEFT JOIN travel_plan_detail tpd ON tpd.package_idx = p.package_idx  " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx  " + 
					"LEFT JOIN plan_type5 pt5 ON tpd.plan_type5_idx = pt5.plan_type5_idx   " + 
					"LEFT JOIN plan_type5_detail ptd ON ptd.plan_type5_idx = pt5.plan_type5_idx  " + 
					"LEFT JOIN attraction att ON att.attraction_idx = ptd.attraction_idx   " + 
					"WHERE tpd.package_idx = ? " + 
					"AND tpd.plan_type = 5  " + 
					"ORDER BY tp.day, tpd.plan_detail_order";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String title = rs.getString("title");
				int planType5Idx = rs.getInt("plan_type5_idx");
				String attractionKor = rs.getString("attraction_kor");
				String attractionEng = rs.getString("attraction_eng");
				String ex = rs.getString("ex");
				String detailedEx = rs.getString("detailed_ex");
				int day = rs.getInt("day");
				int planDetailOrder = rs.getInt("plan_detail_order");
				int attractionIdx = rs.getInt("attraction_idx");
				Type5AttractionDto dto = new Type5AttractionDto(title, planType5Idx, attractionKor, attractionEng, ex, detailedEx, day, planDetailOrder, attractionIdx);
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

// 여행일정 유형5 관광지이미지 
	public ArrayList<Type5AttractionImgDto> type5AttractionImg(int packageIdx) {
		ArrayList<Type5AttractionImgDto> listRet = new ArrayList<Type5AttractionImgDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  DISTINCT tpd.plan_type5_idx,  " + 
					"        ptd.attraction_idx, " + 
					"        atti.img_order, " + 
					"        atti.img_url   " + 
					"FROM package p   " + 
					"LEFT JOIN travel_plan_detail tpd ON tpd.package_idx = p.package_idx  " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx  " + 
					"LEFT JOIN plan_type5 pt5 ON tpd.plan_type5_idx = pt5.plan_type5_idx  " + 
					"LEFT JOIN plan_type5_detail ptd ON ptd.plan_type5_idx = pt5.plan_type5_idx  " + 
					"LEFT JOIN attraction att ON att.attraction_idx = ptd.attraction_idx  " + 
					"LEFT JOIN attraction_img atti ON atti.attraction_idx = att.attraction_idx  " + 
					"WHERE tpd.package_idx = ?  " + 
					"AND tpd.plan_type = 5  " + 
					"AND atti.img_order BETWEEN 1 AND 3  " + 
					"ORDER BY ptd.attraction_idx";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int planType5Idx = rs.getInt("plan_type5_idx");
				int attractionIdx = rs.getInt("attraction_idx");
				int imgOrder = rs.getInt("img_order");
				String imgUrl = rs.getString("img_url");
				Type5AttractionImgDto dto = new Type5AttractionImgDto(planType5Idx, attractionIdx, imgOrder, imgUrl);
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
	
//	여행일정 유형5 관광지 여러개 
	public ArrayList<Integer> type5AttractionMany(int packageIdx) {
		ArrayList<Integer> listRet = new ArrayList<Integer>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  DISTINCT pt5.plan_type5_idx " + 
					"FROM travel_plan_detail tpd " + 
					"INNER JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx " + 
					"INNER JOIN plan_type5 pt5 ON pt5.plan_type5_idx = tpd.plan_type5_idx " + 
					"INNER JOIN plan_type5_detail ptd ON ptd.plan_type5_idx = pt5.plan_type5_idx  " + 
					"INNER JOIN attraction att ON att.attraction_idx = ptd.attraction_idx " + 
					"WHERE tpd.package_idx = ? " + 
					"AND pt5.title IS NOT NULL";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Integer planType5Idx = rs.getInt("plan_type5_idx");
				listRet.add(planType5Idx);
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
	
// 여행일정 유형6 음식 
	public ArrayList<Type6FoodDto> type6Food(int packageIdx) {
		ArrayList<Type6FoodDto> listRet = new ArrayList<Type6FoodDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  tpd.plan_type6_idx, " + 
					"        fo.kor_name, " + 
					"        fo.eng_name, " + 
					"        fo.ex, " + 
					"        fo.detailed_ex, " + 
					"        tp.day " + 
					"FROM package p " + 
					"LEFT JOIN travel_plan_detail tpd ON tpd.package_idx = p.package_idx " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx " + 
					"LEFT JOIN plan_type6 pt6 ON tpd.plan_type6_idx = pt6.plan_type6_idx " + 
					"LEFT JOIN plan_type6_detail pt6d ON pt6d.plan_type6_idx = pt6.plan_type6_idx  " + 
					"LEFT JOIN food fo ON fo.food_idx = pt6d.food_idx " + 
					"WHERE tpd.package_idx = ? " + 
					"AND tpd.plan_type = 6 " + 
					"ORDER BY tp.day, tpd.plan_detail_order";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int planType6Idx = rs.getInt("plan_type6_idx");
				String korName = rs.getString("kor_name");
				String engName = rs.getString("eng_name");
				String ex = rs.getString("ex");
				String detailedEx = rs.getString("detailed_ex");
				int day = rs.getInt("day");
				Type6FoodDto dto = new Type6FoodDto(planType6Idx, korName, engName, ex, detailedEx, day);
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
	
// 여행일정 유형6 음식
	public ArrayList<Type6FoodImgDto> type6FoodImg(int packageIdx) {
		ArrayList<Type6FoodImgDto> listRet  = new ArrayList<Type6FoodImgDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  tpd.plan_type6_idx, " + 
					"        fo.food_idx, " + 
					"        foi.img_order, " + 
					"        foi.img_url " + 
					"FROM package p " + 
					"LEFT JOIN travel_plan_detail tpd ON tpd.package_idx = p.package_idx " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx " + 
					"LEFT JOIN plan_type6 pt6 ON tpd.plan_type6_idx = pt6.plan_type6_idx " + 
					"LEFT JOIN plan_type6_detail pt6d ON pt6d.plan_type6_idx = pt6.plan_type6_idx  " + 
					"LEFT JOIN food fo ON fo.food_idx = pt6d.food_idx " + 
					"LEFT JOIN food_img foi ON foi.food_idx = fo.food_idx  " + 
					"WHERE tpd.package_idx = ? " + 
					"AND tpd.plan_type = 6 " + 
					"AND foi.img_order BETWEEN 1 AND 3 " + 
					"ORDER BY tp.day, tpd.plan_detail_order, foi.img_order";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int planType6Idx = rs.getInt("plan_type6_idx");
				String imgUrl = rs.getString("img_url");
				Type6FoodImgDto dto = new Type6FoodImgDto(planType6Idx, imgUrl);
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
	
//	여행일정 유형8 안내사항 
	public ArrayList<Type8NoticeDto> type8Notice(int packageIdx) {
		ArrayList<Type8NoticeDto> listRet = new ArrayList<Type8NoticeDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  tpd.plan_type8_idx, " + 
					"        pt8.title, " + 
					"        pt8.bold_text, " + 
					"        pt8.thin_text, " + 
					"        tp.day " + 
					"FROM package p " + 
					"LEFT JOIN travel_plan_detail tpd ON tpd.package_idx = p.package_idx " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx " + 
					"LEFT JOIN plan_type8 pt8 ON tpd.plan_type8_idx = pt8.plan_type8_idx " + 
					"WHERE tpd.package_idx = ? " + 
					"AND tpd.plan_type = 8 " + 
					"ORDER BY tp.day, tpd.plan_detail_order";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int planType8Idx = rs.getInt("plan_type8_idx");
				String title = rs.getString("title");
				String boldText = rs.getString("bold_text");
				String thinText = rs.getString("thin_text");
				int day = rs.getInt("day");
				Type8NoticeDto dto = new Type8NoticeDto(planType8Idx, title, boldText, thinText, day);
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
	
//	여행일정 유형8 안내사항 사진 
	public ArrayList<Type8NoticeImgDto> type8NoticeImg(int packageIdx) {
		ArrayList<Type8NoticeImgDto> listRet = new ArrayList<Type8NoticeImgDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  tpd.plan_type8_idx, " + 
					"        pti.img_url, " + 
					"        tp.day " + 
					"FROM package p " + 
					"LEFT JOIN travel_plan_detail tpd ON tpd.package_idx = p.package_idx " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx " + 
					"LEFT JOIN plan_type8 pt8 ON tpd.plan_type8_idx = pt8.plan_type8_idx " + 
					"LEFT JOIN plan_type8_img pti ON pti.plan_type8_idx = pt8.plan_type8_idx " + 
					"WHERE tpd.package_idx = ? " + 
					"AND tpd.plan_type = 8 " + 
					"AND pti.img_order BETWEEN 1 AND 3 " + 
					"ORDER BY tp.day, tpd.plan_detail_order";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int planType8Idx = rs.getInt("plan_type8_idx");
				String imgUrl = rs.getString("img_url");
				int day = rs.getInt("day");
				Type8NoticeImgDto dto = new Type8NoticeImgDto(planType8Idx, imgUrl, day);
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
	
//	여행일정 유형9 숙소
	public ArrayList<Type9InnDto> type9Inn(int packageIdx) {
		ArrayList<Type9InnDto> listRet = new ArrayList<Type9InnDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  tpd.plan_type9_idx, " + 
					"        i.inn_kor, " + 
					"        i.inn_eng, " + 
					"        tp.day " + 
					"FROM package p " + 
					"LEFT JOIN travel_plan_detail tpd ON tpd.package_idx = p.package_idx " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx " + 
					"LEFT JOIN plan_type9 pt9 ON tpd.plan_type9_idx = pt9.plan_type9_idx " + 
					"LEFT JOIN inn i ON i.inn_idx = pt9.inn_idx " + 
					"WHERE tpd.package_idx = ? " + 
					"AND tpd.plan_type = 9 " + 
					"ORDER BY tp.day, tpd.plan_detail_order";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int planType9Idx = rs.getInt("plan_type9_idx");
				String innKor = rs.getString("inn_kor");
				String innEng = rs.getString("inn_eng");
				int day = rs.getInt("day");
				Type9InnDto dto = new Type9InnDto(planType9Idx, innKor, innEng, day);
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
	
//	여행일정 유형10 전체 식사 정보 
	public ArrayList<Type10MealDto> type10Meal(int packageIdx) {
		ArrayList<Type10MealDto> listRet = new ArrayList<Type10MealDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  tpd.plan_type10_idx, " + 
					"        tp.day, " + 
					"        pt10.total_meal " + 
					"FROM package p " + 
					"LEFT JOIN travel_plan_detail tpd ON tpd.package_idx = p.package_idx " + 
					"LEFT JOIN travel_plan tp ON tp.travel_plan_idx = tpd.travel_plan_idx " + 
					"LEFT JOIN plan_type10 pt10 ON tpd.plan_type10_idx = pt10.plan_type10_idx " + 
					"WHERE tpd.package_idx = ? " + 
					"AND tpd.plan_type = 10 " + 
					"ORDER BY tp.day, tpd.plan_detail_order";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int planType10Idx = rs.getInt("plan_type10_idx");
				int day = rs.getInt("day");
				String totalMeal = rs.getString("total_meal");
				Type10MealDto dto = new Type10MealDto(planType10Idx, day, totalMeal);
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
	
//	후기 전체 내용 
	public ArrayList<PackageReviewContentDto> packageReviewContent(int packageIdx, int pageNum) {
		ArrayList<PackageReviewContentDto> listRet = new ArrayList<PackageReviewContentDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			int endNum = pageNum * 10;
			int startNum = endNum-9;
			String sql = "SELECT t2.* " + 
					"FROM (SELECT rownum rnum, t1.* " + 
					"FROM (SELECT   " + 
					"    c.category_idx,  " + 
					"    p.package_idx,  " + 
					"    tr.review_idx,  " + 
					"    tr.review_star,   " + 
					"    tr.user_id,   " + 
					"    tr.press_like,  " + 
					"    tr.age,  " + 
					"    TO_CHAR(tr.write_date,'YYYY.MM.DD') as write_date, " + 
					"    p.package_name, " + 
					"    tr.text,   " + 
					"    tr.help  " + 
					"FROM package p   " + 
					"INNER JOIN category c ON c.category_idx = p.category_idx  " + 
					"INNER JOIN travel_review tr ON p.package_idx = tr.package_idx  " + 
					"WHERE p.category_idx = (  " + 
					"    SELECT category_idx   " + 
					"    FROM package  " + 
					"    WHERE package_idx = ?  " + 
					")  " + 
					"ORDER BY tr.help DESC) t1) t2 " + 
					"WHERE rnum >= ? AND rnum <= ? ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			pstmt.setInt(2, startNum);
			pstmt.setInt(3, endNum);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int categoryIdx = rs.getInt("category_idx");
				int reviewStar = rs.getInt("review_star");
				int reviewIdx = rs.getInt("review_idx");
				String userId = rs.getString("user_id");
				String pressLike = rs.getString("press_like");
				String age = rs.getString("age");
				String writeDate = rs.getString("write_date");
				String packageName = rs.getString("package_name");
				String text = rs.getString("text");
				int help = rs.getInt("help");
				PackageReviewContentDto dto = new PackageReviewContentDto(categoryIdx, reviewStar, reviewIdx, userId, pressLike, age, writeDate, packageName, text, help);
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
	
//	리뷰 패키지 전체의 리뷰 가져오기 
	public int getLastPageNumber(int packageIdx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int countRet = 0;
		try {
			String sql = "SELECT COUNT(*) FROM travel_review " + 
					"WHERE package_idx = ? "; 
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, packageIdx);
			rs = pstmt.executeQuery();
			countRet = -1;
			if(rs.next()) {
				countRet = rs.getInt(1);
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
		return countRet/10 + (countRet%10 > 0 ? 1 : 0); 
	}
	
//	리뷰 이미지 
	public ArrayList<PackageReviewImgDto> packageReviewImg() {
		ArrayList<PackageReviewImgDto> listRet = new ArrayList<PackageReviewImgDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  tri.review_idx, " + 
					"        tri.img_url " + 
					"FROM travel_review tr  " + 
					"INNER JOIN travel_review_img tri ON tr.review_idx = tri.review_idx";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) { 
				int reviewIdx = rs.getInt("review_idx");
				String imgUrl = rs.getString("img_url");
				PackageReviewImgDto dto = new PackageReviewImgDto(reviewIdx, imgUrl);
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
	
// 리뷰 태그 
	public ArrayList<PackageReviewTagDto> packageReviewTag() {
		ArrayList<PackageReviewTagDto>  listRet = new ArrayList<PackageReviewTagDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  trt.review_idx, " + 
					"        rti.tag_img_idx, " + 
					"        rti.text " + 
					"FROM travel_review tr  " + 
					"INNER JOIN travel_review_tag trt ON tr.review_idx = trt.review_idx " + 
					"INNER JOIN review_tag_img rti ON rti.tag_img_idx = trt.tag_img_idx";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int reviewIdx = rs.getInt("review_idx");
				int tagImgIdx = rs.getInt("tag_img_idx");
				String text = rs.getString("text");
				PackageReviewTagDto dto = new PackageReviewTagDto(reviewIdx, tagImgIdx, text);
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
	
// 후기 선택 패키지
	 public ArrayList<String> reviewCategoryPackage(int packageIdx) {
		 ArrayList<String> listRet = new ArrayList<String>();
		 Connection conn = null;
		 PreparedStatement pstmt = null;
		 ResultSet rs = null;
		 try {
			 String sql = "SELECT DISTINCT p.package_name " + 
				 		"FROM package p   " + 
				 		"INNER JOIN category c ON c.category_idx = p.category_idx  " + 
				 		"INNER JOIN travel_review tr ON p.package_idx = tr.package_idx  " + 
				 		"WHERE p.category_idx = (  " + 
				 		"    SELECT category_idx   " + 
				 		"    FROM package  " + 
				 		"    WHERE package_idx = ? " + 
				 		") ";
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, packageIdx);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					String packageName = rs.getString("package_name");
					listRet.add(packageName);
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
	 
//	후기 최대 idx
	 public int maxReviewIdx() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int maxReviewIdx = -1;
		try {
			String sql = "SELECT MAX(review_idx) maxReviewIdx  " + 
			 		"FROM travel_review ";
			 conn = getConnection();
			 pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			 if(rs.next()) {
				maxReviewIdx = rs.getInt("maxReviewIdx");
				
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
		 return maxReviewIdx;
	 }
	 
//	후기 내용 insert	 
	 public void insertReviewContent(int packageIdx, String like, String age, int star, String content, int maxReviewIdx) throws Exception {
		 String sql = "INSERT INTO travel_review(review_idx, package_idx, review_star, user_id, age, press_like, write_date, text, help) " + 
		 		"VALUES (?, ?, ?, 'subin1222', ? , ? , sysdate, ? , 0)";
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(2, packageIdx);
		pstmt.setString(5, like);
		pstmt.setString(4, age);
		pstmt.setInt(3, star);
		pstmt.setString(6, content);
		pstmt.setInt(1, maxReviewIdx + 1);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
	 }

	 
//	후기 내용 태그 insert
	 public void insertReviewTag(int[] tag, int maxReviewIdx) throws Exception {
		for (int i = 0; i < tag.length; i++) {
			String sql ="INSERT INTO travel_review_tag(review_idx, tag_img_idx) " + 
			 		"VALUES (?, ?)";
			Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(2, tag[i]);
            pstmt.setInt(1,maxReviewIdx+1);
            pstmt.executeUpdate();
    		pstmt.close();
    		conn.close();
        }
	 }
	 
//	 후기 내용 이미지 insert
	 public void insertReviewImg(int maxReviewIdx, String[] imgStrArray) throws Exception {
		 for(int i=0; i<imgStrArray.length; i++) {
			 String sql = "INSERT INTO travel_review_img(review_idx, img_url) " + 
			 		"VALUES ( ? , ? )";
			 Connection conn = getConnection();
			 PreparedStatement pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, maxReviewIdx+1);
			 pstmt.setString(2, imgStrArray[i]);
			 pstmt.executeUpdate();
			 pstmt.close();
			 conn.close();
		 }
	 }
	
}
