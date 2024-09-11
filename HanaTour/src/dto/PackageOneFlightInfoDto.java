package dto;

public class PackageOneFlightInfoDto {
	private int period;
	private String logo;
	private String name;
	
	public PackageOneFlightInfoDto(int period, String logo, String name) {
		super();
		this.period = period;
		this.logo = logo;
		this.name = name;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
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
	
	
}
