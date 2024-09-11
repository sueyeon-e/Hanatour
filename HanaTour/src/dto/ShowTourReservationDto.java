package dto;

public class ShowTourReservationDto {
	private String goodsName;
	private String paymentDate;
	
	public ShowTourReservationDto(String goodsName, String paymentDate) {
		super();
		this.goodsName = goodsName;
		this.paymentDate = paymentDate;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(String paymentDate) {
		this.paymentDate = paymentDate;
	}
	
	
	
}
