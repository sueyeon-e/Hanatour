package dto;

public class OverseaHotelReviewDto {
	private int reviewIdx;
	private String reviewRating;
	private String userId;
	private String reviewType;
	private String registDate;
	private String innKor;
	private String content;
	public OverseaHotelReviewDto(int reviewIdx, String reviewRating, String userId, String reviewType,
			String registDate, String innKor, String content) {
		super();
		this.reviewIdx = reviewIdx;
		this.reviewRating = reviewRating;
		this.userId = userId;
		this.reviewType = reviewType;
		this.registDate = registDate;
		this.innKor = innKor;
		this.content = content;
	}
	public int getReviewIdx() {
		return reviewIdx;
	}
	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}
	public String getReviewRating() {
		return reviewRating;
	}
	public void setReviewRating(String reviewRating) {
		this.reviewRating = reviewRating;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReviewType() {
		return reviewType;
	}
	public void setReviewType(String reviewType) {
		this.reviewType = reviewType;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public String getInnKor() {
		return innKor;
	}
	public void setInnKor(String innKor) {
		this.innKor = innKor;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
