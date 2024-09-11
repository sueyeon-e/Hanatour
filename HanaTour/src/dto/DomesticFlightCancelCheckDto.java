package dto;

public class DomesticFlightCancelCheckDto {
	private String reservationCode;
	private String name;
	private int price;
	private int person;
	private String departure;
	private String cancelDate;
	
	public DomesticFlightCancelCheckDto(String reservationCode, String name, int price, int person, String departure, String cancelDate) {
		super();
		this.reservationCode = reservationCode;
		this.name = name;
		this.price = price;
		this.person = person;
		this.departure = departure;
		this.cancelDate = cancelDate;
	}

	public String getReservationCode() {
		return reservationCode;
	}

	public void setReservationCode(String reservationCode) {
		this.reservationCode = reservationCode;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getPerson() {
		return person;
	}

	public void setPerson(int person) {
		this.person = person;
	}

	public String getDeparture() {
		return departure;
	}

	public void setDeparture(String departure) {
		this.departure = departure;
	}

	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}
}
