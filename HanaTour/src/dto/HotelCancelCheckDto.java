package dto;

public class HotelCancelCheckDto {
	private String reservationCode;
	private String innKor;
	private int person;
	private String checkIn;
	private String checkOut;
	private String cancelDate;
	
	public HotelCancelCheckDto(String reservationCode, String innKor, int person, String checkIn, String checkOut, String cancelDate) {
		super();
		this.reservationCode = reservationCode;
		this.innKor = innKor;
		this.person = person;
		this.checkIn = checkIn;
		this.checkOut = checkOut;
		this.cancelDate = cancelDate;
	}

	public String getReservationCode() {
		return reservationCode;
	}

	public void setReservationCode(String reservationCode) {
		this.reservationCode = reservationCode;
	}

	public String getInnKor() {
		return innKor;
	}

	public void setInnKor(String innKor) {
		this.innKor = innKor;
	}

	public int getPerson() {
		return person;
	}

	public void setPerson(int person) {
		this.person = person;
	}

	public String getCheckIn() {
		return checkIn;
	}

	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}

	public String getCheckOut() {
		return checkOut;
	}

	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}

	public String getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(String cancelDate) {
		this.cancelDate = cancelDate;
	}
	
	

}
