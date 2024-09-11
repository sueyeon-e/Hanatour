package dto;

public class PackageInfoDto {
	String contain; 
	String boldText;
	String thinText;
	
	public PackageInfoDto(String contain, String boldText, String thinText) {
		super();
		this.contain = contain;
		this.boldText = boldText;
		this.thinText = thinText;
	}

	public String getContain() {
		return contain;
	}

	public void setContain(String contain) {
		this.contain = contain;
	}

	public String getBoldText() {
		return boldText;
	}

	public void setBoldText(String boldText) {
		this.boldText = boldText;
	}

	public String getThinText() {
		return thinText;
	}

	public void setThinText(String thinText) {
		this.thinText = thinText;
	}
	
	
}
