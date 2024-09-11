package dto;

public class InnReviewDto {
	private int review_rating;
	private String name;
	private String regist_date;
	private String content;
	private String img_url;
	public InnReviewDto(int review_rating, String name, String regist_date, String content, String img_url) {
		super();
		this.review_rating = review_rating;
		this.name = name;
		this.regist_date = regist_date;
		this.content = content;
		this.img_url = img_url;
	}
	public int getReview_rating() {
		return review_rating;
	}
	public void setReview_rating(int review_rating) {
		this.review_rating = review_rating;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(String regist_date) {
		this.regist_date = regist_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg_url() {
		return img_url;
	}
	public void setImg_url(String img_url) {
		this.img_url = img_url;
	}
	
	
}
