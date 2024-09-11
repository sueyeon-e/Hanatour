package dto;

public class CategoryFlagDto {
	private String countryName;
	private String flagImg;
	
	public CategoryFlagDto(String countryName, String flagImg) {
		super();
		this.countryName = countryName;
		this.flagImg = flagImg;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getFlagImg() {
		return flagImg;
	}

	public void setFlagImg(String flagImg) {
		this.flagImg = flagImg;
	}
	
}
