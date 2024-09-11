package dto;

public class MainOrderDto {
	private int orderIdx;
	private int type;

	public MainOrderDto(int orderIdx, int type) {
		this.orderIdx = orderIdx;
		this.type = type;
	}
	
	public int getOrderIdx() {
		return orderIdx;
	}
	public void setOrderIdx(int orderIdx) {
		this.orderIdx = orderIdx;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
}
