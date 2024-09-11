package dto;

public class ShowCategoryOneLineInfoDto {
	private String categoryName;
	private int categoryIdx;
	private String categoryEx;
	private String travelPeriod;
	private double reviewStar;
	private int commentAmount;
	private int price;
	private String imgUrl;
	private String hanapack;
	private String packageTag;
	private String localDepartureTag;
	
	public ShowCategoryOneLineInfoDto(String categoryName, int categoryIdx, String categoryEx, String travelPeriod,
			double reviewStar, int commentAmount, int price, String imgUrl, String hanapack, String packageTag,
			String localDepartureTag) {
		super();
		this.categoryName = categoryName;
		this.categoryIdx = categoryIdx;
		this.categoryEx = categoryEx;
		this.travelPeriod = travelPeriod;
		this.reviewStar = reviewStar;
		this.commentAmount = commentAmount;
		this.price = price;
		this.imgUrl = imgUrl;
		this.hanapack = hanapack;
		this.packageTag = packageTag;
		this.localDepartureTag = localDepartureTag;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getCategoryIdx() {
		return categoryIdx;
	}

	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}

	public String getCategoryEx() {
		return categoryEx;
	}

	public void setCategoryEx(String categoryEx) {
		this.categoryEx = categoryEx;
	}

	public String getTravelPeriod() {
		return travelPeriod;
	}

	public void setTravelPeriod(String travelPeriod) {
		this.travelPeriod = travelPeriod;
	}

	public double getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(double reviewStar) {
		this.reviewStar = reviewStar;
	}

	public int getCommentAmount() {
		return commentAmount;
	}

	public void setCommentAmount(int commentAmount) {
		this.commentAmount = commentAmount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getHanapack() {
		return hanapack;
	}

	public void setHanapack(String hanapack) {
		this.hanapack = hanapack;
	}

	public String getPackageTag() {
		return packageTag;
	}

	public void setPackageTag(String packageTag) {
		this.packageTag = packageTag;
	}

	public String getLocalDepartureTag() {
		return localDepartureTag;
	}

	public void setLocalDepartureTag(String localDepartureTag) {
		this.localDepartureTag = localDepartureTag;
	}
	
	
	
	
}
