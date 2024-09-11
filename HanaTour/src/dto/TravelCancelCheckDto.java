package dto;

public class TravelCancelCheckDto {
	private String reservationCode;
	private String packageName;
	private String price;
	private int member;
	private String earliestDate;
	private String latestDate;
	private String cancelDate;
	
	public TravelCancelCheckDto(String reservationCode, String packageName, String price, int member, String earliestDate, String latestDate, String cancelDate) {
		super();
		this.reservationCode = reservationCode;
		this.packageName = packageName;
		this.price = price;
		this.member = member;
		this.earliestDate = earliestDate;
		this.latestDate = latestDate;
		this.cancelDate = cancelDate;
	}

	public String getReservationCode() {
		return reservationCode;
	}

	public void setReservationCode(String reservationCode) {
		this.reservationCode = reservationCode;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getMember() {
		return member;
	}

	public void setMember(int member) {
		this.member = member;
	}

	public String getEarliestDate() {
		return earliestDate;
	}

	public void setEarliestDate(String earliestDate) {
		this.earliestDate = earliestDate;
	}

	public String getLatestDate() {
		return latestDate;
	}

	public void setLatestDate(String latestDate) {
		this.latestDate = latestDate;
	}

	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}
	
	
	
}
