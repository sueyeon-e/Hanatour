package dto;

public class Type3ThinTextDto {
	private int planType3Idx; 
	private String thin_text;
	private int day;
	
	public Type3ThinTextDto(int planType3Idx, String thin_text, int day) {
		super();
		this.planType3Idx = planType3Idx;
		this.thin_text = thin_text;
		this.day = day;
	}

	public int getPlanType3Idx() {
		return planType3Idx;
	}

	public void setPlanType3Idx(int planType3Idx) {
		this.planType3Idx = planType3Idx;
	}

	public String getThin_text() {
		return thin_text;
	}

	public void setThin_text(String thin_text) {
		this.thin_text = thin_text;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}
	
	
	
}
