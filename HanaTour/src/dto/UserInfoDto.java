package dto;

public class UserInfoDto {

	private String id;
	private String pw;
	private String name;
	private String gender;
	private String birth;
	private String phone;
	private String email;
	private String emergencyContact;
	
	private String lastName;
	private String firstName;
	private String passportNumber;
	private String passportExpirationDate;
	private String nationality;
	private String authority;
	
	private String agreement5;

	public UserInfoDto() {
	}
	
	public UserInfoDto(String id, String pw, String name, String gender, String birth, String phone, String email,
			String emergencyContact, String lastName, String firstName, String passportNumber,
			String passportExpirationDate, String nationality, String authority, String agreement5) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.emergencyContact = emergencyContact;
		this.lastName = lastName;
		this.firstName = firstName;
		this.passportNumber = passportNumber;
		this.passportExpirationDate = passportExpirationDate;
		this.nationality = nationality;
		this.authority = authority;
		this.agreement5 = agreement5;
	}

	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
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

	public String getEmergencyContact() {
		return emergencyContact;
	}

	public void setEmergencyContact(String emergencyContact) {
		this.emergencyContact = emergencyContact;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getPassportNumber() {
		return passportNumber;
	}

	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}

	public String getPassportExpirationDate() {
		return passportExpirationDate;
	}

	public void setPassportExpirationDate(String passportExpirationDate) {
		this.passportExpirationDate = passportExpirationDate;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public String getAgreement5() {
		return agreement5;
	}

	public void setAgreement5(String agreement5) {
		this.agreement5 = agreement5;
	}
	
	

	
}
