package dto;

public class TravelReservationCheckDto {
	private String reservationCode;
	private String packageName;
	private int member;
	private int price;
	private String earliestDate;
	private String latestDate;
	 
	public TravelReservationCheckDto(String reservationCode, String packageName, int member, int price,
			String earliestDate, String latestDate) {
		super();
		this.reservationCode = reservationCode;
		this.packageName = packageName;
		this.member = member;
		this.price = price;
		this.earliestDate = earliestDate;
		this.latestDate = latestDate;
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

	public int getMember() {
		return member;
	}

	public void setMember(int member) {
		this.member = member;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
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
}
