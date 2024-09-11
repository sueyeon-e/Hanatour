package dto;

public class RoomTypeDto {
	private String room_type;
	private String title;
	private String info;
	private String img_url;
	public RoomTypeDto(String room_type, String title, String info, String img_url) {
		super();
		this.room_type = room_type;
		this.title = title;
		this.info = info;
		this.img_url = img_url;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	
}
