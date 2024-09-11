package dto;

public class TabSmallHotelBoxDto {
	String location;
	String innKor;
	
	public TabSmallHotelBoxDto(String location, String innKor) {
		super();
		this.location = location;
		this.innKor = innKor;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getInnKor() {
		return innKor;
	}

	public void setInnKor(String innKor) {
		this.innKor = innKor;
	}
	
	
}
