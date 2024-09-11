package dto;

public class OverseaRoomDto {
	private String roomType;
	private int roomIdx;
	private String roomName;
	private String alarm;
	private String cancelDate;
	private String breakfast;
	private int price;
	private String checkin;
	private int maxDays;
	private int maxRoom;
	public OverseaRoomDto(String roomType, int roomIdx, String roomName, String alarm, String cancelDate,
			String breakfast, int price, String checkin, int maxDays, int maxRoom) {
		super();
		this.roomType = roomType;
		this.roomIdx = roomIdx;
		this.roomName = roomName;
		this.alarm = alarm;
		this.cancelDate = cancelDate;
		this.breakfast = breakfast;
		this.price = price;
		this.checkin = checkin;
		this.maxDays = maxDays;
		this.maxRoom = maxRoom;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getRoomIdx() {
		return roomIdx;
	}
	public void setRoomIdx(int roomIdx) {
		this.roomIdx = roomIdx;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getAlarm() {
		return alarm;
	}
	public void setAlarm(String alarm) {
		this.alarm = alarm;
	}
	public String getCancelDate() {
		return cancelDate;
	}
	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}
	public String getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public int getMaxDays() {
		return maxDays;
	}
	public void setMaxDays(int maxDays) {
		this.maxDays = maxDays;
	}
	public int getMaxRoom() {
		return maxRoom;
	}
	public void setMaxRoom(int maxRoom) {
		this.maxRoom = maxRoom;
	}
	
}
