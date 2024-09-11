package dto;

public class GetUserInfoDto {
	private String name;
	private String gender;
	private String birth;
	private String phone;
	
	public GetUserInfoDto(String name, String gender, String birth, String phone) {
		super();
		this.name = name;
		this.gender = gender;
		this.birth = birth;
		this.phone = phone;
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
	
}
