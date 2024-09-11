package dto;

public class TravelReservationProductInfoDto {
	private String packageName;
	private String imgUrl;
	private String departureDate;
	private String arrivalDate;
	private int period;
	
	public TravelReservationProductInfoDto(String packageName, String imgUrl, String departureDate, String arrivalDate,
			int period) {
		super();
		this.packageName = packageName;
		this.imgUrl = imgUrl;
		this.departureDate = departureDate;
		this.arrivalDate = arrivalDate;
		this.period = period;
	}
	
	public String getPackageName() {
		return packageName;
	}
	
	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}
	
	public String getImgUrl() {
		return imgUrl;
	}
	
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	public String getDepartureDate() {
		return departureDate;
	}
	
	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}
	
	public String getArrivalDate() {
		return arrivalDate;
	}
	
	public void setArrivalDate(String arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
	
	public int getPeriod() {
		return period;
	}
	
	public void setPeriod(int period) {
		this.period = period;
	}
}
