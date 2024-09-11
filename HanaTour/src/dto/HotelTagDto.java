package dto;

public class HotelTagDto {
	private String Tag;
	private String purpleTag;
	public HotelTagDto(String tag, String purpleTag) {
		super();
		Tag = tag;
		this.purpleTag = purpleTag;
	}
	public String getTag() {
		return Tag;
	}
	public void setTag(String tag) {
		Tag = tag;
	}
	public String getPurpleTag() {
		return purpleTag;
	}
	public void setPurpleTag(String purpleTag) {
		this.purpleTag = purpleTag;
	}	
}
