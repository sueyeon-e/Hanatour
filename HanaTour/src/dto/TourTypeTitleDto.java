package dto;

public class TourTypeTitleDto {
	private int goodsTypeIdx;
	private int detailTypeIdx;
	private String title;
	public TourTypeTitleDto(int goodsTypeIdx, int detailTypeIdx, String title) {
		super();
		this.goodsTypeIdx = goodsTypeIdx;
		this.detailTypeIdx = detailTypeIdx;
		this.title = title;
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
	
}
