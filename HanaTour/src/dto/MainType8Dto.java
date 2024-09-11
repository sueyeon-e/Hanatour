package dto;

public class MainType8Dto {
	private String imgUrl;
	private String tagTop;
	private String productName;
	private String tagBottom;
	private String price;
	private int categoryIdx;
	
	public MainType8Dto(String imgUrl, String tagTop, String productName, String tagBottom, String price,
			int categoryIdx) {
		super();
		this.imgUrl = imgUrl;
		this.tagTop = tagTop;
		this.productName = productName;
		this.tagBottom = tagBottom;
		this.price = price;
		this.categoryIdx = categoryIdx;
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
