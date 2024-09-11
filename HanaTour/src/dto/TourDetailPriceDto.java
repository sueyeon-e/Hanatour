package dto;

public class TourDetailPriceDto {
	int detailTypeIdx;
	int goodsTypeIdx;
	String typeTitle;
	int typePrice;
	int minNum;
	int maxNum;
	public TourDetailPriceDto(int detailTypeIdx, int goodsTypeIdx, String typeTitle, int typePrice, int minNum,
			int maxNum) {
		super();
		this.detailTypeIdx = detailTypeIdx;
		this.goodsTypeIdx = goodsTypeIdx;
		this.typeTitle = typeTitle;
		this.typePrice = typePrice;
		this.minNum = minNum;
		this.maxNum = maxNum;
	}
	public int getDetailTypeIdx() {
		return detailTypeIdx;
	}
	public void setDetailTypeIdx(int detailTypeIdx) {
		this.detailTypeIdx = detailTypeIdx;
	}
	public int getGoodsTypeIdx() {
		return goodsTypeIdx;
	}
	public void setGoodsTypeIdx(int goodsTypeIdx) {
		this.goodsTypeIdx = goodsTypeIdx;
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
	
}
