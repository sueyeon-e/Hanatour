package dto;

public class OverseaHotelDto {
	private int star;
	private String innKor;
	private String innEng;
	private String purpleBox;
	private int reviewAvg;
	private int reviewNum;
	private int price;
	public OverseaHotelDto(int star, String innKor, String innEng, String purpleBox, int reviewAvg, int reviewNum,
			int price) {
		super();
		this.star = star;
		this.innKor = innKor;
		this.innEng = innEng;
		this.purpleBox = purpleBox;
		this.reviewAvg = reviewAvg;
		this.reviewNum = reviewNum;
		this.price = price;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getInnKor() {
		return innKor;
	}
	public void setInnKor(String innKor) {
		this.innKor = innKor;
	}
	public String getInnEng() {
		return innEng;
	}
	public void setInnEng(String innEng) {
		this.innEng = innEng;
	}
	public String getPurpleBox() {
		return purpleBox;
	}
	public void setPurpleBox(String purpleBox) {
		this.purpleBox = purpleBox;
	}
	public int getReviewAvg() {
		return reviewAvg;
	}
	public void setReviewAvg(int reviewAvg) {
		this.reviewAvg = reviewAvg;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
