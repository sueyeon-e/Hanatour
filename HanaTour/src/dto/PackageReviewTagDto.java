package dto;

public class PackageReviewTagDto {
	int reviewIdx;
	int tagImgIdx;
	String text;
	
	public PackageReviewTagDto() {

	}

	public PackageReviewTagDto(int reviewIdx, int tagImgIdx, String text) {
		super();
		this.reviewIdx = reviewIdx;
		this.tagImgIdx = tagImgIdx;
		this.text = text;
	}

	public int getReviewIdx() {
		return reviewIdx;
	}

	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}

	public int getTagImgIdx() {
		return tagImgIdx;
	}

	public void setTagImgIdx(int tagImgIdx) {
		this.tagImgIdx = tagImgIdx;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
}
