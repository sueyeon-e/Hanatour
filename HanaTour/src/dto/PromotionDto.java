package dto;

public class PromotionDto {
    private String title;
    private String subtitle;
    private String imgUrl;
    
	public PromotionDto(String title, String subtitle, String imgUrl) {
		this.title = title;
		this.subtitle = subtitle;
		this.imgUrl = imgUrl;
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

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	
}
