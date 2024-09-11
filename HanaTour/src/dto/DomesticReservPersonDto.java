package dto;

public class DomesticReservPersonDto {
	private String name;
	private String gender;
	private String birth;
	private String phone;
	private String email;
	private int adultNum;
	private int childNum;
	private int infantNum;
	public DomesticReservPersonDto(String name, String gender, String birth, String phone, String email, int adultNum,
			int childNum, int infantNum) {
		super();
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.adultNum = adultNum;
		this.childNum = childNum;
		this.infantNum = infantNum;
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
	public int getAdultNum() {
		return adultNum;
	}
	public void setAdultNum(int adultNum) {
		this.adultNum = adultNum;
	}
	public int getChildNum() {
		return childNum;
	}
	public void setChildNum(int childNum) {
		this.childNum = childNum;
	}
	public int getInfantNum() {
		return infantNum;
	}
	public void setInfantNum(int infantNum) {
		this.infantNum = infantNum;
	}
	
	
}
