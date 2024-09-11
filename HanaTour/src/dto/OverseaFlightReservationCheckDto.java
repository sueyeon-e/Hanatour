package dto;

public class OverseaFlightReservationCheckDto {
	private String reservationCode;
	private String name;
	private int price;
	private int person;
	private String departure;
	
	public OverseaFlightReservationCheckDto(String reservationCode, String name, int price, int person, String departure) {
		super();
		this.reservationCode = reservationCode;
		this.name = name;
		this.price = price;
		this.person = person;
		this.departure = departure;
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
	
	
	
}
