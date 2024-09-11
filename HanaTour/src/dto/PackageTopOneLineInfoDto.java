package dto;

public class PackageTopOneLineInfoDto {
	private String packageNumber;
	private String packageName;
	private String packageEx; 
	private String travelPeriod;
	private String flight;
	private String airline;
	private String freeTour;
	private String shopping;
	private String shoppingTimes;
	private String groupTravel;
	private String leader;
	private String guide;
	private String guideFee;
	private String optionalTour;
	private String reviewStar;
	private String reviewComment;
	private String adult;
	
	public PackageTopOneLineInfoDto(String packageNumber, String packageName, String packageEx, String travelPeriod,
			String flight, String airline, String freeTour, String shopping, String shoppingTimes, String groupTravel,
			String leader, String guide, String guideFee, String optionalTour, String reviewStar, String reviewComment,
			String adult) {
		super();
		this.packageNumber = packageNumber;
		this.packageName = packageName;
		this.packageEx = packageEx;
		this.travelPeriod = travelPeriod;
		this.flight = flight;
		this.airline = airline;
		this.freeTour = freeTour;
		this.shopping = shopping;
		this.shoppingTimes = shoppingTimes;
		this.groupTravel = groupTravel;
		this.leader = leader;
		this.guide = guide;
		this.guideFee = guideFee;
		this.optionalTour = optionalTour;
		this.reviewStar = reviewStar;
		this.reviewComment = reviewComment;
		this.adult = adult;
	}

	public String getPackageNumber() {
		return packageNumber;
	}

	public void setPackageNumber(String packageNumber) {
		this.packageNumber = packageNumber;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getPackageEx() {
		return packageEx;
	}

	public void setPackageEx(String packageEx) {
		this.packageEx = packageEx;
	}

	public String getTravelPeriod() {
		return travelPeriod;
	}

	public void setTravelPeriod(String travelPeriod) {
		this.travelPeriod = travelPeriod;
	}

	public String getFlight() {
		return flight;
	}

	public void setFlight(String flight) {
		this.flight = flight;
	}

	public String getAirline() {
		return airline;
	}

	public void setAirline(String airline) {
		this.airline = airline;
	}

	public String getFreeTour() {
		return freeTour;
	}

	public void setFreeTour(String freeTour) {
		this.freeTour = freeTour;
	}

	public String getShopping() {
		return shopping;
	}

	public void setShopping(String shopping) {
		this.shopping = shopping;
	}

	public String getShoppingTimes() {
		return shoppingTimes;
	}

	public void setShoppingTimes(String shoppingTimes) {
		this.shoppingTimes = shoppingTimes;
	}

	public String getGroupTravel() {
		return groupTravel;
	}

	public void setGroupTravel(String groupTravel) {
		this.groupTravel = groupTravel;
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getGuide() {
		return guide;
	}

	public void setGuide(String guide) {
		this.guide = guide;
	}

	public String getGuideFee() {
		return guideFee;
	}

	public void setGuideFee(String guideFee) {
		this.guideFee = guideFee;
	}

	public String getOptionalTour() {
		return optionalTour;
	}

	public void setOptionalTour(String optionalTour) {
		this.optionalTour = optionalTour;
	}

	public String getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(String reviewStar) {
		this.reviewStar = reviewStar;
	}

	public String getReviewComment() {
		return reviewComment;
	}

	public void setReviewComment(String reviewComment) {
		this.reviewComment = reviewComment;
	}

	public String getAdult() {
		return adult;
	}

	public void setAdult(String adult) {
		this.adult = adult;
	}
	
	
	
}
