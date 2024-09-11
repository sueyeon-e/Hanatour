package dto;

public class PackageReservationInfoDto {
	private String travelCity;
	private int totalSeat;
	private int minimumNumber; 
	private int reservationCount;
	
	public PackageReservationInfoDto(String travelCity, int totalSeat, int minimumNumber, int reservationCount) {
		super();
		this.travelCity = travelCity;
		this.totalSeat = totalSeat;
		this.minimumNumber = minimumNumber;
		this.reservationCount = reservationCount;
	}

	public String getTravelCity() {
		return travelCity;
	}

	public void setTravelCity(String travelCity) {
		this.travelCity = travelCity;
	}

	public int getTotalSeat() {
		return totalSeat;
	}

	public void setTotalSeat(int totalSeat) {
		this.totalSeat = totalSeat;
	}

	public int getMinimumNumber() {
		return minimumNumber;
	}

	public void setMinimumNumber(int minimumNumber) {
		this.minimumNumber = minimumNumber;
	}

	public int getReservationCount() {
		return reservationCount;
	}

	public void setReservationCount(int reservationCount) {
		this.reservationCount = reservationCount;
	} 
	
}
