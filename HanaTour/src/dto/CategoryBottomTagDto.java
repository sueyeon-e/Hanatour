package dto;

public class CategoryBottomTagDto {
	private int categoryIdx;
	private String tag;
	
	public CategoryBottomTagDto(int categoryIdx, String tag) {
		super();
		this.categoryIdx = categoryIdx;
		this.tag = tag;
	}

	public int getCategoryIdx() {
		return categoryIdx;
	}

	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	} 
	
}
