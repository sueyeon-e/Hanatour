package dao;

import java.sql.*;
import java.util.ArrayList;

import dto.DomesticReservPersonDto;
import dto.DomesticSearchDto;

public class DomesticReservationDao {
	Connection getConnection() throws Exception {
		String driver = "oracle.jdbc.driver.OracleDriver";
	      String url = "jdbc:oracle:thin:@localhost:1521:xe";
	      String dbId = "project";
	      String dbPw = "pass1234";
	      
	      Class.forName(driver);
	      Connection conn = DriverManager.getConnection(url, dbId, dbPw);

	      return conn;
	}
	
	public ArrayList<DomesticReservPersonDto> getReservPersonInfo(int roomIdx) throws Exception {
		ArrayList<DomesticReservPersonDto> listRet = new ArrayList<DomesticReservPersonDto>();
		
		String sql = "SELECT DISTINCT uif.name, uif.gender, uif.birth, uif.phone, uif.email, rv.adult_num, rv.child_num, rv.infant_num"
				+ " FROM user_info uif "
				+ " LEFT JOIN inn_reservation rv ON uif.user_id = rv.user_id"
				+ " LEFT JOIN room r ON r.room_idx = rv.room_idx"
				+ " WHERE rv.room_idx =?";
		
		Connection conn = getConnection();
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, roomIdx);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			String name = rs.getString("name");
			String gender = rs.getString("gender");
			String birth = rs.getString("birth");
			String phone=  rs.getString("phone");
			String email = rs.getString("email");
			int adultNum = rs.getInt("adult_num");
			int childNum = rs.getInt("child_num");
			int infantNum = rs.getInt("infant_num");
			DomesticReservPersonDto reservPerson = new DomesticReservPersonDto(name, gender, birth, phone, email, adultNum, childNum, infantNum);
			listRet.add(reservPerson);
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return listRet;
		
	}
	

}
