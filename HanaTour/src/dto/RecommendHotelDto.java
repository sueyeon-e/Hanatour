package dto;

public class RecommendHotelDto {
	private String innImgUrl;
	private int innIdx; 
	private String innKor; 
	private String innType; 
	private double star; 
	private String cityName; 
	private String countryName; 
	private double reviewAvg; 
	private int reviewNum; 
	private int minPrice; 
	private int rn;
	
	public RecommendHotelDto(String innImgUrl, int innIdx, String innKor, String innType, double star, String cityName,
			String countryName, double reviewAvg, int reviewNum, int minPrice, int rn) {
		super();
		this.innImgUrl = innImgUrl;
		this.innIdx = innIdx;
		this.innKor = innKor;
		this.innType = innType;
		this.star = star;
		this.cityName = cityName;
		this.countryName = countryName;
		this.reviewAvg = reviewAvg;
		this.reviewNum = reviewNum;
		this.minPrice = minPrice;
		this.rn = rn;
	}

	public String getInnImgUrl() {
		return innImgUrl;
	}

	public void setInnImgUrl(String innImgUrl) {
		this.innImgUrl = innImgUrl;
	}

	public int getInnIdx() {
		return innIdx;
	}

	public void setInnIdx(int innIdx) {
		this.innIdx = innIdx;
	}

	public String getInnKor() {
		return innKor;
	}

	public void setInnKor(String innKor) {
		this.innKor = innKor;
	}

	public String getInnType() {
		return innType;
	}

	public void setInnType(String innType) {
		this.innType = innType;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public double getReviewAvg() {
		return reviewAvg;
	}

	public void setReviewAvg(double reviewAvg) {
		this.reviewAvg = reviewAvg;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public int getRn() {
		return rn;
	}

	public void setRn(int rn) {
		this.rn = rn;
	}
	
}
