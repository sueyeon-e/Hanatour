package dto;

public class OverseaRoomTypeDto {
	private String roomType;
	private int price;
	public OverseaRoomTypeDto(String roomType, int price) {
		super();
		this.roomType = roomType;
		this.price = price;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
