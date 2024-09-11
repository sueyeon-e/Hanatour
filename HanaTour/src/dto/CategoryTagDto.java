package dto;

public class CategoryTagDto {
	private String cityName; 
	private int categoryIdx;
	
	public CategoryTagDto(String cityName, int categoryIdx) {
		super();
		this.cityName = cityName;
		this.categoryIdx = categoryIdx;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public int getCategoryIdx() {
		return categoryIdx;
	}

	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}
	
}
