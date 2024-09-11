package dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.print.attribute.standard.JobHoldUntil;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dto.AirlineTicketDto;

public class AirlineTicketDao {

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
	
	
	
	// 검색창에 입력받은 파라미터로 조건에 맞는 항공권 목록  
	public ArrayList<AirlineTicketDto> getRoundTripAirlineTicket( 
											String departureIata, String arrivalIata, String departureDate, 
											String directFlight, int memberNumber, String seatClass) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<AirlineTicketDto> aDtoList = new ArrayList<AirlineTicketDto>();
	
		// 직항 여부
		String directFlightSqlInput;
		if(directFlight.equals("on")) {
			directFlightSqlInput = "AND at.stop = 0 ";
		} else {
			directFlightSqlInput = "";
		}
		
		try {
			conn = getConnection();
			String sql = 
					"WITH    seat_counts AS ( " + 
					"            SELECT  at.ticket_idx, " + 
					"                    at.model_idx, " + 
					"                    ( " + 
					"                        SELECT count(*) " + 
					"                        FROM seat s " + 
					"                        WHERE s.model_idx = at.model_idx " + 
					"                            AND s.class = ? " + 
					"                    )   AS total_seats, " + 
					"                    ( " + 
					"                        SELECT count(*) " + 
					"                        FROM seat_reservation_status sr " + 
					"                        LEFT JOIN seat s  " + 
					"                        ON s.seat_idx = sr.seat_idx " + 
					"                        WHERE sr.reservation_state = 'T' " + 
					"                            AND sr.ticket_idx = at.ticket_idx " + 
					"                            AND s.class = ? " + 
					"                    )   AS reserved_seats " + 
					"        FROM airline_ticket at " + 
					") " + 
					"SELECT  DISTINCT " + 
					"        at.ticket_idx AS ticket_idx, " + 
					"        at.departure_iata AS departure_iata, " + 
					"        at.arrival_iata AS arrival_iata, " + 
					"        at.airline_iata AS airline_iata, " + 
					"        al.logo AS airline_logo, " + 
					"        at.model_idx AS model_idx, " + 
					" 		 TO_CHAR(departure_time, 'YYYY-MM-DD') AS departure_time_date, " + 
					"        TO_CHAR(departure_time, 'HH24:MI') AS departure_time_hour, " + 
					"        TO_CHAR(arrival_time, 'YYYY-MM-DD') AS arrival_time_date, " + 
					"        TO_CHAR(arrival_time, 'HH24:MI') AS arrival_time_hour, " + 
					"		 LPAD(TRUNC((arrival_time - departure_time) * 24 * 60 * 60 / 3600), 2, ' ') || '시간 ' || " + 
					"        LPAD(TRUNC(MOD((arrival_time - departure_time) * 24 * 60 * 60, 3600) / 60), 2, ' ') || '분' AS flying_time," +  
					"        at.stop AS stop, " + 
					"        at.free_baggage AS free_baggage, " + 
					"        at.codeshare AS codeshare, " + 
					"		 at.codeshare_airline AS codeshare_airline, " +
					"        at.flight_number AS flight_number, " + 
					"        at.departure_terminal AS departure_terminal, " + 
					"        at.arrival_terminal AS arrival_terminal, " + 
					"        at.economy_class_price AS economy_class_price, " + 
					"        at.prestige_class_price AS prestige_class_price, " + 
					"        (sc.total_seats - sc.reserved_seats) AS left_seats     " + 
					"FROM    airline_ticket at " + 
					"        LEFT JOIN seat_counts sc  " + 
					"        ON at.ticket_idx = sc.ticket_idx " + 
					"        LEFT JOIN airline al " + 
					"        ON at.airline_iata = al.iata " + 
					"WHERE   at.departure_iata IN ( " + 
					"            SELECT ap.iata " + 
					"            FROM airport ap " + 
					"            WHERE ap.big_city_iata = ? " + 
					"            UNION " + 
					"            SELECT ap.iata " + 
					"            FROM airport ap " + 
					"            WHERE ap.iata = ? " + 
					"        ) " + 
					"        AND  " + 
					"        at.arrival_iata IN ( " + 
					"            SELECT ap.iata " + 
					"            FROM airport ap " + 
					"            WHERE ap.big_city_iata = ? " + 
					"            UNION " + 
					"            SELECT ap.iata " + 
					"            FROM airport ap " + 
					"            WHERE ap.iata = ? " + 
					"        ) " + 
					"        AND  " + 
					"        TRUNC(at.departure_time) = TO_DATE(?, 'YYYY-MM-DD') " + 
					"        AND  " + 
					"        (sc.total_seats - sc.reserved_seats) >= ?  " + 
					directFlightSqlInput + 
					"ORDER BY departure_time_date ASC, departure_time_hour ASC";
					
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, seatClass);
			pstmt.setString(2, seatClass);
			
