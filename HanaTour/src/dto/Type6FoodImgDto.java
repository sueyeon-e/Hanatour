package dto;

public class Type6FoodImgDto {
	private int planType6Idx;
	private String imgUrl;
	
	public Type6FoodImgDto(int planType6Idx, String imgUrl) {
		super();
		this.planType6Idx = planType6Idx;
		this.imgUrl = imgUrl;
	}

	public int getPlanType6Idx() {
		return planType6Idx;
	}

	public void setPlanType6Idx(int planType6Idx) {
		this.planType6Idx = planType6Idx;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}	
	
	
}
