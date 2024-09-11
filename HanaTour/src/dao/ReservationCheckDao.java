package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.DomesticFlightCancelCheckDto;
import dto.DomesticFlightReservationCheckDto;
import dto.HotelCancelCheckDto;
import dto.HotelReservationCheckDto;
import dto.OverseaFlightCancelCheckDto;
import dto.OverseaFlightReservationCheckDto;
import dto.ShowTourReservationDto;
import dto.TravelCancelCheckDto;
import dto.TravelReservationCheckDto;

	public class ReservationCheckDao {
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
	
// 해외여행 예약내역
// 	TravelReservationCheckDto 리턴 userID 받기	
	public ArrayList<TravelReservationCheckDto> travelReservationCheck(String userId) {
		ArrayList<TravelReservationCheckDto> trcDto = new ArrayList<TravelReservationCheckDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  tr.reservation_code, " + 
					"        p.package_name, " + 
					"        tr.member, " + 
					"        TO_CHAR(tr.reservation_date, 'YYYY-MM-DD') as reservation_date, " + 
					"        pay.price, " + 
					"        TO_CHAR(MIN(pf.departure_date), 'YYYY-MM-DD') as earliest_date, " + 
					"        TO_CHAR(MAX(pf.departure_date), 'YYYY-MM-DD') as latest_date " + 
					"FROM reservation r " + 
					"LEFT JOIN travel_reservation tr ON tr.reservation_idx = r.travel_reservation_idx " + 
					"LEFT JOIN package p ON p.package_idx = tr.package_idx " + 
					"LEFT JOIN payment pay ON pay.reservation_idx = r.reservation_idx " + 
					"LEFT JOIN package_flight pf ON pf.package_idx = p.package_idx " + 
					"WHERE tr.user_id = ? " + 
					"AND r.cancel_date IS NULL " + 
					"GROUP BY tr.reservation_code, p.package_name, tr.member, tr.reservation_date, pay.price";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String  reservationCode = rs.getString("reservation_code");
				String packageName = rs.getString("package_name");
				int member = rs.getInt("member");
				int price = rs.getInt("price");
				String earliestDate = rs.getString("earliest_date");
				String latestDate = rs.getString("latest_date");
				TravelReservationCheckDto dto = new TravelReservationCheckDto(reservationCode, packageName, member, price, earliestDate, latestDate);
				trcDto.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
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
		return trcDto;
	}
	
// 해외여행 취소 내역 
	public ArrayList<TravelCancelCheckDto> travelCancelCheck(String userId) {
		ArrayList<TravelCancelCheckDto> tccDto = new ArrayList<TravelCancelCheckDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  tr.reservation_code, " + 
					"        p.package_name, " + 
					"        tr.member, " + 
					"        TO_CHAR(tr.reservation_date, 'YYYY-MM-DD') as reservation_date, " + 
					"        pay.price, " + 
					"        TO_CHAR(MIN(pf.departure_date), 'YYYY-MM-DD') as earliest_date, " + 
					"        TO_CHAR(MAX(pf.departure_date), 'YYYY-MM-DD') as latest_date, " + 
					"        TO_CHAR(r.cancel_date,'YYYY-MM-DD') as cancel_date " + 
					"FROM reservation r " + 
					"LEFT JOIN travel_reservation tr ON tr.reservation_idx = r.travel_reservation_idx " + 
					"LEFT JOIN package p ON p.package_idx = tr.package_idx " + 
					"LEFT JOIN payment pay ON pay.reservation_idx = r.reservation_idx " + 
					"LEFT JOIN package_flight pf ON pf.package_idx = p.package_idx " + 
					"WHERE tr.user_id = ? " + 
					"AND r.cancel_date IS NOT NULL " + 
					"GROUP BY tr.reservation_code, p.package_name, tr.member, tr.reservation_date, pay.price, r.cancel_date";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String reservationCode = rs.getString("reservation_code");
				String packageName = rs.getString("package_name");
				String price = rs.getNString("price");
				int member = rs.getInt("member");
				String earliestDate = rs.getString("earliest_date");
				String latestDate = rs.getString("latest_date");
				String cancelDate = rs.getNString("cancel_date");
				TravelCancelCheckDto dto = new TravelCancelCheckDto(reservationCode, packageName, price, member, earliestDate, latestDate, cancelDate);
				tccDto.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return tccDto;
	}
	
// 호텔 예약내역
	public ArrayList<HotelReservationCheckDto> hotelReservationCheck(String user_id) {
		ArrayList<HotelReservationCheckDto> hrcDto = new ArrayList<HotelReservationCheckDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  DISTINCT ir.reservation_code, " + 
					"        i.inn_kor, " + 
					"        pay.price, " + 
					"        (ir.adult_num + NVL(ir.child_num,0)) as person, " + 
					"        TO_CHAR(ro.checkin, 'YYYY-MM-DD') as checkin, " + 
					"        TO_CHAR(ro.checkout,'YYYY-MM-DD') as checkout " + 
					"FROM reservation r " + 
					"LEFT JOIN inn_reservation ir ON r.inn_reservation_idx = ir.reservation_idx " + 
					"LEFT JOIN payment pay ON pay.reservation_idx = r.reservation_idx " + 
					"LEFT JOIN room ro ON ro.room_idx = ir.room_idx " + 
					"LEFT JOIN inn i ON i.inn_idx = ro.inn_idx " + 
					"WHERE ir.user_id = ? " + 
					"AND r.cancel_date IS NULL";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String reservation_code = rs.getString("reservation_code");
				String inn_kor = rs.getString("inn_kor");
				int price = rs.getInt("price");
				int person = rs.getInt("person");
				String checkin = rs.getString("checkin");
				String checkout = rs.getString("checkout");
				HotelReservationCheckDto dto = new HotelReservationCheckDto(reservation_code, inn_kor, price, person, checkin, checkout);
				hrcDto.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
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
		return hrcDto;
	}
	
// 호텔 취소 내역	
	public ArrayList<HotelCancelCheckDto> hotelCancelCheck(String userId) {
		ArrayList<HotelCancelCheckDto> hccDto = new ArrayList<HotelCancelCheckDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  DISTINCT ir.reservation_code, " + 
					"        i.inn_kor, " + 
					"        (ir.adult_num + NVL(ir.child_num,0)) as person, " + 
					"        TO_CHAR(ro.checkin, 'YYYY-MM-DD') as checkin, " + 
					"        TO_CHAR(ro.checkout,'YYYY-MM-DD') as checkout, " + 
					"        TO_CHAR(r.cancel_date, 'YYYY-MM-DD') as cancel_date " + 
					"FROM reservation r " + 
					"LEFT JOIN inn_reservation ir ON r.inn_reservation_idx = ir.reservation_idx " + 
					"LEFT JOIN payment pay ON pay.reservation_idx = r.reservation_idx " + 
					"LEFT JOIN room ro ON ro.room_idx = ir.room_idx " + 
					"LEFT JOIN inn i ON i.inn_idx = ro.inn_idx " + 
					"WHERE ir.user_id = ? " + 
					"AND r.cancel_date IS NOT NULL";
			
			conn =  getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String reservationCode = rs.getString("reservation_code");
				String innKor = rs.getString("inn_kor");
				int person = rs.getInt("person");
				String checkIn = rs.getString("checkin");
				String checkOut = rs.getString("checkout");
				String cancelDate = rs.getString("cancel_date");
				HotelCancelCheckDto dto = new HotelCancelCheckDto(reservationCode, innKor, person, checkIn, checkOut, cancelDate);
				hccDto.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
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
		return hccDto;
	}
	
// 해외항공 예약
// user_id를 파라미터로 받아서 출력
	public ArrayList<OverseaFlightReservationCheckDto> overseaFlightReservationCheck(String userId) {
		ArrayList<OverseaFlightReservationCheckDto> ofrcDto = new ArrayList<OverseaFlightReservationCheckDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  DISTINCT ar.reservation_code, " + 
					"        a.name, " + 
					"        p.price, " + 
					"        (NVL(ar.adult,0) + NVL(ar.child,0) + NVL(ar.infant,0)) as person,  " + 
					"        TO_CHAR(att.departure_time,'YYYY-MM-DD') as departure " + 
					"FROM reservation r  " + 
					"LEFT JOIN airline_reservation ar ON r.airline_reservation_idx = ar.reservation_idx " + 
					"LEFT JOIN airline_ticket att ON att.ticket_idx = ar.ticket_idx " + 
					"LEFT JOIN airline a ON a.iata = att.airline_iata " + 
					"LEFT JOIN payment p ON p.reservation_idx = r.reservation_idx " + 
					"WHERE ar.user_id = ? " + 
					"AND ar.reservation_code LIKE 'of%' " + 
					"AND r.cancel_date IS NULL "; 
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String reservationCode = rs.getString("reservation_code");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				int person = rs.getInt("person");
				String departure = rs.getString("departure");
				
				OverseaFlightReservationCheckDto dto = new OverseaFlightReservationCheckDto(reservationCode, name, price, person, departure);
				ofrcDto.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
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
		return ofrcDto;
	}
	
// 해외항공 취소 
	public ArrayList<OverseaFlightCancelCheckDto> overseaFlightCancelCheck(String userId) {
		ArrayList<OverseaFlightCancelCheckDto> ofccDto = new ArrayList<OverseaFlightCancelCheckDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  DISTINCT ar.reservation_code, " + 
					"        a.name, " + 
					"        p.price, " + 
					"        (NVL(ar.adult,0) + NVL(ar.child,0) + NVL(ar.infant,0)) as person,  " + 
					"        TO_CHAR(att.departure_time,'YYYY-MM-DD') as departure, " + 
					"        TO_CHAR(r.cancel_date,'YYYY-MM-DD') as cancel_date " + 
					"FROM reservation r  " + 
					"LEFT JOIN airline_reservation ar ON r.airline_reservation_idx = ar.reservation_idx " + 
					"LEFT JOIN airline_ticket att ON att.ticket_idx = ar.ticket_idx " + 
					"LEFT JOIN airline a ON a.iata = att.airline_iata " + 
					"LEFT JOIN payment p ON p.reservation_idx = r.reservation_idx " + 
					"WHERE ar.user_id = ? " + 
					"AND ar.reservation_code LIKE 'of%' " + 
					"AND r.cancel_date IS NOT NULL ";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String reservationCode = rs.getString("reservation_code");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				int person = rs.getInt("person");
				String departure = rs.getString("departure");
				String cancelDate = rs.getString("cancel_date");
				
				OverseaFlightCancelCheckDto dto = new OverseaFlightCancelCheckDto(reservationCode, name, price, person, departure, cancelDate);
				ofccDto.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
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
		return ofccDto;
	}
	
// 국내항공 예약
// user_id를 파라미터로 받아서 출력
	public ArrayList<DomesticFlightReservationCheckDto> domesticFlightReservationCheck(String userId) {
		ArrayList<DomesticFlightReservationCheckDto> dfrcDto = new ArrayList<DomesticFlightReservationCheckDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  DISTINCT ar.reservation_code, " + 
					"        a.name, " + 
					"        p.price, " + 
					"        (NVL(ar.adult,0) + NVL(ar.child,0) + NVL(ar.infant,0)) as person,  " + 
					"        TO_CHAR(att.departure_time,'YYYY-MM-DD') as departure " + 
					"FROM reservation r  " + 
					"LEFT JOIN airline_reservation ar ON r.airline_reservation_idx = ar.reservation_idx " + 
					"LEFT JOIN airline_ticket att ON att.ticket_idx = ar.ticket_idx " + 
					"LEFT JOIN airline a ON a.iata = att.airline_iata " + 
					"LEFT JOIN payment p ON p.reservation_idx = r.reservation_idx " + 
					"WHERE ar.user_id = ? " + 
					"AND ar.reservation_code LIKE 'df%' " + 
					"AND r.cancel_date IS NULL "; 
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String reservationCode = rs.getString("reservation_code");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				int person = rs.getInt("person");
				String departure = rs.getString("departure");
				
				DomesticFlightReservationCheckDto dto = new DomesticFlightReservationCheckDto(reservationCode, name, price, person, departure);
				dfrcDto.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
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
		return dfrcDto;
	}
	
// 국내항공 취소 
	public ArrayList<DomesticFlightCancelCheckDto> domesticFlightCancelCheck(String userId) {
		ArrayList<DomesticFlightCancelCheckDto> dfccDto = new ArrayList<DomesticFlightCancelCheckDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  DISTINCT ar.reservation_code, " + 
					"        a.name, " + 
					"        p.price, " + 
					"        (NVL(ar.adult,0) + NVL(ar.child,0) + NVL(ar.infant,0)) as person,  " + 
					"        TO_CHAR(att.departure_time,'YYYY-MM-DD') as departure, " + 
					"        TO_CHAR(r.cancel_date,'YYYY-MM-DD') as cancel_date " + 
					"FROM reservation r  " + 
					"LEFT JOIN airline_reservation ar ON r.airline_reservation_idx = ar.reservation_idx " + 
					"LEFT JOIN airline_ticket att ON att.ticket_idx = ar.ticket_idx " + 
					"LEFT JOIN airline a ON a.iata = att.airline_iata " + 
					"LEFT JOIN payment p ON p.reservation_idx = r.reservation_idx " + 
					"WHERE ar.user_id = ? " + 
					"AND ar.reservation_code LIKE 'df%' " + 
					"AND r.cancel_date IS NOT NULL ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String reservationCode = rs.getString("reservation_code");
				String name = rs.getString("name");
				int price = rs.getInt("price");
				int person = rs.getInt("person");
				String departure = rs.getString("departure");
				String cancelDate = rs.getString("cancel_date");
				
				DomesticFlightCancelCheckDto dto = new DomesticFlightCancelCheckDto(reservationCode, name, price, person, departure, cancelDate);
				dfccDto.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
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
		return dfccDto;
	}
	
// 투어예약 내역	
	public ArrayList<ShowTourReservationDto> showTourReservation(String userId) {
		ArrayList<ShowTourReservationDto> listRet = new ArrayList<ShowTourReservationDto>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT  DISTINCT g.goods_name, " + 
					"        TO_CHAR(p.payment_date, 'YYYY-MM-DD') as payment_date   " + 
					"FROM reservation r " + 
					"LEFT JOIN payment p ON p.reservation_idx = r.goods_reservation_idx " + 
					"LEFT JOIN goods_reservation gr ON r.goods_reservation_idx = gr.reservation_idx " + 
					"LEFT JOIN goods_reservation_num grn ON gr.reservation_code = grn.reservation_code " + 
					"LEFT JOIN goods_detail_type gdt ON gdt.detail_type_idx = grn.detail_type_idx " + 
					"LEFT JOIN goods_type gt ON gt.goods_idx = gdt.goods_type_idx " + 
					"LEFT JOIN goods g ON g.goods_idx = gt.goods_idx " + 
					"WHERE p.user_id = ? ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String goodsName = rs.getString("goods_name");
				String paymentDate = rs.getString("payment_date");
				ShowTourReservationDto dto = new ShowTourReservationDto(goodsName, paymentDate);
				listRet.add(dto);
			}
			rs.close();
			pstmt.close();
			conn.close();
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