			pstmt.setString(3, departureIata);
			pstmt.setString(4, departureIata);
			
			pstmt.setString(5, arrivalIata);
			pstmt.setString(6, arrivalIata);
			
			pstmt.setString(7, departureDate);
			pstmt.setInt(8, memberNumber);
			
			rs = pstmt.executeQuery();
			
			
			AirlineDao aDao = new AirlineDao();
			
			while(rs.next()) {
				
				AirlineTicketDto aDto = new AirlineTicketDto();
				
				aDto.setTicketIdx( rs.getInt("ticket_idx") );
				aDto.setDepartureIata( rs.getString("departure_iata") );
				aDto.setArrivalIata( rs.getString("arrival_iata") );
				aDto.setAirlineIata( rs.getString("airline_iata") );
				aDto.setModelIdx( Integer.parseInt( rs.getString("model_idx") ) );
				
				aDto.setDepartureTimeDate( rs.getString("departure_time_date") );
				aDto.setDepartureTimeHour( rs.getString("departure_time_hour") );
				
				aDto.setArrivalTimeDate( rs.getString("arrival_time_date") );
				aDto.setArrivalTimeHour( rs.getString("arrival_time_hour") );
				
				aDto.setFlyingTime( rs.getString("flying_time") );
				
				aDto.setStop( Integer.parseInt( rs.getString("stop") ) );
				aDto.setFreeBaggage( rs.getString("free_baggage") );
				
				aDto.setCodeShare( rs.getString("codeshare") );
				aDto.setCodeShareAirline( rs.getString("codeshare_airline") );
				
				aDto.setFlightNumber( rs.getString("flight_number") );
				
				aDto.setDepartureTerminal( rs.getString("departure_terminal") );
				aDto.setArrivalTerminal( rs.getString("arrival_terminal") );
				
				aDto.setEconomyClassPrice( Integer.parseInt( rs.getString("economy_class_price") ) );
				aDto.setPrestigeClassPrice( Integer.parseInt( rs.getString("prestige_class_price") ) );
				
				aDto.setLeftSeats( Integer.parseInt( rs.getString("left_seats") ) );
				
				String airlineName = aDao.getAirlineKorNameByIata(aDto.getAirlineIata());
				aDto.setAirlineName(airlineName);
				
				String codeShareAirlineName = aDao.getAirlineKorNameByIata(aDto.getCodeShareAirline());
				aDto.setCodeShareAirline(codeShareAirlineName);
				
				aDtoList.add(aDto);
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
		
		return  aDtoList;
	}
	
	
	
	
	
	
	// 특정 ticketIdx의 항공권 목록 
	public ArrayList<AirlineTicketDto> getAirlineTicketByTicektIdx(int[] ticketIdx, String seatClass) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<AirlineTicketDto> ticketList = new ArrayList<AirlineTicketDto>();
		
