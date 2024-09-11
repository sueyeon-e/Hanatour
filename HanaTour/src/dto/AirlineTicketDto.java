package dto;

import java.util.Date;

import dao.AirlineTicketDao;

public class AirlineTicketDto {

	private int ticketIdx;
	
	private String departureIata;
	private String arrivalIata;
	
	private String airlineIata;
	private String airlineName;
	
	private int modelIdx;
	
	private String departureTimeDate;
	private String departureTimeHour;
	
	private String arrivalTimeDate;
	private String arrivalTimeHour;
	
	private String flyingTime;
	
	private int stop;
	private String freeBaggage;
	
	private String codeShare;
	private String codeShareAirline;
	private String codeShareAirlineName;
	
	private String flightNumber;
	
	private String departureTerminal;
	private String arrivalTerminal;
	
	private int economyClassPrice;
	private int prestigeClassPrice;

	private int leftSeats;

	
	public AirlineTicketDto() {
	}
	
	public AirlineTicketDto(int ticketIdx, String departureIata, String arrivalIata, String airlineIata,
			String airlineName, int modelIdx, String departureTimeDate, String departureTimeHour,
			String arrivalTimeDate, String arrivalTimeHour, String flyingTime, int stop, String freeBaggage,
			String codeShare, String codeShareAirline, String codeShareAirlineName, String flightNumber,
			String departureTerminal, String arrivalTerminal, int economyClassPrice, int prestigeClassPrice,
			int leftSeats) {
		super();
		this.ticketIdx = ticketIdx;
		this.departureIata = departureIata;
		this.arrivalIata = arrivalIata;
		this.airlineIata = airlineIata;
		this.airlineName = airlineName;
		this.modelIdx = modelIdx;
		this.departureTimeDate = departureTimeDate;
		this.departureTimeHour = departureTimeHour;
		this.arrivalTimeDate = arrivalTimeDate;
		this.arrivalTimeHour = arrivalTimeHour;
		this.flyingTime = flyingTime;
		this.stop = stop;
		this.freeBaggage = freeBaggage;
		this.codeShare = codeShare;
		this.codeShareAirline = codeShareAirline;
		this.codeShareAirlineName = codeShareAirlineName;
		this.flightNumber = flightNumber;
		this.departureTerminal = departureTerminal;
		this.arrivalTerminal = arrivalTerminal;
		this.economyClassPrice = economyClassPrice;
		this.prestigeClassPrice = prestigeClassPrice;
		this.leftSeats = leftSeats;
	}

	public int getTicketIdx() {
		return ticketIdx;
	}

	public void setTicketIdx(int ticketIdx) {
		this.ticketIdx = ticketIdx;
	}

	public String getDepartureIata() {
		return departureIata;
	}

	public void setDepartureIata(String departureIata) {
		this.departureIata = departureIata;
	}

	public String getArrivalIata() {
		return arrivalIata;
	}

	public void setArrivalIata(String arrivalIata) {
		this.arrivalIata = arrivalIata;
	}

	public String getAirlineIata() {
		return airlineIata;
	}

	public void setAirlineIata(String airlineIata) {
		this.airlineIata = airlineIata;
	}

	public String getAirlineName() {
		return airlineName;
	}

	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}

	public int getModelIdx() {
		return modelIdx;
	}

	public void setModelIdx(int modelIdx) {
		this.modelIdx = modelIdx;
	}

	public String getDepartureTimeDate() {
		return departureTimeDate;
	}

	public void setDepartureTimeDate(String departureTimeDate) {
		this.departureTimeDate = departureTimeDate;
	}

	public String getDepartureTimeHour() {
		return departureTimeHour;
	}

	public void setDepartureTimeHour(String departureTimeHour) {
		this.departureTimeHour = departureTimeHour;
	}

	public String getArrivalTimeDate() {
		return arrivalTimeDate;
	}

	public void setArrivalTimeDate(String arrivalTimeDate) {
		this.arrivalTimeDate = arrivalTimeDate;
	}

	public String getArrivalTimeHour() {
		return arrivalTimeHour;
	}

	public void setArrivalTimeHour(String arrivalTimeHour) {
		this.arrivalTimeHour = arrivalTimeHour;
	}

	public String getFlyingTime() {
		return flyingTime;
	}

	public void setFlyingTime(String flyingTime) {
		this.flyingTime = flyingTime;
	}

	public int getStop() {
		return stop;
	}

	public void setStop(int stop) {
		this.stop = stop;
	}

	public String getFreeBaggage() {
		return freeBaggage;
	}

	public void setFreeBaggage(String freeBaggage) {
		this.freeBaggage = freeBaggage;
	}

	public String getCodeShare() {
		return codeShare;
	}

	public void setCodeShare(String codeShare) {
		this.codeShare = codeShare;
	}

	public String getCodeShareAirline() {
		return codeShareAirline;
	}

	public void setCodeShareAirline(String codeShareAirline) {
		this.codeShareAirline = codeShareAirline;
	}

	public String getCodeShareAirlineName() {
		return codeShareAirlineName;
	}

	public void setCodeShareAirlineName(String codeShareAirlineName) {
		this.codeShareAirlineName = codeShareAirlineName;
	}

	public String getFlightNumber() {
		return flightNumber;
	}

	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}

	public String getDepartureTerminal() {
		return departureTerminal;
	}

	public void setDepartureTerminal(String departureTerminal) {
		this.departureTerminal = departureTerminal;
	}

	public String getArrivalTerminal() {
		return arrivalTerminal;
	}

	public void setArrivalTerminal(String arrivalTerminal) {
		this.arrivalTerminal = arrivalTerminal;
	}

	public int getEconomyClassPrice() {
		return economyClassPrice;
	}

	public void setEconomyClassPrice(int economyClassPrice) {
		this.economyClassPrice = economyClassPrice;
	}

	public int getPrestigeClassPrice() {
		return prestigeClassPrice;
	}

	public void setPrestigeClassPrice(int prestigeClassPrice) {
		this.prestigeClassPrice = prestigeClassPrice;
	}

	public int getLeftSeats() {
		return leftSeats;
	}

	public void setLeftSeats(int leftSeats) {
		this.leftSeats = leftSeats;
	}

	
	
}
