package dto;

public class ScheduleTitleDto {
	private int travelPlanIdx; 
	private int day; 
	private String title; 
	private String subtitle;
	
	public ScheduleTitleDto(int travelPlanIdx, int day, String title, String subtitle) {
		super();
		this.travelPlanIdx = travelPlanIdx;
		this.day = day;
		this.title = title;
		this.subtitle = subtitle;
	}

	public int getTravelPlanIdx() {
		return travelPlanIdx;
	}

	public void setTravelPlanIdx(int travelPlanIdx) {
		this.travelPlanIdx = travelPlanIdx;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSubtitle() {
		return subtitle;
	}

	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	
}
