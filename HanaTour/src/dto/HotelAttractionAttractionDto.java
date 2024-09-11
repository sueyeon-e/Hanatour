package dto;

public class HotelAttractionAttractionDto {
	private int day; 
	private String attractionKor; 
	private String imgUrl; 
	private String detailedEx;
	private String attractionDate;
	
	public HotelAttractionAttractionDto(int day, String attractionKor, String imgUrl, String detailedEx,
			String attractionDate) {
		super();
		this.day = day;
		this.attractionKor = attractionKor;
		this.imgUrl = imgUrl;
		this.detailedEx = detailedEx;
		this.attractionDate = attractionDate;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getAttractionKor() {
		return attractionKor;
	}

	public void setAttractionKor(String attractionKor) {
		this.attractionKor = attractionKor;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getDetailedEx() {
		return detailedEx;
	}

	public void setDetailedEx(String detailedEx) {
		this.detailedEx = detailedEx;
	}

	public String getAttractionDate() {
		return attractionDate;
	}

	public void setAttractionDate(String attractionDate) {
		this.attractionDate = attractionDate;
	}
	
}
