package dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.AmenityDto;
import dto.AmenitySubtDto;
import dto.FacilityDto;
import dto.FacilitySubtDto;
import dto.HotelTagDto;
import dto.OverseaAdditionalInfoDto;
import dto.OverseaHotelDto;
import dto.OverseaHotelInfoDto;
import dto.OverseaHotelReviewDto;
import dto.OverseaRoomDto;
import dto.OverseaRoomTypeDto;
import dto.OverseaTotalRatingDto;
import dto.OverseaReviewImgDto;
import dto.OverseaReviewOptionDto;

public class OverseaHotelDao {
	Connection getConnection() {
		String driver = "oracle.jdbc.driver.OracleDriver";
	      String url = "jdbc:oracle:thin:@localhost:1521:xe";
	      String dbId = "project";
	      String dbPw = "pass1234";
	      
	      Connection conn = null;
	    try {
	      Class.forName(driver);
	      conn = DriverManager.getConnection(url, dbId, dbPw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	      return conn;
	}
	
	// 호텔 상세페이지 상단 정보 출력
	public ArrayList<OverseaHotelDto> getHotelInfo(int inn_idx) {
		ArrayList<OverseaHotelDto> listRet = new ArrayList<OverseaHotelDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT DISTINCT  " + 
					"    i.star,   " + 
					"    i.inn_kor,   " + 
					"    i.inn_eng,   " + 
					"    i.purple_box,  " + 
					"    AVG(s.clean + s.employee + s.convenient_facility + s.inn_facility) / 4 AS review_avg,  " + 
					"    COUNT(DISTINCT s.review_idx) AS review_num,  " + 
					"    min(r.price) AS price " + 
					"FROM inn i  " + 
					"LEFT JOIN inn_review rv ON rv.inn_idx = i.inn_idx  " + 
					"LEFT JOIN inn_review_standard s ON s.review_idx = rv.review_idx  " + 
					"LEFT JOIN room r ON r.inn_idx = i.inn_idx AND r.checkin >= TO_DATE('20240801', 'yyyymmdd') AND r.checkin < TO_DATE('20240901', 'yyyymmdd')  " + 
					"WHERE i.inn_idx = ?  " + 
					"GROUP BY i.star, i.inn_kor, i.inn_eng, i.purple_box";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inn_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int star = rs.getInt("star");
				String innKor = rs.getString("inn_kor");
				String innEng = rs.getString("inn_eng");
				String purpleBox = rs.getString("purple_box");
				int reviewAvg = rs.getInt("review_avg");
				int reviewNum = rs.getInt("review_num");
				int price = rs.getInt("price");
				OverseaHotelDto overseaHotelDetail = new OverseaHotelDto(star, innKor, innEng, purpleBox, reviewAvg, reviewNum, price);
				listRet.add(overseaHotelDetail);
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
	
	// 호텔 상세페이지(보라색 태그)
	public ArrayList<HotelTagDto> getTagList(int inn_idx) {
		ArrayList<HotelTagDto> listRet = new ArrayList<HotelTagDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT it.tag, it.purple_tag  " + 
					"FROM inn_tag it  " + 
					"LEFT JOIN inn i ON it.inn_idx = i.inn_idx  " + 
					"WHERE i.inn_idx=? ";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inn_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String Tag = rs.getString("tag");
				String purpleTag = rs.getString("purple_tag");
				HotelTagDto overseaTag = new HotelTagDto(Tag, purpleTag);
				listRet.add(overseaTag);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
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
	
	// 호텔 상세페이지 숙소정보 출력
	public ArrayList<OverseaHotelInfoDto> getBottomHotelInfo(int inn_idx) {
		ArrayList<OverseaHotelInfoDto> listRet = new ArrayList<OverseaHotelInfoDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT address_eng, "
					+ " checkin_checkout, "
					+ " floors, "
					+ " room_num, "
					+ " phone, "
					+ " fax " 
					+ " FROM inn"
					+ " WHERE inn_idx =?";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inn_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String addressEng = rs.getString("address_eng");
				String checkinCheckout = rs.getString("checkin_checkout");
				int floors = rs.getInt("floors");
				int roomNum = rs.getInt("room_num");
				String phone = rs.getString("phone");
				String fax = rs.getString("fax");
				OverseaHotelInfoDto bottomHotelInfo = new OverseaHotelInfoDto(addressEng, checkinCheckout, floors, roomNum, phone, fax);
				listRet.add(bottomHotelInfo);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
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
	// 룸 타입 선택
	public ArrayList<OverseaRoomTypeDto> getRoomType(int innIdx){
		ArrayList<OverseaRoomTypeDto> listRet = new ArrayList<OverseaRoomTypeDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT r.room_type, "
					+ "    min(r.price) as price "
					+ "FROM room r "
					+ "LEFT JOIN inn i ON r.inn_idx = i.inn_idx "
					+ "WHERE i.inn_idx = ? "
					+ "    AND r.checkin > SYSDATE "
					+ "GROUP BY r.room_type ";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, innIdx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String roomType = rs.getString("room_type");
				int price = rs.getInt("price");
				OverseaRoomTypeDto roomTypeName = new OverseaRoomTypeDto(roomType, price);
				listRet.add(roomTypeName);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
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
 	
	// 룸의 정보 출력
	public ArrayList<OverseaRoomDto> getRoomList(int innIdx, int inputCheckout, int inputRoom, int inputPersonnel, String inputCheckin) {
	ArrayList<OverseaRoomDto> listRet = new ArrayList<OverseaRoomDto>();
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String sql = "SELECT r.room_type,    "
				+ "    r.room_idx, "
				+ "    r.room_name,   "
				+ "    r.alarm,    "
				+ "    r.cancel_date,    "
				+ "    r.breakfast,    "
				+ "    r.price,    "
				+ "    r.checkin, "
				+ "    r.max_days, "
				+ "    r.max_room "
				+ "FROM room r   "
				+ "LEFT JOIN inn i ON i.inn_idx = r.inn_idx   "
				+ "WHERE i.inn_idx = ? "
				+ "    AND r.checkin > SYSDATE "
				+ "    AND r.max_days >= ? "
				+ "    AND r.max_room >= ? "
				+ "    AND r.max_personnel >= ? "
				+ "    AND r.checkin = ? ";
		
		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, innIdx);
		pstmt.setInt(2,inputCheckout);
		pstmt.setInt(3, inputRoom);
		pstmt.setInt(4, inputPersonnel);
		pstmt.setString(5, inputCheckin);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			String roomType = rs.getString("room_type");
			int roomIdx = rs.getInt("room_idx");
			String roomName = rs.getString("room_name");
			String alarm = rs.getString("alarm");
			String cancelDate = rs.getString("cancel_date");
			String breakfast = rs.getString("breakfast");
			int price = rs.getInt("price");
			String checkin = rs.getString("checkin");
			int maxDays = rs.getInt("max_days");
			int maxRoom = rs.getInt("max_room");
			OverseaRoomDto roomTypeList = new OverseaRoomDto(roomType, roomIdx, roomName, alarm, cancelDate, breakfast, price, checkin, maxDays, maxRoom);
			listRet.add(roomTypeList);
		}
		rs.close();
		pstmt.close();
		conn.close();
	} catch (Exception e) {
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
	
	// 룸의 추가 정보 출력
	public ArrayList<OverseaAdditionalInfoDto> getAdditionalInfo(int inn_idx) {
		ArrayList<OverseaAdditionalInfoDto> listRet = new ArrayList<OverseaAdditionalInfoDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT DISTINCT room_info, facilities, dining, near_entertain, hotel_info, construction_notice " + 
					"FROM inn " + 
					"WHERE inn_idx = ?";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inn_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String roomInfo = rs.getString("room_info");
				String facilities = rs.getString("facilities");
				String dining = rs.getString("dining");
				String nearEntertain = rs.getString("near_entertain");
				String hotelInfo = rs.getString("hotel_info");
				String constructionNotice = rs.getString("construction_notice");
				OverseaAdditionalInfoDto additionalInfo = new OverseaAdditionalInfoDto(roomInfo, facilities, dining, nearEntertain, hotelInfo, constructionNotice);
				listRet.add(additionalInfo);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
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
	
	// 편의시설 아이콘 및 타이틀
	public ArrayList<AmenityDto> getAmenity(int inn_idx) {
		ArrayList<AmenityDto> listRet = new ArrayList<AmenityDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT DISTINCT amt.amenity_title_name,   " + 
					"    amt.amenity_img,  " + 
					"    amt.amenity_title_idx  " + 
					"FROM amenity am  " + 
					"LEFT JOIN amenity_subtitle ams ON am.amenity_subt_idx = ams.amenity_subt_idx  " + 
					"LEFT JOIN amenity_title amt ON amt.amenity_title_idx = ams.amenity_title_idx  " + 
					"WHERE am.inn_idx = ? " + 
					"ORDER BY amt.amenity_title_idx ASC";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inn_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String amenityTitleName = rs.getString("amenity_title_name");
				String amenityImg = rs.getString("amenity_img");
				int amenityTitleIdx = rs.getInt("amenity_title_idx");
				AmenityDto amenityTitle = new AmenityDto(amenityTitleName, amenityImg, amenityTitleIdx);
				listRet.add(amenityTitle);
			}
			
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
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
	
	// 부대시설 아이콘 및 타이틀
	public ArrayList<FacilityDto> getFacility(int inn_idx) {
		ArrayList<FacilityDto> listRet = new ArrayList<FacilityDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT DISTINCT ft.facility_title_name,   " + 
					"    ft.facility_img,  " + 
					"    ft.facility_title_idx  " + 
					"FROM facility f  " + 
					"LEFT JOIN facility_subtitle fs ON f.facility_subt_idx = fs.facility_subt_idx  " + 
					"LEFT JOIN facility_title ft ON ft.facility_title_idx = fs.facility_title_idx  " + 
					"WHERE f.inn_idx = ?  " + 
					"ORDER BY ft.facility_title_idx ASC";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inn_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String facilityTitleName = rs.getString("facility_title_name");
				String facilityImg = rs.getString("facility_img");
				int facilityTitleImg = rs.getInt("facility_title_idx");
				FacilityDto facility = new FacilityDto(facilityTitleName, facilityImg, facilityTitleImg);
				listRet.add(facility);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
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
	
	// 편의시설 부타이틀
	public ArrayList<AmenitySubtDto> getSubtAmenity(int inn_idx) {
		ArrayList<AmenitySubtDto> listRet = new ArrayList<AmenitySubtDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql= "SELECT ams.amenity_subt_name,  " + 
					"    ams.amenity_title_idx  " + 
					"FROM inn i  " + 
					"LEFT JOIN amenity am ON i.inn_idx = am.inn_idx  " + 
					"LEFT JOIN amenity_subtitle ams ON am.amenity_subt_idx = ams.amenity_subt_idx  " + 
					"LEFT JOIN amenity_title amt ON amt.amenity_title_idx = ams.amenity_title_idx  " + 
					"WHERE ams.amenity_subt_name IS NOT NULL  " + 
					"AND i.inn_idx=?   " + 
					"ORDER BY ams.amenity_subt_idx ASC,   " + 
					"amenity_title_idx ASC";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inn_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String amenitySubtName = rs.getString("amenity_subt_name");
				int amenityTitleIdx = rs.getInt("amenity_title_idx");
				AmenitySubtDto amenitySubt = new AmenitySubtDto(amenitySubtName, amenityTitleIdx);
				listRet.add(amenitySubt);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
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
	
	// 부대시설 부타이틀
	public ArrayList<FacilitySubtDto> getSubtFacility(int inn_idx) {
		ArrayList<FacilitySubtDto> listRet = new ArrayList<FacilitySubtDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT fs.facility_subt_name,  " + 
					"    fs.facility_title_idx  " + 
					"FROM inn i  " + 
					"LEFT JOIN facility f ON i.inn_idx = f.inn_idx  " + 
					"LEFT JOIN facility_subtitle fs ON f.facility_subt_idx = fs.facility_subt_idx  " + 
					"LEFT JOIN facility_title ft ON ft.facility_title_idx = fs.facility_title_idx  " + 
					"WHERE fs.facility_subt_name IS NOT NULL  " + 
					"AND i.inn_idx=?   " + 
					"ORDER BY fs.facility_subt_idx ASC,   " + 
					"facility_title_idx ASC";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, inn_idx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String facilitySubtName = rs.getString("facility_subt_name");
				int facilityTitleIdx = rs.getInt("facility_title_idx");
				FacilitySubtDto facilitySubt = new FacilitySubtDto(facilitySubtName, facilityTitleIdx);
				listRet.add(facilitySubt);
				
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
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
	
	// 리뷰 글
	public ArrayList<OverseaHotelReviewDto> getOverseaReview(int innIdx) {
		ArrayList<OverseaHotelReviewDto> listRet = new ArrayList<OverseaHotelReviewDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT DISTINCT rv.review_idx,  "
					+ "    ROUND(avg(s.clean + s.employee + s.convenient_facility + s.inn_facility)/4,0) as review_rating, "
					+ "    uf.user_id, "
					+ "    rvt.review_type, "
					+ "    rv.regist_date, "
					+ "    i.inn_kor, "
					+ "    rv.content "
					+ "FROM inn i "
					+ "LEFT JOIN room r ON i.inn_idx = r.inn_idx "
					+ "LEFT JOIN inn_review rv ON rv.inn_idx = i.inn_idx "
					+ "LEFT JOIN inn_review_standard s ON s.review_idx = rv.review_idx "
					+ "LEFT JOIN user_info uf ON uf.user_id = rv.user_id "
					+ "LEFT JOIN oversea_review orv ON orv.review_idx = rv.review_idx "
					+ "LEFT JOIN inn_review_type rvt ON rvt.review_type_idx = rv.review_type_idx "
					+ "LEFT JOIN oversea_review_option op ON op.review_option_idx = orv.review_option_idx "
					+ "WHERE i.inn_idx = ? "
					+ "GROUP BY rv.review_idx, uf.user_id, rvt.review_type, rv.regist_date, i.inn_kor, rv.content "
					+ "ORDER BY rv.review_idx";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, innIdx);
			rs = pstmt.executeQuery();
			while(rs.next() ) {
				int reviewIdx = rs.getInt("review_idx");
				String reviewRating = rs.getString("review_rating");
				String userId = rs.getString("user_id");
				String reviewType = rs.getString("review_type");
				String registDate = rs.getString("regist_date");
				String innKor = rs.getString("inn_kor");
				String content = rs.getString("content");
				OverseaHotelReviewDto overseaReview = new OverseaHotelReviewDto(reviewIdx, reviewRating, userId, reviewType, registDate, innKor, content);
				listRet.add(overseaReview);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
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
	
	// 리뷰 글
	public ArrayList<OverseaHotelReviewDto> getOverseaReviewLatest(int innIdx) {
		ArrayList<OverseaHotelReviewDto> listRet = new ArrayList<OverseaHotelReviewDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT DISTINCT rv.review_idx,   "
					+ "					   ROUND(avg(s.clean + s.employee + s.convenient_facility + s.inn_facility)/4,0) as review_rating,  "
					+ "					    uf.user_id,  "
					+ "					    rvt.review_type,  "
					+ "					    rv.regist_date,  "
					+ "					    i.inn_kor,  "
					+ "					    rv.content  "
					+ "					FROM inn i  "
					+ "					LEFT JOIN room r ON i.inn_idx = r.inn_idx  "
					+ "					LEFT JOIN inn_review rv ON rv.inn_idx = i.inn_idx  "
					+ "					LEFT JOIN inn_review_standard s ON s.review_idx = rv.review_idx  "
					+ "					LEFT JOIN user_info uf ON uf.user_id = rv.user_id  "
					+ "					LEFT JOIN oversea_review orv ON orv.review_idx = rv.review_idx  "
					+ "					LEFT JOIN inn_review_type rvt ON rvt.review_type_idx = rv.review_type_idx  "
					+ "					LEFT JOIN oversea_review_option op ON op.review_option_idx = orv.review_option_idx  "
					+ "					WHERE i.inn_idx = ? "
					+ "					GROUP BY rv.review_idx, uf.user_id, rvt.review_type, rv.regist_date, i.inn_kor, rv.content  "
					+ "					ORDER BY rv.regist_date DESC ";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, innIdx);
			rs = pstmt.executeQuery();
			while(rs.next() ) {
				int reviewIdx = rs.getInt("review_idx");
				String reviewRating = rs.getString("review_rating");
				String userId = rs.getString("user_id");
				String reviewType = rs.getString("review_type");
				String registDate = rs.getString("regist_date");
				String innKor = rs.getString("inn_kor");
				String content = rs.getString("content");
				OverseaHotelReviewDto overseaReview = new OverseaHotelReviewDto(reviewIdx, reviewRating, userId, reviewType, registDate, innKor, content);
				listRet.add(overseaReview);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
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
	
	// 리뷰 이미지
	public ArrayList<OverseaReviewImgDto> getReviewImg() {
		ArrayList<OverseaReviewImgDto> listRet = new ArrayList<OverseaReviewImgDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT img_url, review_idx "
					+ "FROM inn_review_img";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String imgUrl = rs.getString("img_url");
				int reviewIdx = rs.getInt("review_idx");
				OverseaReviewImgDto reviewImg = new OverseaReviewImgDto(imgUrl, reviewIdx);		
				listRet.add(reviewImg);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
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
	
	// 리뷰 옵션 및 아이콘
	public ArrayList<OverseaReviewOptionDto> getReviewOption() {
		ArrayList<OverseaReviewOptionDto> listRet = new ArrayList<OverseaReviewOptionDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT rv.review_idx,  "
					+ "    op.title,  "
					+ "    op.option_img "
					+ "FROM oversea_review rv "
					+ "LEFT JOIN oversea_review_option op ON rv.review_option_idx = op.review_option_idx "
					+ "ORDER BY review_idx, op.review_option_idx";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int reviewIdx = rs.getInt("review_idx");
				String title = rs.getString("title");
				String optionImg = rs.getString("option_img");
				OverseaReviewOptionDto reviewOption = new OverseaReviewOptionDto(reviewIdx, title, optionImg);
				listRet.add(reviewOption);
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
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
	
	// 숙소 전체의 평점 및 평점기준
	public ArrayList<OverseaTotalRatingDto> getTotalRating(int innIdx) {
		ArrayList<OverseaTotalRatingDto> listRet = new ArrayList<OverseaTotalRatingDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT ROUND(avg(s.clean + s.employee + s.convenient_facility + s.inn_facility)/4,1) AS total_avg, "
					+ "    ROUND(avg(s.clean),1) AS clean, "
					+ "    ROUND(avg(s.employee),1) AS employee, "
					+ "    ROUND(avg(s.convenient_facility),1) AS convenient_facility, "
					+ "    ROUND(avg(s.inn_facility),1) AS inn_facility, "
					+ "    COUNT(DISTINCT rv.review_idx) AS review_count "
					+ "FROM inn_review rv "
					+ "LEFT JOIN inn_review_standard s ON s.review_idx = rv.review_idx "
					+ "WHERE rv.inn_idx=? ";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, innIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				double totalAvg = rs.getDouble("total_avg");
				double clean = rs.getDouble("clean");
				double employee = rs.getDouble("employee");
				double convenientFacility = rs.getDouble("convenient_facility");
				double innFacility = rs.getDouble("inn_facility");
				int reviewCount = rs.getInt("review_count");
				OverseaTotalRatingDto totalRating = new OverseaTotalRatingDto(totalAvg, clean, employee, convenientFacility, innFacility, reviewCount);
				listRet.add(totalRating);
						
			}
			rs.close();
			pstmt.close();
			conn.close();
		} catch (Exception e) {
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
	
	// 리뷰 등록
	public void registOverseaReview(int reviewIdx, int innIdx, String content, String registDate) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String sql = "INSERT INTO inn_review(review_idx, inn_idx, content, regist_date) "
					+ "VALUES (18,1,'?',SYSDATE);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewIdx );	
			pstmt.setInt(2, innIdx);
			pstmt.setString(3, content);
			pstmt.setString(4, registDate);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e){
				e.printStackTrace();
			}
		}
	}
	
	// 리뷰 등록
	public void registerOverseaReview(int reviewIdx, int innIdx , String userId, String category, String content, int reviewRatingClean, int reviewRatingService, int reviewRatingFacility, int reviewRatingPlace, int[] reviewOptions) {
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;
		
		try {
			String sql1 = "INSERT INTO inn_review(review_idx, inn_idx, user_id, category, content, regist_date) "
					+ "VALUES (?, ?, ?, ?, ?, SYSDATE) ";
			conn = getConnection();
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, reviewIdx);
            pstmt1.setInt(2, innIdx);
            pstmt1.setString(3, userId);
            pstmt1.setString(4, category);
            pstmt1.setString(5, content);
			pstmt1.executeUpdate();
			
			String sql2 = "INSERT INTO oversea_review(review_idx, review_option_idx) "
					+ "VALUES(? , ?) ";
			pstmt2 = conn.prepareStatement(sql2);
			for (int reviewOptionIdx : reviewOptions) {
                pstmt2.setInt(1, reviewIdx);
                pstmt2.setInt(2, reviewOptionIdx);
                pstmt2.executeUpdate();
            }
			
			String sql3 = "INSERT INTO inn_review_standard(review_idx, clean, employee, convenient_facility, inn_facility)\n"
					+ "VALUES(? , ?, ?, ?, ?) ";
			pstmt3 = conn.prepareStatement(sql3);
				pstmt3.setInt(1, reviewIdx);
				pstmt3.setInt(2, reviewRatingClean);
				pstmt3.setInt(3, reviewRatingService);
				pstmt3.setInt(4, reviewRatingFacility);
				pstmt3.setInt(5, reviewRatingPlace);
				pstmt3.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt1 != null) pstmt1.close();
				if(pstmt2 != null) pstmt2.close();
				if(pstmt3 != null) pstmt3.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
		
}
