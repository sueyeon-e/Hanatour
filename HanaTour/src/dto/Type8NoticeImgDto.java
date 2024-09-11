package dto;

public class Type8NoticeImgDto {
	private int planType8Idx; 
	private String imgUrl; 
	private int day;
	
	public Type8NoticeImgDto(int planType8Idx, String imgUrl, int day) {
		super();
		this.planType8Idx = planType8Idx;
		this.imgUrl = imgUrl;
		this.day = day;
	}

	public int getPlanType8Idx() {
		return planType8Idx;
	}

	public void setPlanType8Idx(int planType8Idx) {
		this.planType8Idx = planType8Idx;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}
	
	

}
