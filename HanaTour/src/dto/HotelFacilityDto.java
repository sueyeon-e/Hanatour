package dto;

public class HotelFacilityDto {
	private String innKor; 
	private String titleName;
	
	public HotelFacilityDto(String innKor, String titleName) {
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
