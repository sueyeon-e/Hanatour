package dto;

public class OverseaAdditionalInfoDto {
	private String roomInfo;
	private String facilities;
	private String dining;
	private String nearEntertain;
	private String hotelInfo;
	private String constructionNotice;
	public OverseaAdditionalInfoDto(String roomInfo, String facilities, String dining, String nearEntertain,
			String hotelInfo, String constructionNotice) {
		super();
		this.roomInfo = roomInfo;
		this.facilities = facilities;
		this.dining = dining;
		this.nearEntertain = nearEntertain;
		this.hotelInfo = hotelInfo;
		this.constructionNotice = constructionNotice;
	}
	public String getRoomInfo() {
		return roomInfo;
	}
	public void setRoomInfo(String roomInfo) {
		this.roomInfo = roomInfo;
	}
	public String getFacilities() {
		return facilities;
	}
	public void setFacilities(String facilities) {
		this.facilities = facilities;
	}
	public String getDining() {
		return dining;
	}
	public void setDining(String dining) {
		this.dining = dining;
	}
	public String getNearEntertain() {
		return nearEntertain;
	}
	public void setNearEntertain(String nearEntertain) {
		this.nearEntertain = nearEntertain;
	}
	public String getHotelInfo() {
		return hotelInfo;
	}
	public void setHotelInfo(String hotelInfo) {
		this.hotelInfo = hotelInfo;
	}
	public String getConstructionNotice() {
		return constructionNotice;
	}
	public void setConstructionNotice(String constructionNotice) {
		this.constructionNotice = constructionNotice;
	}
	
	
	
}
