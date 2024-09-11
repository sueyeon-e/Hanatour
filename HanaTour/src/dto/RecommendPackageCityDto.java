package dto;

public class RecommendPackageCityDto {
	private int PackageIdx;
	private String cityName;
	
	public RecommendPackageCityDto(int packageIdx, String cityName) {
		super();
		PackageIdx = packageIdx;
		this.cityName = cityName;
	}

	public int getPackageIdx() {
		return PackageIdx;
	}

	public void setPackageIdx(int packageIdx) {
		PackageIdx = packageIdx;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	
	
	
	
}
