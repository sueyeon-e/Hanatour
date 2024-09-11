package dto;

public class Type4BoldTextDto {
	private int planType4Idx;
	private String boldText; 
	private String thinText;
	private int day;
	
	public Type4BoldTextDto(int planType4Idx, String boldText, String thinText, int day) {
		super();
		this.planType4Idx = planType4Idx;
		this.boldText = boldText;
		this.thinText = thinText;
		this.day = day;
	}

	public int getPlanType4Idx() {
		return planType4Idx;
	}

	public void setPlanType4Idx(int planType4Idx) {
		this.planType4Idx = planType4Idx;
	}

	public String getBoldText() {
		return boldText;
	}

	public void setBoldText(String boldText) {
		this.boldText = boldText;
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
