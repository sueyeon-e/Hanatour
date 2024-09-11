package dto;

public class Type10MealDto {
	private int planType10Idx; 
	private int day; 
	private String totalMeal;
	
	public Type10MealDto(int planType10Idx, int day, String totalMeal) {
		super();
		this.planType10Idx = planType10Idx;
		this.day = day;
		this.totalMeal = totalMeal;
	}

	public int getPlanType10Idx() {
		return planType10Idx;
	}

	public void setPlanType10Idx(int planType10Idx) {
		this.planType10Idx = planType10Idx;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getTotalMeal() {
		return totalMeal;
	}

	public void setTotalMeal(String totalMeal) {
		this.totalMeal = totalMeal;
	}
	
	
}
