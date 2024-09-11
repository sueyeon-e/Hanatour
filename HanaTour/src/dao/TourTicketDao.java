package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dto.TourDetailPriceDto;
import dto.TourDetailTypeDto;
import dto.TourIconDto;
import dto.TourInquiryDto;
import dto.TourTicketDto;
import dto.TourTicketTypeDto;
import dto.TourTypeTitleDto;

public class TourTicketDao {
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
	

	// 검색 결과
	public ArrayList<TourTicketDto> getTourTicketInfo(int goodsIdx) {
		ArrayList<TourTicketDto> listRet = new ArrayList<TourTicketDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT g.goods_idx,"
					+ "	   c.city_name,  "
					+ "    g.goods_name,  "
					+ "    g.when_use,  "
					+ "    g.ticket_type "
					+ "FROM goods g "
					+ "LEFT JOIN city c ON c.city_idx = g.city_idx "
					+ "WHERE g.goods_idx=? ";
			
	
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodsIdx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int tourGoodsIdx = rs.getInt("goods_idx");
				String cityName = rs.getString("city_name");
				String goodsName = rs.getString("goods_name");
				String whenUse = rs.getString("when_use");
				String ticketType = rs.getString("ticket_type");
				TourTicketDto tourTicketInfo = new TourTicketDto(tourGoodsIdx, cityName, goodsName, whenUse, ticketType);
				listRet.add(tourTicketInfo);
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
	
	// 투어/입장권 문의글 등록
	public void registerInquiry(int goodsIdx, String userId, String inquiryType ,String goodsInquiryTitle, String question, String secret ) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			String sql = "INSERT INTO goods_inquiry(goods_inquiry_idx, goods_idx, user_id, inquiry_type, goods_inquiry_title, regist_date, question, secret) "
					+ "VALUES(seq_goods_inquiry.nextval, ? , ?, ?, ? , SYSDATE, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodsIdx);
			pstmt.setString(2, userId);
			pstmt.setString(3, inquiryType);
			pstmt.setString(4, goodsInquiryTitle);
			pstmt.setString(5, question);
			pstmt.setString(6, secret);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {	
			try {
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 문의글
	public ArrayList<TourInquiryDto> getTourInquiry(int goodsIdx) {
		ArrayList<TourInquiryDto> listRet = new ArrayList<TourInquiryDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT gi.secret, uif.name, gi.regist_date, gi.inquiry_type, gi.goods_inquiry_title, gi.question, gi.answer "
					+ "FROM user_info uif "
					+ "LEFT JOIN goods_inquiry gi ON gi.user_id = uif.user_id "
					+ "WHERE gi.goods_idx=? "
					+ "ORDER BY gi.regist_date DESC";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodsIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String secret = rs.getString("secret");
				String name = rs.getString("name");
				String registDate = rs.getString("regist_date");
				String inquiryType = rs.getString("inquiry_type");
				String goodsInquiryTitle = rs.getString("goods_inquiry_title");
				String question = rs.getString("question");
				String answer = rs.getString("answer");
				TourInquiryDto tourInquiry = new TourInquiryDto(secret, name, registDate, inquiryType, goodsInquiryTitle, question, answer);
				listRet.add(tourInquiry);
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
	
	// 상세페이지 상단 정보 아이콘
	public ArrayList<TourIconDto> getTourIcon(int goodsIdx) {
		ArrayList<TourIconDto> listRet = new ArrayList<TourIconDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT g.goods_idx, i.goods_icon_title, img.img_url "
					+ "FROM goods g "
					+ "LEFT JOIN goods_icon i ON g.goods_idx = i.goods_idx "
					+ "LEFT JOIN goods_icon_img img ON i.goods_icon_title = img.goods_icon_title "
					+ "WHERE g.goods_idx = ? ";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, goodsIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int tourGoodsIdx = rs.getInt("goods_idx");
				String goodsIconTitle = rs.getString("goods_icon_title");
				String imgUrl = rs.getString("img_url");
				TourIconDto tourIcon = new TourIconDto(tourGoodsIdx, goodsIconTitle, imgUrl);
				listRet.add(tourIcon);
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
	
	// 상품 타입별 정보
	public ArrayList<TourTicketTypeDto> getTourType(int getGoodsIdx, String getTypeDate) {
		ArrayList<TourTicketTypeDto> listRet = new ArrayList<TourTicketTypeDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT DISTINCT g.goods_idx, "
					+ "    gt.goods_type_idx, "
					+ "    gt.type_date, "
					+ "    gt.goods_type_title, "
					+ "    gt.type_info, "
					+ "    gt.info_include, "
					+ "    gt.info_exclude "
					+ "FROM goods g "
					+ "LEFT JOIN goods_type gt ON gt.goods_idx = g.goods_idx "
					+ "LEFT JOIN goods_detail_type dt ON dt.goods_type_idx = gt.goods_type_idx "
					+ "WHERE g.goods_idx = ? "
					+ "AND gt.type_date = ? ";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getGoodsIdx);
			pstmt.setString(2, getTypeDate);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int goodsIdx = rs.getInt("goods_idx");
				int goodsTypeIdx = rs.getInt("goods_type_idx");
				String typeDate = rs.getString("type_date");
				String goodsTypeTitle = rs.getString("goods_type_title");
				String typeInfo = rs.getString("type_info");
				String infoInclude = rs.getString("info_include");
				String infoExclude = rs.getString("info_exclude");
				TourTicketTypeDto getType = new TourTicketTypeDto(goodsIdx, goodsTypeIdx, typeDate, goodsTypeTitle, typeInfo, infoInclude, infoExclude);
				listRet.add(getType);
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
	
	// 상품 타입과 상세 타입 연결
	public ArrayList<TourTypeTitleDto> getTourTypeTitle() {
		ArrayList<TourTypeTitleDto> listRet = new ArrayList<TourTypeTitleDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT gt.goods_type_idx, "
					+ "    dt.detail_type_idx, "
					+ "    dt.title "
					+ "FROM goods_type gt "
					+ "LEFT JOIN goods_detail_type dt ON gt.goods_type_idx = dt.goods_type_idx "
					+ "WHERE dt.detail_type_idx IS NOT NULL "
					+ "    AND dt.title IS NOT NULL ";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int goodsTypeIdx = rs.getInt("goods_type_idx");
				int detailTypeIdx = rs.getInt("detail_type_idx");
				String title = rs.getString("title");
				TourTypeTitleDto getTypeTitle = new TourTypeTitleDto(goodsTypeIdx, detailTypeIdx, title);
				listRet.add(getTypeTitle);
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
	
	// 상품 상세 타입 정보
	public ArrayList<TourDetailTypeDto> getTourDetailType() {
		ArrayList<TourDetailTypeDto> listRet = new ArrayList<TourDetailTypeDto>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT gt.goods_type_idx, "
					+ "    dt.detail_type_idx, "
					+ "    dt.title, "
					+ "    dt.type_title, "
					+ "    dt.type_price, "
					+ "    dt.min_num, "
					+ "    dt.max_num, "
					+ "    dt.min_age, "
					+ "    dt.max_age "
					+ "FROM goods_type gt "
					+ "LEFT JOIN goods_detail_type dt ON dt.goods_type_idx = gt.goods_type_idx  "
					+ "WHERE dt.detail_type_idx IS NOT NULL "
					+ "    AND dt.title IS NOT NULL ";
			
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int goodsTypeIdx = rs.getInt("goods_type_idx");
				int detailTypeIdx = rs.getInt("detail_type_idx");
				String title = rs.getString("title");
				String typeTitle = rs.getString("type_title");
				int typePrice = rs.getInt("type_price");
				int minNum = rs.getInt("min_num");
				int maxNum = rs.getInt("max_num");
				int minAge = rs.getInt("max_age");
				int maxAge = rs.getInt("max_age");
				TourDetailTypeDto getDetailType = new TourDetailTypeDto(goodsTypeIdx, detailTypeIdx, title, typeTitle, typePrice, minNum, maxNum, minAge, maxAge);
				listRet.add(getDetailType);
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
	
	// 상품 상세 타입 상세 정보
	public ArrayList<TourDetailPriceDto> getTourDetailPriceInfo(int getGoodsTypeIdx) {
		ArrayList<TourDetailPriceDto> listRet = new ArrayList<TourDetailPriceDto>();
		 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT dt.detail_type_idx, "
					+ "    gt.goods_type_idx, "
					+ "    dt.type_title, "
					+ "    dt.type_price, "
					+ "    dt.min_num, "
					+ "    dt.max_num "
					+ "FROM goods g "
					+ "LEFT JOIN goods_type gt ON g.goods_idx = gt.goods_idx "
					+ "LEFT JOIN goods_detail_type dt ON dt.goods_type_idx = gt.goods_type_idx "
					+ "WHERE gt.goods_type_idx = ? ";
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getGoodsTypeIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int detailTypeIdx = rs.getInt("detail_type_idx");
				int goodsTypeIdx = rs.getInt("goods_type_idx");
				String typeTitle = rs.getString("type_title");
				int typePrice = rs.getInt("type_price");
				int minNum = rs.getInt("min_num");
				int maxNum = rs.getInt("max_num");
				TourDetailPriceDto getDetailPrice = new TourDetailPriceDto(detailTypeIdx, goodsTypeIdx, typeTitle, typePrice, minNum, maxNum);
				listRet.add(getDetailPrice);
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
