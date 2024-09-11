package dto;

public class OverseaHotelPrice {
	private int price;
	private int innIdx;
	public OverseaHotelPrice(int price, int innIdx) {
		super();
		this.price = price;
		this.innIdx = innIdx;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getInnIdx() {
		return innIdx;
	}
	public void setInnIdx(int innIdx) {
		this.innIdx = innIdx;
	}
	
}
