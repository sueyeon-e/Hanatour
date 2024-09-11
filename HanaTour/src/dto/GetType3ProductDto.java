package dto;

public class GetType3ProductDto {
	private int mainType3Idx; 
	private int mainType8Idx; 
	private String imgUrl; 
	private String tagTop; 
	private String productName; 
	private String tagBottom; 
	private String price; 
	private int categoryIdx;
	
	public GetType3ProductDto(int mainType3Idx, int mainType8Idx, String imgUrl, String tagTop, String productName,
			String tagBottom, String price, int categoryIdx) {
		super();
		this.mainType3Idx = mainType3Idx;
		this.mainType8Idx = mainType8Idx;
		this.imgUrl = imgUrl;
		this.tagTop = tagTop;
		this.productName = productName;
		this.tagBottom = tagBottom;
		this.price = price;
		this.categoryIdx = categoryIdx;
	}

	public int getMainType3Idx() {
		return mainType3Idx;
	}

	public void setMainType3Idx(int mainType3Idx) {
		this.mainType3Idx = mainType3Idx;
	}

	public int getMainType8Idx() {
		return mainType8Idx;
	}

	public void setMainType8Idx(int mainType8Idx) {
		this.mainType8Idx = mainType8Idx;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getTagTop() {
		return tagTop;
	}

	public void setTagTop(String tagTop) {
		this.tagTop = tagTop;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getTagBottom() {
		return tagBottom;
	}

	public void setTagBottom(String tagBottom) {
		this.tagBottom = tagBottom;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public int getCategoryIdx() {
		return categoryIdx;
	}

	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}
	
	
}	
