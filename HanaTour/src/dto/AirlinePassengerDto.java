package dto;

public class AirlinePassengerDto {
	
	private int passengerIdx;
	private String reservationIdx;
	private String nameKor;
	private String nameEng;
	private String birth;
	private String gender;
	private String phone;
	private String email;
	private String passportNumber;
	private String expiration;
	private String nation;
	private String issuing;
	
	
	public AirlinePassengerDto() {
	}
	
	public AirlinePassengerDto(int passengerIdx, String reservationIdx, String nameKor, String nameEng, String birth,
			String gender, String phone, String email, String passportNumber, String expiration, String nation,
			String issuing) {
		super();
		this.passengerIdx = passengerIdx;
		this.reservationIdx = reservationIdx;
		this.nameKor = nameKor;
		this.nameEng = nameEng;
		this.birth = birth;
		this.gender = gender;
		this.phone = phone;
		this.email = email;
		this.passportNumber = passportNumber;
		this.expiration = expiration;
		this.nation = nation;
		this.issuing = issuing;
	}

	public int getPassengerIdx() {
		return passengerIdx;
	}

	public void setPassengerIdx(int passengerIdx) {
		this.passengerIdx = passengerIdx;
	}

	public String getReservationIdx() {
		return reservationIdx;
	}

	public void setReservationIdx(String reservationIdx) {
		this.reservationIdx = reservationIdx;
	}

	public String getNameKor() {
		return nameKor;
	}

	public void setNameKor(String nameKor) {
		this.nameKor = nameKor;
	}

	public String getNameEng() {
		return nameEng;
	}

	public void setNameEng(String nameEng) {
		this.nameEng = nameEng;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassportNumber() {
		return passportNumber;
	}

	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}

	public String getExpiration() {
		return expiration;
	}

	public void setExpiration(String expiration) {
		this.expiration = expiration;
	}

	public String getNation() {
		return nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getIssuing() {
		return issuing;
	}

	public void setIssuing(String issuing) {
		this.issuing = issuing;
	}
	
	
	
	
	
}
