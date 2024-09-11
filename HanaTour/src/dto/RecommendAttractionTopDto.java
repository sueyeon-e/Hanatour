package dto;

public class RecommendAttractionTopDto {
	private int attractionIdx; 
	private String attractionKor; 
	private String detailedEx;
	private String imgUrl;
	
	public RecommendAttractionTopDto(int attractionIdx, String attractionKor, String detailedEx, String imgUrl) {
		super();
		this.attractionIdx = attractionIdx;
		this.attractionKor = attractionKor;
		this.detailedEx = detailedEx;
		this.imgUrl = imgUrl;
	}

	public int getAttractionIdx() {
		return attractionIdx;
	}

	public void setAttractionIdx(int attractionIdx) {
		this.attractionIdx = attractionIdx;
	}

	public String getAttractionKor() {
		return attractionKor;
	}

	public void setAttractionKor(String attractionKor) {
		this.attractionKor = attractionKor;
	}

	public String getDetailedEx() {
		return detailedEx;
	}

	public void setDetailedEx(String detailedEx) {
		this.detailedEx = detailedEx;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
}
