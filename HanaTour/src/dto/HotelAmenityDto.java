package dto;

public class HotelAmenityDto {
	private String innKor; 
	private String titleName;
	
	public HotelAmenityDto(String innKor, String titleName) {
		super();
		this.innKor = innKor;
		this.titleName = titleName;
	}

	public String getInnKor() {
		return innKor;
	}

	public void setInnKor(String innKor) {
		this.innKor = innKor;
	}

	public String getTitleName() {
		return titleName;
	}

	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}
	
}
