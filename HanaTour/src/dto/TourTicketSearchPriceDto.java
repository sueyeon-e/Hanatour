package dto;

public class TourTicketSearchPriceDto {
	private int goodsIdx;
	private int lowestPrice;
	public TourTicketSearchPriceDto(int goodsIdx, int lowestPrice) {
		super();
		this.goodsIdx = goodsIdx;
		this.lowestPrice = lowestPrice;
	}
	public int getGoodsIdx() {
		return goodsIdx;
	}
	public void setGoodsIdx(int goodsIdx) {
		this.goodsIdx = goodsIdx;
	}
	public int getLowestPrice() {
		return lowestPrice;
	}
	public void setLowestPrice(int lowestPrice) {
		this.lowestPrice = lowestPrice;
	}
	
	
}
