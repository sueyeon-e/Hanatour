package dto;

public class PackageContainInfoDto {
	String contain; 
	String nonContain; 
	String choicePrice;
	
	public PackageContainInfoDto(String contain, String nonContain, String choicePrice) {
		super();
		this.contain = contain;
		this.nonContain = nonContain;
		this.choicePrice = choicePrice;
	}

	public String getContain() {
		return contain;
	}

	public void setContain(String contain) {
		this.contain = contain;
	}

	public String getNonContain() {
		return nonContain;
	}

	public void setNonContain(String nonContain) {
		this.nonContain = nonContain;
	}

	public String getChoicePrice() {
		return choicePrice;
	}

	public void setChoicePrice(String choicePrice) {
		this.choicePrice = choicePrice;
	}
	
	
}
