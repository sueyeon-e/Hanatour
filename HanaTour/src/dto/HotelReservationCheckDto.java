package dto;

public class HotelReservationCheckDto {
	private String reservation_code;
	private String inn_kor;
	private int price;
	private int person;
	private String checkin;
	private String checkout;
	
	public HotelReservationCheckDto(String reservation_code, String inn_kor, int price, int person, String checkin, String checkout) {
		super();
		this.reservation_code = reservation_code;
		this.inn_kor = inn_kor;
		this.price = price;
		this.person = person;
		this.checkin = checkin;
		this.checkout = checkout;
	}

	public String getReservation_code() {
		return reservation_code;
	}

	public void setReservation_code(String reservation_code) {
		this.reservation_code = reservation_code;
	}

	public String getInn_kor() {
		return inn_kor;
	}

	public void setInn_kor(String inn_kor) {
		this.inn_kor = inn_kor;
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

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}

	public String getCheckout() {
		return checkout;
	}

	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	
	
	
	
}
