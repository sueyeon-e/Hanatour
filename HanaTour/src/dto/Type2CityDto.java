package dto;

public class Type2CityDto {
	private int planType2Idx; 
	private String cityName; 
	private String thinText;
	private int day;
	
	public Type2CityDto(int planType2Idx, String cityName, String thinText, int day) {
		super();
		this.planType2Idx = planType2Idx;
		this.cityName = cityName;
		this.thinText = thinText;
		this.day = day;
	}

	public int getPlanType2Idx() {
		return planType2Idx;
	}

	public void setPlanType2Idx(int planType2Idx) {
		this.planType2Idx = planType2Idx;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getThinText() {
		return thinText;
	}

	public void setThinText(String thinText) {
		this.thinText = thinText;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}
	
	
	
}
