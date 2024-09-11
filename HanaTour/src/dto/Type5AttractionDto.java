package dto;

public class Type5AttractionDto {
	private String title; 
	private int planType5Idx; 
	private String attractionKor; 
	private String attractionEng; 
	private String ex; 
	private String detailedEx; 
	private int day; 
	private int planDetailOrder; 
	private int attractionIdx;
	
	public Type5AttractionDto(String title, int planType5Idx, String attractionKor, String attractionEng, String ex,
			String detailedEx, int day, int planDetailOrder, int attractionIdx) {
		super();
		this.title = title;
		this.planType5Idx = planType5Idx;
		this.attractionKor = attractionKor;
		this.attractionEng = attractionEng;
		this.ex = ex;
		this.detailedEx = detailedEx;
		this.day = day;
		this.planDetailOrder = planDetailOrder;
		this.attractionIdx = attractionIdx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getPlanType5Idx() {
		return planType5Idx;
	}

	public void setPlanType5Idx(int planType5Idx) {
		this.planType5Idx = planType5Idx;
	}

	public String getAttractionKor() {
		return attractionKor;
	}

	public void setAttractionKor(String attractionKor) {
		this.attractionKor = attractionKor;
	}

	public String getAttractionEng() {
		return attractionEng;
	}

	public void setAttractionEng(String attractionEng) {
		this.attractionEng = attractionEng;
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

	public int getPlanDetailOrder() {
		return planDetailOrder;
	}

	public void setPlanDetailOrder(int planDetailOrder) {
		this.planDetailOrder = planDetailOrder;
	}

	public int getAttractionIdx() {
		return attractionIdx;
	}

	public void setAttractionIdx(int attractionIdx) {
		this.attractionIdx = attractionIdx;
	}
	
	
	
}
