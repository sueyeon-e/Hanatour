package dto;

public class RecommendPackageDateDto {
	private int packageIdx; 
	private String departureDate; 
	private String arrivalDate;
	
	public RecommendPackageDateDto(int packageIdx, String departureDate, String arrivalDate) {
		super();
		this.packageIdx = packageIdx;
		this.departureDate = departureDate;
		this.arrivalDate = arrivalDate;
	}

	public int getPackageIdx() {
		return packageIdx;
	}

	public void setPackageIdx(int packageIdx) {
		this.packageIdx = packageIdx;
	}

	public String getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}

	public String getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(String arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
	
}
