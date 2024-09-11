package dto;

public class CategoryPackageInfoDto {
	private int categoryIdx; 
	private int packageIdx; 
	private String pacakgeName; 
	private String travelPeriod; 
	private String shopping;
	private String shoppingTimes; 
	private String guide; 
	private int adult; 
	private int maxStar;
	private String logo; 
	private String name;
	private String inn;
	
	public CategoryPackageInfoDto(int categoryIdx, int packageIdx, String pacakgeName, String travelPeriod,
			String shopping, String shoppingTimes, String guide, int adult, int maxStar, String logo, String name,
			String inn) {
		super();
		this.categoryIdx = categoryIdx;
		this.packageIdx = packageIdx;
		this.pacakgeName = pacakgeName;
		this.travelPeriod = travelPeriod;
		this.shopping = shopping;
		this.shoppingTimes = shoppingTimes;
		this.guide = guide;
		this.adult = adult;
		this.maxStar = maxStar;
		this.logo = logo;
		this.name = name;
		this.inn = inn;
	}

	public int getCategoryIdx() {
		return categoryIdx;
	}

	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}

	public int getPackageIdx() {
		return packageIdx;
	}

	public void setPackageIdx(int packageIdx) {
		this.packageIdx = packageIdx;
	}

	public String getPacakgeName() {
		return pacakgeName;
	}

	public void setPacakgeName(String pacakgeName) {
		this.pacakgeName = pacakgeName;
	}

	public String getTravelPeriod() {
		return travelPeriod;
	}

	public void setTravelPeriod(String travelPeriod) {
		this.travelPeriod = travelPeriod;
	}

	public String getShopping() {
		return shopping;
	}

	public void setShopping(String shopping) {
		this.shopping = shopping;
	}

	public String getShoppingTimes() {
		return shoppingTimes;
	}

	public void setShoppingTimes(String shoppingTimes) {
		this.shoppingTimes = shoppingTimes;
	}

	public String getGuide() {
		return guide;
	}

	public void setGuide(String guide) {
		this.guide = guide;
	}

	public int getAdult() {
		return adult;
	}

	public void setAdult(int adult) {
		this.adult = adult;
	}

	public int getMaxStar() {
		return maxStar;
	}

	public void setMaxStar(int maxStar) {
		this.maxStar = maxStar;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getInn() {
		return inn;
	}

	public void setInn(String inn) {
		this.inn = inn;
	}
	
}
