package dto;

public class SafetyInfoDto {
	private String countryName;
	private String accident; 
	private String contact;
	private String notApplicable; 
	private String travelNotice; 
	private String travelCaution; 
	private String recommendWithdrawal;
	
	public SafetyInfoDto(String countryName, String accident, String contact, String notApplicable, String travelNotice,
			String travelCaution, String recommendWithdrawal) {
		super();
		this.countryName = countryName;
		this.accident = accident;
		this.contact = contact;
		this.notApplicable = notApplicable;
		this.travelNotice = travelNotice;
		this.travelCaution = travelCaution;
		this.recommendWithdrawal = recommendWithdrawal;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getAccident() {
		return accident;
	}

	public void setAccident(String accident) {
		this.accident = accident;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getNotApplicable() {
		return notApplicable;
	}

	public void setNotApplicable(String notApplicable) {
		this.notApplicable = notApplicable;
	}

	public String getTravelNotice() {
		return travelNotice;
	}

	public void setTravelNotice(String travelNotice) {
		this.travelNotice = travelNotice;
	}

	public String getTravelCaution() {
		return travelCaution;
	}

	public void setTravelCaution(String travelCaution) {
		this.travelCaution = travelCaution;
	}

	public String getRecommendWithdrawal() {
		return recommendWithdrawal;
	}

	public void setRecommendWithdrawal(String recommendWithdrawal) {
		this.recommendWithdrawal = recommendWithdrawal;
	}
	
}
