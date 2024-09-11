package dto;

public class DomesticSearchDto {
	private String innImgUrl;
	private String innType;
	private String domesticInfo;
	private String innKor;
	private int star;
	private String address;
	private int price;
	public DomesticSearchDto(String innImgUrl, String innType, String domesticInfo, String innKor,
			int star, String address, int price) {
		super();
		this.innImgUrl = innImgUrl;
		this.innType = innType; 
		this.domesticInfo = domesticInfo;
		this.innKor = innKor;
		this.star = star;
		this.address = address;
		this.price = price;
	}
	
	public String getInnImgUrl() {
		return innImgUrl;
	}
	public void setInnImgUrl(String innImgUrl) {
		this.innImgUrl = innImgUrl;
	}
	public String getInnType() {
		return innType;
	}
	public void setInnType(String innType) {
		this.innType = innType;
	}
	public String getDomesticInfo() {
		return domesticInfo;
	}
	public void setDomesticInfo(String domesticInfo) {
		this.domesticInfo = domesticInfo;
	}
	public String getInnKor() {
		return innKor;
	}
	public void setInnKor(String innKor) {
		this.innKor = innKor;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
