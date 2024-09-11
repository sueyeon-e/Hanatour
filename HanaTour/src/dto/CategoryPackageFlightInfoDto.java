package dto;

public class CategoryPackageFlightInfoDto {
	private int packageIdx; 
	private String departureTime; 
	private String arrivalTime;
	
	public CategoryPackageFlightInfoDto(int packageIdx, String departureTime, String arrivalTime) {
		super();
		this.packageIdx = packageIdx;
		this.departureTime = departureTime;
		this.arrivalTime = arrivalTime;
	}

	public int getPackageIdx() {
		return packageIdx;
	}

	public void setPackageIdx(int packageIdx) {
		this.packageIdx = packageIdx;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	} 
	
}
