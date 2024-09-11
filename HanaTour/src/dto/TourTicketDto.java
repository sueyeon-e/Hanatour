package dto;

public class TourTicketDto {
	private int tourGoodsIdx;
	private String cityName;
	private String goodsName;
	private String whenUse;
	private String ticketType;
	public TourTicketDto(int tourGoodsIdx, String cityName, String goodsName, String whenUse, String ticketType) {
		super();
		this.tourGoodsIdx = tourGoodsIdx;
		this.cityName = cityName;
		this.goodsName = goodsName;
		this.whenUse = whenUse;
		this.ticketType = ticketType;
	}
	public int getTourGoodsIdx() {
		return tourGoodsIdx;
	}
	public void setTourGoodsIdx(int tourGoodsIdx) {
		this.tourGoodsIdx = tourGoodsIdx;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getWhenUse() {
		return whenUse;
	}
	public void setWhenUse(String whenUse) {
		this.whenUse = whenUse;
	}
	public String getTicketType() {
		return ticketType;
	}
	public void setTicketType(String ticketType) {
		this.ticketType = ticketType;
	}
	
}
