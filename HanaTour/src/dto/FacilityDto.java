package dto;

public class FacilityDto {
	private String facilityTitleName;
	private String facilityImg;
	private int facilityTitleIdx;
	public FacilityDto(String facilityTitleName, String facilityImg, int facilityTitleIdx) {
		super();
		this.facilityTitleName = facilityTitleName;
		this.facilityImg = facilityImg;
		this.facilityTitleIdx = facilityTitleIdx;
	}
	public String getFacilityTitleName() {
		return facilityTitleName;
	}
	public void setFacilityTitleName(String facilityTitleName) {
		this.facilityTitleName = facilityTitleName;
	}
	public String getFacilityImg() {
		return facilityImg;
	}
	public void setFacilityImg(String facilityImg) {
		this.facilityImg = facilityImg;
	}
	public int getFacilityTitleIdx() {
		return facilityTitleIdx;
	}
	public void setFacilityTitleIdx(int facilityTitleIdx) {
		this.facilityTitleIdx = facilityTitleIdx;
	}
	
	
}
