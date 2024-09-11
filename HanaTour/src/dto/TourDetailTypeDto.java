package dto;

public class TourDetailTypeDto {
	private int goodsTypeIdx;
	private int detailTypeIdx;
	private String title;
	private String typeTitle;
	private int typePrice;
	private int minNum;
	private int maxNum;
	private int minAge;
	private int maxAge;
	public TourDetailTypeDto(int goodsTypeIdx, int detailTypeIdx, String title, String typeTitle, int typePrice,
			int minNum, int maxNum, int minAge, int maxAge) {
		super();
		this.goodsTypeIdx = goodsTypeIdx;
		this.detailTypeIdx = detailTypeIdx;
		this.title = title;
		this.typeTitle = typeTitle;
		this.typePrice = typePrice;
		this.minNum = minNum;
		this.maxNum = maxNum;
		this.minAge = minAge;
		this.maxAge = maxAge;
	}
	public int getGoodsTypeIdx() {
		return goodsTypeIdx;
	}
	public void setGoodsTypeIdx(int goodsTypeIdx) {
		this.goodsTypeIdx = goodsTypeIdx;
	}
	public int getDetailTypeIdx() {
		return detailTypeIdx;
	}
	public void setDetailTypeIdx(int detailTypeIdx) {
		this.detailTypeIdx = detailTypeIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTypeTitle() {
		return typeTitle;
	}
	public void setTypeTitle(String typeTitle) {
		this.typeTitle = typeTitle;
	}
	public int getTypePrice() {
		return typePrice;
	}
	public void setTypePrice(int typePrice) {
		this.typePrice = typePrice;
	}
	public int getMinNum() {
		return minNum;
	}
	public void setMinNum(int minNum) {
		this.minNum = minNum;
	}
	public int getMaxNum() {
		return maxNum;
	}
	public void setMaxNum(int maxNum) {
		this.maxNum = maxNum;
	}
	public int getMinAge() {
		return minAge;
	}
	public void setMinAge(int minAge) {
		this.minAge = minAge;
	}
	public int getMaxAge() {
		return maxAge;
	}
	public void setMaxAge(int maxAge) {
		this.maxAge = maxAge;
	}
	
}
