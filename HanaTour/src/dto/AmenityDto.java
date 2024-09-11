package dto;

public class AmenityDto {
	private String amenityTitleName;
	private String amenityImg;
	private int amenityTitleIdx;
	public AmenityDto(String amenityTitleName, String amenityImg, int amenityTitleIdx) {
		super();
		this.amenityTitleName = amenityTitleName;
		this.amenityImg = amenityImg;
		this.amenityTitleIdx = amenityTitleIdx;
	}
	public String getAmenityTitleName() {
		return amenityTitleName;
	}
	public void setAmenityTitleName(String amenityTitleName) {
		this.amenityTitleName = amenityTitleName;
	}
	public String getAmenityImg() {
		return amenityImg;
	}
	public void setAmenityImg(String amenityImg) {
		this.amenityImg = amenityImg;
	}
	public int getAmenityTitleIdx() {
		return amenityTitleIdx;
	}
	public void setAmenityTitleIdx(int amenityTitleIdx) {
		this.amenityTitleIdx = amenityTitleIdx;
	}
}
