package dto;

public class OverseaReviewImgDto {
	private String imgUrl;
	private int reviewIdx;
	public OverseaReviewImgDto(String imgUrl, int reviewIdx) {
		super();
		this.imgUrl = imgUrl;
		this.reviewIdx = reviewIdx;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public int getReviewIdx() {
		return reviewIdx;
	}
	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}
	
}
