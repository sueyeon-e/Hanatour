package dto;

public class RecommendPackageOneInfoDto {
	private int packageIdx; 
	private String packageName; 
	private String travelPeriod; 
	private String shopping; 
	private String shoppingTimes; 
	private String guide; 
	private int adult; 
	private String logo;
	private String name; 
	private String departureDate; 
	private String brand; 
	private String groupTravel; 
	private double reviewStar; 
	private int reviewComment; 
	private String imgUrl;
	
	public RecommendPackageOneInfoDto(int packageIdx, String packageName, String travelPeriod, String shopping,
			String shoppingTimes, String guide, int adult, String logo, String name, String departureDate, String brand,
			String groupTravel, double reviewStar, int reviewComment, String imgUrl) {
		super();
		this.packageIdx = packageIdx;
		this.packageName = packageName;
		this.travelPeriod = travelPeriod;
		this.shopping = shopping;
		this.shoppingTimes = shoppingTimes;
		this.guide = guide;
		this.adult = adult;
		this.logo = logo;
		this.name = name;
		this.departureDate = departureDate;
		this.brand = brand;
		this.groupTravel = groupTravel;
		this.reviewStar = reviewStar;
		this.reviewComment = reviewComment;
		this.imgUrl = imgUrl;
	}

	public int getPackageIdx() {
		return packageIdx;
	}

	public void setPackageIdx(int packageIdx) {
		this.packageIdx = packageIdx;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getTravelPeriod() {
		return travelPeriod;
	}

	public void setTravelPeriod(String travelPeriod) {
		this.travelPeriod = travelPeriod;
	}

	public String getShopping() {
		return shopping;
	}

	public void setShopping(String shopping) {
		this.shopping = shopping;
	}

	public String getShoppingTimes() {
		return shoppingTimes;
	}

	public void setShoppingTimes(String shoppingTimes) {
		this.shoppingTimes = shoppingTimes;
	}

	public String getGuide() {
		return guide;
	}

	public void setGuide(String guide) {
		this.guide = guide;
	}

	public int getAdult() {
		return adult;
	}

	public void setAdult(int adult) {
		this.adult = adult;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getGroupTravel() {
		return groupTravel;
	}

	public void setGroupTravel(String groupTravel) {
		this.groupTravel = groupTravel;
	}

	public double getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(double reviewStar) {
		this.reviewStar = reviewStar;
	}

	public int getReviewComment() {
		return reviewComment;
	}

	public void setReviewComment(int reviewComment) {
		this.reviewComment = reviewComment;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	} 
	
	
}
