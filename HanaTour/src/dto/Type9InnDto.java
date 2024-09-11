package dto;

public class Type9InnDto {
	private int planType9Idx; 
	private String innKor; 
	private String innEng; 
	private int day;
	
	public Type9InnDto(int planType9Idx, String innKor, String innEng, int day) {
		super();
		this.planType9Idx = planType9Idx;
		this.innKor = innKor;
		this.innEng = innEng;
		this.day = day;
	}

	public int getPlanType9Idx() {
		return planType9Idx;
	}

	public void setPlanType9Idx(int planType9Idx) {
		this.planType9Idx = planType9Idx;
	}

	public String getInnKor() {
		return innKor;
	}

	public void setInnKor(String innKor) {
		this.innKor = innKor;
	}

	public String getInnEng() {
		return innEng;
	}

	public void setInnEng(String innEng) {
		this.innEng = innEng;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}	
	
	

}
