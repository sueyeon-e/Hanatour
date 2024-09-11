package dto;

public class Type1FlightDto {
	private String name; 
	private String logo;
	private String flightNumber;
	private String departureDate;
	private String departureTime;
	private String arrivalDate; 
	private String arrivalTime; 
	private String departure; 
	private String arrival;
	private String period;
	private int planDetailOrder; 
	private int planType1Idx; 
	private int day;
	
	public Type1FlightDto(String name, String logo, String flightNumber, String departureDate, String departureTime,
			String arrivalDate, String arrivalTime, String departure, String arrival, String period,
			int planDetailOrder, int planType1Idx, int day) {
		super();
		this.name = name;
		this.logo = logo;
		this.flightNumber = flightNumber;
		this.departureDate = departureDate;
		this.departureTime = departureTime;
		this.arrivalDate = arrivalDate;
		this.arrivalTime = arrivalTime;
		this.departure = departure;
		this.arrival = arrival;
		this.period = period;
		this.planDetailOrder = planDetailOrder;
		this.planType1Idx = planType1Idx;
		this.day = day;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getFlightNumber() {
		return flightNumber;
	}

	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}

	public String getDepartureDate() {
		return departureDate;
	}

	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}

	public String getDepartureTime() {
		return departureTime;
	}

	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}

	public String getArrivalDate() {
		return arrivalDate;
	}

	public void setArrivalDate(String arrivalDate) {
		this.arrivalDate = arrivalDate;
	}

	public String getArrivalTime() {
		return arrivalTime;
	}

	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}

	public String getDeparture() {
		return departure;
	}

	public void setDeparture(String departure) {
		this.departure = departure;
	}

	public String getArrival() {
		return arrival;
	}

	public void setArrival(String arrival) {
		this.arrival = arrival;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public int getPlanDetailOrder() {
		return planDetailOrder;
	}

	public void setPlanDetailOrder(int planDetailOrder) {
		this.planDetailOrder = planDetailOrder;
	}

	public int getPlanType1Idx() {
		return planType1Idx;
	}

	public void setPlanType1Idx(int planType1Idx) {
		this.planType1Idx = planType1Idx;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	} 
	
}
