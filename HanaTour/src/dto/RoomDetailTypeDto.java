package dto;

public class RoomDetailTypeDto {
	private String room_type;
	private String room_name;
	private String title;
	private int personnel;
	private int max_personnel;
	private String checkin;
	private int price;
	private int max_days;
	private int max_room;
	public RoomDetailTypeDto(String room_type, String room_name, String title, int personnel, int max_personnel,
			String checkin, int price, int max_days, int max_room) {
		super();
		this.room_type = room_type;
		this.room_name = room_name;
		this.title = title;
		this.personnel = personnel;
		this.max_personnel = max_personnel;
		this.checkin = checkin;
		this.price = price;
		this.max_days = max_days;
		this.max_room = max_room;
	}
	public String getRoom_type() {
		return room_type;
	}
	public void setRoom_type(String room_type) {
		this.room_type = room_type;
	}
	public String getRoom_name() {
		return room_name;
	}
	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPersonnel() {
		return personnel;
	}
	public void setPersonnel(int personnel) {
		this.personnel = personnel;
	}
	public int getMax_personnel() {
		return max_personnel;
	}
	public void setMax_personnel(int max_personnel) {
		this.max_personnel = max_personnel;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMax_days() {
		return max_days;
	}
	public void setMax_days(int max_days) {
		this.max_days = max_days;
	}
	public int getMax_room() {
		return max_room;
	}
	public void setMax_room(int max_room) {
		this.max_room = max_room;
	}
	
}
