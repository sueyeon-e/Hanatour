package dto;

public class TabHotelInfoDto {
	private String location; 
	private String innKor; 
	private String innEng; 
	private String address; 
	private String phone; 
	private String homepageUrl; 
	private String famousSpot; 
	private String floors; 
	private String roomNum; 
	private String checkInCheckOut; 
	private String imgUrl;
	
	public TabHotelInfoDto(String location, String innKor, String innEng, String address, String phone,
			String homepageUrl, String famousSpot, String floors, String roomNum, String checkInCheckOut,
			String imgUrl) {
		super();
		this.location = location;
		this.innKor = innKor;
		this.innEng = innEng;
		this.address = address;
		this.phone = phone;
		this.homepageUrl = homepageUrl;
		this.famousSpot = famousSpot;
		this.floors = floors;
		this.roomNum = roomNum;
		this.checkInCheckOut = checkInCheckOut;
		this.imgUrl = imgUrl;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getInnKor() {
		return innKor;
	}

	public void setInnKor(String innKor) {
		this.innKor = innKor;
	}

	public String getInnEng() {
		return innEng;
	}

	public void setInnEng(String innEng) {
		this.innEng = innEng;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getHomepageUrl() {
		return homepageUrl;
	}

	public void setHomepageUrl(String homepageUrl) {
		this.homepageUrl = homepageUrl;
	}

	public String getFamousSpot() {
		return famousSpot;
	}

	public void setFamousSpot(String famousSpot) {
		this.famousSpot = famousSpot;
	}

	public String getFloors() {
		return floors;
	}

	public void setFloors(String floors) {
		this.floors = floors;
	}

	public String getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}

	public String getCheckInCheckOut() {
		return checkInCheckOut;
	}

	public void setCheckInCheckOut(String checkInCheckOut) {
		this.checkInCheckOut = checkInCheckOut;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
}
