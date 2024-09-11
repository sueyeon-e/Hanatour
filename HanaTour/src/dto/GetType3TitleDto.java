package dto;

public class GetType3TitleDto {
	private int mainType3Idx;
	private String title; 
	private String imgUrl;
	private String tabName;
	
	public GetType3TitleDto(int mainType3Idx, String title, String imgUrl, String tabName) {
		super();
		this.mainType3Idx = mainType3Idx;
		this.title = title;
		this.imgUrl = imgUrl;
		this.tabName = tabName;
	}

	public int getMainType3Idx() {
		return mainType3Idx;
	}

	public void setMainType3Idx(int mainType3Idx) {
		this.mainType3Idx = mainType3Idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getTabName() {
		return tabName;
	}

	public void setTabName(String tabName) {
		this.tabName = tabName;
	}
	
	
	
}
