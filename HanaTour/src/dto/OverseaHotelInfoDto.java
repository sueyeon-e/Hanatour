package dto;

public class OverseaHotelInfoDto {
	private String addressEng; 
	private String checkinCheckout; 
	private int floors; 
	private int roomNum; 
	private String phone; 
	private String fax;
	public OverseaHotelInfoDto(String addressEng, String checkinCheckout, int floors, int roomNum, String phone,
			String fax) {
		super();
		this.addressEng = addressEng;
		this.checkinCheckout = checkinCheckout;
		this.floors = floors;
		this.roomNum = roomNum;
		this.phone = phone;
		this.fax = fax;
	}
	public String getAddressEng() {
		return addressEng;
	}
	public void setAddressEng(String addressEng) {
		this.addressEng = addressEng;
	}
	public String getCheckinCheckout() {
		return checkinCheckout;
	}
	public void setCheckinCheckout(String checkinCheckout) {
		this.checkinCheckout = checkinCheckout;
	}
	public int getFloors() {
		return floors;
	}
	public void setFloors(int floors) {
		this.floors = floors;
	}
	public int getRoomNum() {
		return roomNum;
	}
	public void setRoomNum(int roomNum) {
		this.roomNum = roomNum;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	
	
}
