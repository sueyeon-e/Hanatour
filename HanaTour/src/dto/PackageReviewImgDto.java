package dto;

public class PackageReviewImgDto {
	private int reviewIdx;
	private String imgUrl;
	
	public PackageReviewImgDto(int reviewIdx, String imgUrl) {
		super();
		this.reviewIdx = reviewIdx;
		this.imgUrl = imgUrl;
	}

	public int getReviewIdx() {
		return reviewIdx;
	}

	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
}
