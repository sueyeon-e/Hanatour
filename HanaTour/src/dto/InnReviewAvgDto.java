package dto;

public class InnReviewAvgDto {
	private int countNum;
	private double reviewAvg;
	public InnReviewAvgDto(int countNum, double reviewAvg) {
		super();
		this.countNum = countNum;
		this.reviewAvg = reviewAvg;
	}
	public int getCountNum() {
		return countNum;
	}
	public void setCountNum(int countNum) {
		this.countNum = countNum;
	}
	public double getReviewAvg() {
		return reviewAvg;
	}
	public void setReviewAvg(double reviewAvg) {
		this.reviewAvg = reviewAvg;
	}
	
	
}