		try {
			conn = getConnection();
			
			// sb1 : 항공권 개수만큼 WHERE절 추가
			// WHERE   at.ticket_idx IN (75, 76) 
			StringBuffer sb1 = new StringBuffer();
			sb1.append("WHERE   at.ticket_idx IN (");

			
			// sb2 : 항공권 개수만큼 ORDER BY절 추가
			/*
				 WHEN 75 THEN 1 " + 
				 WHEN 76 THEN 2 " + 
			 */
			StringBuffer sb2 = new StringBuffer();

			// sb1, sb2 append
			for(int i = 0; i < ticketIdx.length; i++) {
				if(i == 0) {
					sb1.append(ticketIdx[i]);
					sb2.append( " WHEN " + ticketIdx[i] + " THEN " + (i + 1) );
				} else {
					sb1.append(", " + ticketIdx[i]);
					sb2.append( " WHEN " + ticketIdx[i] + " THEN " + (i + 1) );
				}
			}
			sb1.append(") ");
			
			
			String sql = 
					"WITH    seat_counts AS ( " + 
					"            SELECT " + 
					"            at.ticket_idx, " + 
					"            at.model_idx, " + 
					"            ( " + 
					"                SELECT count(*) " + 
					"                FROM seat s " + 
					"                WHERE s.model_idx = at.model_idx " + 
					"                    AND s.class = ? " + 
					"            )   AS total_seats, " + 
					"            ( " + 
					"                SELECT count(*) " + 
					"                FROM seat_reservation_status sr " + 
					"                LEFT JOIN seat s  " + 
					"                ON s.seat_idx = sr.seat_idx " + 
					"                WHERE sr.reservation_state = 'T' " + 
					"                    AND sr.ticket_idx = at.ticket_idx " + 
					"                    AND s.class = ? " + 
					"            )   AS reserved_seats " + 
					"            FROM airline_ticket at " + 
					") " + 
					"SELECT  DISTINCT " + 
					"        at.ticket_idx AS ticket_idx, " + 
					"        at.departure_iata AS departure_iata, " + 
					"        at.arrival_iata AS arrival_iata, " + 
					"        at.airline_iata AS airline_iata, " + 
					"        at.model_idx AS model_idx, " + 
					"        TO_CHAR(at.departure_time, 'YYYY-MM-DD') AS departure_time_date, " + 
					"        TO_CHAR(at.departure_time, 'HH24:MI') AS departure_time_hour, " + 
					"        TO_CHAR(at.arrival_time, 'YYYY-MM-DD') AS arrival_time_date, " + 
					"        TO_CHAR(at.arrival_time, 'HH24:MI') AS arrival_time_hour, " + 
					"        LPAD(TRUNC((at.arrival_time - at.departure_time) * 24 * 60 * 60 / 3600), 2, ' ') || '시간 ' || " + 
					"        LPAD(TRUNC(MOD((at.arrival_time - at.departure_time) * 24 * 60 * 60, 3600) / 60), 2, ' ') || '분' AS flying_time, " + 
					"        at.stop AS stop, " + 
					"        at.free_baggage AS free_baggage, " + 
					"        at.codeshare AS codeshare, " + 
					"		 at.codeshare_airline AS codeshare_airline," +
					"        at.flight_number AS flight_number, " + 
					"        at.departure_terminal AS departure_terminal, " + 
					"        at.arrival_terminal AS arrival_terminal, " + 
					"        at.economy_class_price AS economy_class_price, " + 
					"        at.prestige_class_price AS prestige_class_price, " + 
					"        (sc.total_seats - sc.reserved_seats) AS left_seats     " + 
					"FROM    airline_ticket at " + 
					"        LEFT JOIN seat_counts sc  " + 
					"        ON at.ticket_idx = sc.ticket_idx " + 
					sb1 + 
					"ORDER BY  " + 
					"    CASE at.ticket_idx " + 
						sb2 + 
					"    END " + 
					"";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seatClass);
			pstmt.setString(2, seatClass);
			
			rs = pstmt.executeQuery();
			
			AirlineDao aDao = new AirlineDao();
			
