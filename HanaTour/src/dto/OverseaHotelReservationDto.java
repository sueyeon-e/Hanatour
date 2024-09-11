package dto;

public class OverseaHotelReservationDto {
	private String innKor;
	private String countryName;
	private String cityName;
	private String roomName;
	public OverseaHotelReservationDto(String innKor, String countryName, String cityName, String roomName) {
		super();
		this.innKor = innKor;
		this.countryName = countryName;
		this.cityName = cityName;
		this.roomName = roomName;
	}
	public String getInnKor() {
		return innKor;
	}
	public void setInnKor(String innKor) {
		this.innKor = innKor;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	
}
