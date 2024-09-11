package dto;

public class OverseaHotelSearchDto {
	private int innIdx;
	private String minImgUrl;
	private String cityName;
	private String innKor;
	private String innEng;
	private int star;
	private String purpleBox;
	private String famousSpot;
	private int reviewRating;
	private int reviewCount;
	public OverseaHotelSearchDto(int innIdx, String minImgUrl, String cityName, String innKor, String innEng, int star,
			String purpleBox, String famousSpot, int reviewRating, int reviewCount) {
		super();
		this.innIdx = innIdx;
		this.minImgUrl = minImgUrl;
		this.cityName = cityName;
		this.innKor = innKor;
		this.innEng = innEng;
		this.star = star;
		this.purpleBox = purpleBox;
		this.famousSpot = famousSpot;
		this.reviewRating = reviewRating;
		this.reviewCount = reviewCount;
	}
	public int getInnIdx() {
		return innIdx;
	}
	public void setInnIdx(int innIdx) {
		this.innIdx = innIdx;
	}
	public String getMinImgUrl() {
		return minImgUrl;
	}
	public void setMinImgUrl(String minImgUrl) {
		this.minImgUrl = minImgUrl;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getInnKor() {
		return innKor;
	}
	public void setInnKor(String innKor) {
		this.innKor = innKor;
	}
	public String getInnEng() {
		return innEng;
	}
	public void setInnEng(String innEng) {
		this.innEng = innEng;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getPurpleBox() {
		return purpleBox;
	}
	public void setPurpleBox(String purpleBox) {
		this.purpleBox = purpleBox;
	}
	public String getFamousSpot() {
		return famousSpot;
	}
	public void setFamousSpot(String famousSpot) {
		this.famousSpot = famousSpot;
	}
	public int getReviewRating() {
		return reviewRating;
	}
	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	
	
}