			while( rs.next() ) {
				
				AirlineTicketDto aDto = new AirlineTicketDto();
				
				aDto.setTicketIdx( rs.getInt("ticket_idx") );
				aDto.setDepartureIata( rs.getString("departure_iata") );
				aDto.setArrivalIata( rs.getString("arrival_iata") );
				aDto.setAirlineIata( rs.getString("airline_iata") );
				aDto.setModelIdx( Integer.parseInt( rs.getString("model_idx") ) );
				
				aDto.setDepartureTimeDate( rs.getString("departure_time_date") );
				aDto.setDepartureTimeHour( rs.getString("departure_time_hour") );
				
				aDto.setArrivalTimeDate( rs.getString("arrival_time_date") );
				aDto.setArrivalTimeHour( rs.getString("arrival_time_hour") );
				
				aDto.setFlyingTime( rs.getString("flying_time") );
				
				aDto.setStop( Integer.parseInt( rs.getString("stop") ) );
				aDto.setFreeBaggage( rs.getString("free_baggage") );
				
				aDto.setCodeShare( rs.getString("codeshare") );
				aDto.setCodeShareAirline( rs.getString("codeshare_airline") );
				
				aDto.setFlightNumber( rs.getString("flight_number") );
				
				aDto.setDepartureTerminal( rs.getString("departure_terminal") );
				aDto.setArrivalTerminal( rs.getString("arrival_terminal") );
				
				aDto.setEconomyClassPrice( Integer.parseInt( rs.getString("economy_class_price") ) );
				aDto.setPrestigeClassPrice( Integer.parseInt( rs.getString("prestige_class_price") ) );
				
				aDto.setLeftSeats( Integer.parseInt( rs.getString("left_seats") ) );
				
				String airlineName = aDao.getAirlineKorNameByIata(aDto.getAirlineIata());
				aDto.setAirlineName(airlineName);
				
				String codeShareAirlineName = aDao.getAirlineKorNameByIata(aDto.getCodeShareAirline());
				aDto.setCodeShareAirline(codeShareAirlineName);
				
				ticketList.add(aDto);
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
		
		return ticketList;
	}
	
	
	
	

	
	// ajax용 왕복 항공권 티켓 목록 - return : JSONArray
	public JSONArray getRoundTripAirlineTicketJAry(String departureIata, String arrivalIata, String departureDate, 
			String directFlight, int memberNumber, String seatClass, int[] ticketIdx) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		JSONArray jAry = new JSONArray();
		
		// 직항 여부
		String directFlightSqlInput;
		if(directFlight.equals("on")) {
			directFlightSqlInput = "AND at.stop = 0 ";
		} else {
			directFlightSqlInput = "";
		}
		
		try {
			conn = getConnection();
			String sql = 
					"WITH    seat_counts AS ( " + 
							"            SELECT  at.ticket_idx, " + 
							"                    at.model_idx, " + 
							"                    ( " + 
							"                        SELECT count(*) " + 
							"                        FROM seat s " + 
							"                        WHERE s.model_idx = at.model_idx " + 
							"                            AND s.class = ? " + 
							"                    )   AS total_seats, " + 
							"                    ( " + 
							"                        SELECT count(*) " + 
							"                        FROM seat_reservation_status sr " + 
							"                        LEFT JOIN seat s  " + 
							"                        ON s.seat_idx = sr.seat_idx " + 
							"                        WHERE sr.reservation_state = 'T' " + 
							"                            AND sr.ticket_idx = at.ticket_idx " + 
							"                            AND s.class = ? " + 
							"                    )   AS reserved_seats " + 
							"        FROM airline_ticket at " + 
							") " + 
							"SELECT  DISTINCT " + 
							"        at.ticket_idx AS ticket_idx, " + 
							"        at.departure_iata AS departure_iata, " + 
							"        at.arrival_iata AS arrival_iata, " + 
							"        at.airline_iata AS airline_iata, " + 
							"        al.logo AS airline_logo, " + 
							"        at.model_idx AS model_idx, " + 
							" 		 TO_CHAR(departure_time, 'YYYY-MM-DD') AS departure_time_date, " + 
							"        TO_CHAR(departure_time, 'HH24:MI') AS departure_time_hour, " + 
							"        TO_CHAR(arrival_time, 'YYYY-MM-DD') AS arrival_time_date, " + 
							"        TO_CHAR(arrival_time, 'HH24:MI') AS arrival_time_hour, " + 
							"		 LPAD(TRUNC((arrival_time - departure_time) * 24 * 60 * 60 / 3600), 2, ' ') || '시간 ' || " + 
							"        LPAD(TRUNC(MOD((arrival_time - departure_time) * 24 * 60 * 60, 3600) / 60), 2, ' ') || '분' AS flying_time," +  
							"        at.stop AS stop, " + 
							"        at.free_baggage AS free_baggage, " + 
							"        at.codeshare AS codeshare, " + 
							"		 at.codeshare_airline AS codeshare_airline, " +
							"        at.flight_number AS flight_number, " + 
							"        at.departure_terminal AS departure_terminal, " + 
							"        at.arrival_terminal AS arrival_terminal, " + 
							"        at.economy_class_price AS economy_class_price, " + 
							"        at.prestige_class_price AS prestige_class_price, " + 
							"        (sc.total_seats - sc.reserved_seats) AS left_seats     " + 
							"FROM    airline_ticket at " + 
							"        LEFT JOIN seat_counts sc  " + 
							"        ON at.ticket_idx = sc.ticket_idx " + 
							"        LEFT JOIN airline al " + 
							"        ON at.airline_iata = al.iata " + 
							"WHERE   at.departure_iata IN ( " + 
							"            SELECT ap.iata " + 
							"            FROM airport ap " + 
							"            WHERE ap.big_city_iata = ? " + 
							"            UNION " + 
							"            SELECT ap.iata " + 
							"            FROM airport ap " + 
							"            WHERE ap.iata = ? " + 
							"        ) " + 
							"        AND  " + 
							"        at.arrival_iata IN ( " + 
							"            SELECT ap.iata " + 
							"            FROM airport ap " + 
							"            WHERE ap.big_city_iata = ? " + 
							"            UNION " + 
							"            SELECT ap.iata " + 
							"            FROM airport ap " + 
							"            WHERE ap.iata = ? " + 
							"        ) " + 
							"        AND  " + 
							"        TRUNC(at.departure_time) = TO_DATE(?, 'YYYY-MM-DD') " + 
							"        AND  " + 
							"        (sc.total_seats - sc.reserved_seats) >= ?  " + 
							directFlightSqlInput + 
							"ORDER BY departure_time_date ASC, departure_time_hour ASC";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, seatClass);
			pstmt.setString(2, seatClass);
			
