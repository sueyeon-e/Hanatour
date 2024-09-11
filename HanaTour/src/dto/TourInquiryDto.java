package dto;

public class TourInquiryDto {
	private String secret;
	private String name;
	private String registDate;
	private String inquiryType;
	private String goodsInquiryTitle;
	private String question;
	private String answer;
	public TourInquiryDto(String secret, String name, String registDate, String inquiryType, String goodsInquiryTitle,
			String question, String answer) {
		super();
		this.secret = secret;
		this.name = name;
		this.registDate = registDate;
		this.inquiryType = inquiryType;
		this.goodsInquiryTitle = goodsInquiryTitle;
		this.question = question;
		this.answer = answer;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRegistDate() {
		return registDate;
	}
	public void setRegistDate(String registDate) {
		this.registDate = registDate;
	}
	public String getInquiryType() {
		return inquiryType;
	}
	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}
	public String getGoodsInquiryTitle() {
		return goodsInquiryTitle;
	}
	public void setGoodsInquiryTitle(String goodsInquiryTitle) {
		this.goodsInquiryTitle = goodsInquiryTitle;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
}
