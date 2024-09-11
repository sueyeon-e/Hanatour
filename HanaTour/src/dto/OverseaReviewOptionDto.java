package dto;

public class OverseaReviewOptionDto {
	private int reviewIdx;
	private String title;
	private String optionImg;
	public OverseaReviewOptionDto(int reviewIdx, String title, String optionImg) {
		super();
		this.reviewIdx = reviewIdx;
		this.title = title;
		this.optionImg = optionImg;
	}
	public int getReviewIdx() {
		return reviewIdx;
	}
	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getOptionImg() {
		return optionImg;
	}
	public void setOptionImg(String optionImg) {
		this.optionImg = optionImg;
	}
	
}
