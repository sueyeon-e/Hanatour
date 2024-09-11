package dto;

public class RecommendTicketDto {
	private int goodsIdx;
	private String minImgUrl; 
	private String goodsName;
	private String goodsTicketType; 
	private String  cityName;
	private int minTypePrice; 
	private double avgRating; 
	private int reviewCount;
	
	public RecommendTicketDto(int goodsIdx, String minImgUrl, String goodsName, String goodsTicketType, String cityName,
			int minTypePrice, double avgRating, int reviewCount) {
		super();
		this.goodsIdx = goodsIdx;
		this.minImgUrl = minImgUrl;
		this.goodsName = goodsName;
		this.goodsTicketType = goodsTicketType;
		this.cityName = cityName;
		this.minTypePrice = minTypePrice;
		this.avgRating = avgRating;
		this.reviewCount = reviewCount;
	}

	public int getGoodsIdx() {
		return goodsIdx;
	}

	public void setGoodsIdx(int goodsIdx) {
		this.goodsIdx = goodsIdx;
	}

	public String getMinImgUrl() {
		return minImgUrl;
	}

	public void setMinImgUrl(String minImgUrl) {
		this.minImgUrl = minImgUrl;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsTicketType() {
		return goodsTicketType;
	}

	public void setGoodsTicketType(String goodsTicketType) {
		this.goodsTicketType = goodsTicketType;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public int getMinTypePrice() {
		return minTypePrice;
	}

	public void setMinTypePrice(int minTypePrice) {
		this.minTypePrice = minTypePrice;
	}

	public double getAvgRating() {
		return avgRating;
	}

	public void setAvgRating(double avgRating) {
		this.avgRating = avgRating;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	
}
