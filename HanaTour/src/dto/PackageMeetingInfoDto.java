package dto;

public class PackageMeetingInfoDto {
	String leader; 
	String guide; 
	String infoDate; 
	String location; 
	String mapUrl; 
	String purpleInfo; 
	String thinInfo;
	
	public PackageMeetingInfoDto(String leader, String guide, String infoDate, String location, String mapUrl,
			String purpleInfo, String thinInfo) {
		super();
		this.leader = leader;
		this.guide = guide;
		this.infoDate = infoDate;
		this.location = location;
		this.mapUrl = mapUrl;
		this.purpleInfo = purpleInfo;
		this.thinInfo = thinInfo;
	}

	public String getLeader() {
		return leader;
	}

	public void setLeader(String leader) {
		this.leader = leader;
	}

	public String getGuide() {
		return guide;
	}

	public void setGuide(String guide) {
		this.guide = guide;
	}

	public String getInfoDate() {
		return infoDate;
	}

	public void setInfoDate(String infoDate) {
		this.infoDate = infoDate;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getMapUrl() {
		return mapUrl;
	}

	public void setMapUrl(String mapUrl) {
		this.mapUrl = mapUrl;
	}

	public String getPurpleInfo() {
		return purpleInfo;
	}

	public void setPurpleInfo(String purpleInfo) {
		this.purpleInfo = purpleInfo;
	}

	public String getThinInfo() {
		return thinInfo;
	}

	public void setThinInfo(String thinInfo) {
		this.thinInfo = thinInfo;
	}
	
}
