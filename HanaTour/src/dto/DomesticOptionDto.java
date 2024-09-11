package dto;

public class DomesticOptionDto {
	private String roomName;
	private String chekIn;
	private int price;
	private int maxDays;
	private int maxRoom;
	public DomesticOptionDto(String roomName, String chekIn, int price, int maxDays, int maxRoom) {
		super();
		this.roomName = roomName;
		this.chekIn = chekIn;
		this.price = price;
		this.maxDays = maxDays;
		this.maxRoom = maxRoom;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getChekIn() {
		return chekIn;
	}
	public void setChekIn(String chekIn) {
		this.chekIn = chekIn;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
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
