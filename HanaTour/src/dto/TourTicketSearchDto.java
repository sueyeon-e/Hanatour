package dto;

public class TourTicketSearchDto {
	private String goodsName;
	private int goodsIdx;
	private String whenUse;
	private double avgRating;
	private int reviewCount;
	private String cityName;
	private String firstImgUrl;
	public TourTicketSearchDto(String goodsName, int goodsIdx, String whenUse, double avgRating, int reviewCount,
			String cityName, String firstImgUrl) {
		super();
		this.goodsName = goodsName;
		this.goodsIdx = goodsIdx;
		this.whenUse = whenUse;
		this.avgRating = avgRating;
		this.reviewCount = reviewCount;
		this.cityName = cityName;
		this.firstImgUrl = firstImgUrl;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getGoodsIdx() {
		return goodsIdx;
	}
	public void setGoodsIdx(int goodsIdx) {
		this.goodsIdx = goodsIdx;
	}
	public String getWhenUse() {
		return whenUse;
	}
	public void setWhenUse(String whenUse) {
		this.whenUse = whenUse;
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
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getFirstImgUrl() {
		return firstImgUrl;
	}
	public void setFirstImgUrl(String firstImgUrl) {
		this.firstImgUrl = firstImgUrl;
	}
	 
}
