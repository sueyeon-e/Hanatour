package dto;

public class PackageTwoFlightInfoDto {
	private String departureDate;
	private String arrivalDate;
	private String flightNumber;
	private String period;
	
	public PackageTwoFlightInfoDto(String departureDate, String arrivalDate, String flightNumber, String period) {
		super();
		this.departureDate = departureDate;
		this.arrivalDate = arrivalDate;
		this.flightNumber = flightNumber;
		this.period = period;
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

	public String getFlightNumber() {
		return flightNumber;
	}

	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}
	
}