			pstmt.setString(3, departureIata);
			pstmt.setString(4, departureIata);
			
			pstmt.setString(5, arrivalIata);
			pstmt.setString(6, arrivalIata);
			
			pstmt.setString(7, departureDate);
			pstmt.setInt(8, memberNumber);
			
			rs = pstmt.executeQuery();
			
			AirlineDao aDao = new AirlineDao();
			
			while(rs.next()) {
				
				JSONObject jObj = new JSONObject();
				
				jObj.put("ticketIdx", rs.getInt("ticket_idx") );
				jObj.put("departureIata", rs.getString("departure_iata") );
				jObj.put("arrivalIata", rs.getString("arrival_iata") );
				
				jObj.put("airlineIata", rs.getString("airline_iata"));
				jObj.put("modelIdx", Integer.parseInt( rs.getString("model_idx") ) );
				
				jObj.put("departureTimeDate", rs.getString("departure_time_date") );
				jObj.put("departureTimeHour", rs.getString("departure_time_hour") );
				
				jObj.put("arrivalTimeDate", rs.getString("arrival_time_date") );
				jObj.put("arrivalTimeHour", rs.getString("arrival_time_hour") );
				
				jObj.put("flyingTime", rs.getString("flying_time") );
				
				jObj.put("stop", Integer.parseInt( rs.getString("stop") ) );
				jObj.put("freeBaggage", rs.getString("free_baggage") );
				
				jObj.put("codeShare", rs.getString("codeshare") );
				jObj.put("codeShareAirline", rs.getString("codeshare_airline") );
				
				jObj.put("flightNumber", rs.getString("flight_number") );
				
				jObj.put("departureTerminal", rs.getString("departure_terminal") );
				jObj.put("arrivalTerminal", rs.getString("arrival_terminal") );
				
				jObj.put("economyClassPrice", Integer.parseInt( rs.getString("economy_class_price") ) );
				jObj.put("prestigeClassPrice",  Integer.parseInt( rs.getString("prestige_class_price") ) );
				
				jObj.put("leftSeats", rs.getString("left_seats") );
				
				String airlineName = aDao.getAirlineKorNameByIata( (String)jObj.get("airlineIata") );
				jObj.put("airlineName", airlineName);
				
				String codeShareAirlineName = aDao.getAirlineKorNameByIata( (String)jObj.get("codeShareAirline") );
				jObj.put("codeShareAirlineName", codeShareAirlineName);
				
				jAry.add(jObj);
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
		
		return jAry;
	}
	

	

	
}
