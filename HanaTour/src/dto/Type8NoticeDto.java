package dto;

public class Type8NoticeDto {
	private int planType8Idx; 
	private String title; 
	private String boldText; 
	private String thinText; 
	private int day;
	
	public Type8NoticeDto(int planType8Idx, String title, String boldText, String thinText, int day) {
		super();
		this.planType8Idx = planType8Idx;
		this.title = title;
		this.boldText = boldText;
		this.thinText = thinText;
		this.day = day;
	}

	public int getPlanType8Idx() {
		return planType8Idx;
	}

	public void setPlanType8Idx(int planType8Idx) {
		this.planType8Idx = planType8Idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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
