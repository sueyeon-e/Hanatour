package dto;

public class PackagePriceDto {
	private int adult; 
	private int child; 
	private int infant;
	
	public PackagePriceDto(int adult, int child, int infant) {
		super();
		this.adult = adult;
		this.child = child;
		this.infant = infant;
	}

	public int getAdult() {
		return adult;
	}

	public void setAdult(int adult) {
		this.adult = adult;
	}

	public int getChild() {
		return child;
	}

	public void setChild(int child) {
		this.child = child;
	}

	public int getInfant() {
		return infant;
	}

	public void setInfant(int infant) {
		this.infant = infant;
	} 
	
}
