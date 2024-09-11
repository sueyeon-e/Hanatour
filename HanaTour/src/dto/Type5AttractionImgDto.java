package dto;

public class Type5AttractionImgDto {
	private int planType5Idx;
	private int attractionIdx; 
	private int imgOrder; 
	private String imgUrl;
	
	public Type5AttractionImgDto(int planType5Idx, int attractionIdx, int imgOrder, String imgUrl) {
		super();
		this.planType5Idx = planType5Idx;
		this.attractionIdx = attractionIdx;
		this.imgOrder = imgOrder;
		this.imgUrl = imgUrl;
	}

	public int getPlanType5Idx() {
		return planType5Idx;
	}

	public void setPlanType5Idx(int planType5Idx) {
		this.planType5Idx = planType5Idx;
	}

	public int getAttractionIdx() {
		return attractionIdx;
	}

	public void setAttractionIdx(int attractionIdx) {
		this.attractionIdx = attractionIdx;
	}

	public int getImgOrder() {
		return imgOrder;
	}

	public void setImgOrder(int imgOrder) {
		this.imgOrder = imgOrder;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
	
	
}
