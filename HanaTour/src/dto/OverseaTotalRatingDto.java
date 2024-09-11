package dto;

public class OverseaTotalRatingDto {
	private double totalAvg;
	private double clean;
	private double employee;
	private double convenientFacility;
	private double innFacility;
	private int reviewCount;
	public OverseaTotalRatingDto(double totalAvg, double clean, double employee, double convenientFacility,
			double innFacility, int reviewCount) {
		super();
		this.totalAvg = totalAvg;
		this.clean = clean;
		this.employee = employee;
		this.convenientFacility = convenientFacility;
		this.innFacility = innFacility;
		this.reviewCount = reviewCount;
	}
	public double getTotalAvg() {
		return totalAvg;
	}
	public void setTotalAvg(double totalAvg) {
		this.totalAvg = totalAvg;
	}
	public double getClean() {
		return clean;
	}
	public void setClean(double clean) {
		this.clean = clean;
	}
	public double getEmployee() {
		return employee;
	}
	public void setEmployee(double employee) {
		this.employee = employee;
	}
	public double getConvenientFacility() {
		return convenientFacility;
	}
	public void setConvenientFacility(double convenientFacility) {
		this.convenientFacility = convenientFacility;
	}
	public double getInnFacility() {
		return innFacility;
	}
	public void setInnFacility(double innFacility) {
		this.innFacility = innFacility;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	
}
