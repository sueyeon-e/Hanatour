package dto;

public class Type6FoodDto {
	private int planType6Idx; 
	private String korName; 
	private String engName; 
	private String ex; 
	private String detailedEx;
	private int day;
	
	public Type6FoodDto(int planType6Idx, String korName, String engName, String ex, String detailedEx, int day) {
		super();
		this.planType6Idx = planType6Idx;
		this.korName = korName;
		this.engName = engName;
		this.ex = ex;
		this.detailedEx = detailedEx;
		this.day = day;
	}

	public int getPlanType6Idx() {
		return planType6Idx;
	}

	public void setPlanType6Idx(int planType6Idx) {
		this.planType6Idx = planType6Idx;
	}

	public String getKorName() {
		return korName;
	}

	public void setKorName(String korName) {
		this.korName = korName;
	}

	public String getEngName() {
		return engName;
	}

	public void setEngName(String engName) {
		this.engName = engName;
	}

	public String getEx() {
		return ex;
	}

	public void setEx(String ex) {
		this.ex = ex;
	}

	public String getDetailedEx() {
		return detailedEx;
	}

	public void setDetailedEx(String detailedEx) {
		this.detailedEx = detailedEx;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}
	
	
	
}
