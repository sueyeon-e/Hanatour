package dto;

public class TourIconDto {
	private int tourGoodsIdx;
	private String goodsIconTitle;
	private String imgUrl;
	public TourIconDto(int tourGoodsIdx, String goodsIconTitle, String imgUrl) {
		super();
		this.tourGoodsIdx = tourGoodsIdx;
		this.goodsIconTitle = goodsIconTitle;
		this.imgUrl = imgUrl;
	}
	public int getTourGoodsIdx() {
		return tourGoodsIdx;
	}
	public void setTourGoodsIdx(int tourGoodsIdx) {
		this.tourGoodsIdx = tourGoodsIdx;
	}
	public String getGoodsIconTitle() {
		return goodsIconTitle;
	}
	public void setGoodsIconTitle(String goodsIconTitle) {
		this.goodsIconTitle = goodsIconTitle;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
}
