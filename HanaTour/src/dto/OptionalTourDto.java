package dto;

public class OptionalTourDto {
	private String countryName; 
	private String cityName; 
	private String tourName; 
	private String ex; 
	private String imgUrl; 
	private String fee; 
	private String period;
	private String alternativeSchedule; 
	private String nonSelectedGuide;
	
	public OptionalTourDto(String countryName, String cityName, String tourName, String ex, String imgUrl, String fee,
			String period, String alternativeSchedule, String nonSelectedGuide) {
		super();
		this.countryName = countryName;
		this.cityName = cityName;
		this.tourName = tourName;
		this.ex = ex;
		this.imgUrl = imgUrl;
		this.fee = fee;
		this.period = period;
		this.alternativeSchedule = alternativeSchedule;
		this.nonSelectedGuide = nonSelectedGuide;
	}
	
	public OptionalTourDto(String countryName, String cityName) {
		super();
		this.countryName = countryName;
		this.cityName = cityName;
	}



	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	public String getEx() {
		return ex;
	}

	public void setEx(String ex) {
		this.ex = ex;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getFee() {
		return fee;
	}

	public void setFee(String fee) {
		this.fee = fee;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getAlternativeSchedule() {
		return alternativeSchedule;
	}

	public void setAlternativeSchedule(String alternativeSchedule) {
		this.alternativeSchedule = alternativeSchedule;
	}

	public String getNonSelectedGuide() {
		return nonSelectedGuide;
	}

	public void setNonSelectedGuide(String nonSelectedGuide) {
		this.nonSelectedGuide = nonSelectedGuide;
	}
	
}
