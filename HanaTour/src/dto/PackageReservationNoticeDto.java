package dto;

public class PackageReservationNoticeDto {
	String boldText;
	String thinText;
	
	public PackageReservationNoticeDto(String boldText, String thinText) {
		super();
		this.boldText = boldText;
		this.thinText = thinText;
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
