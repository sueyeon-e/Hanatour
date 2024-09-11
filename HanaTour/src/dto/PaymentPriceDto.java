package dto;

public class PaymentPriceDto {
	private Integer reservationIdx; 
	private Integer travelPrice; 
	private Integer flightPrice; 
	private Integer innPrice; 
	private Integer goodsPrice;
	
	public PaymentPriceDto(Integer reservationIdx, Integer travelPrice, Integer flightPrice, Integer innPrice,
			Integer goodsPrice) {
		super();
		this.reservationIdx = reservationIdx;
		this.travelPrice = travelPrice;
		this.flightPrice = flightPrice;
		this.innPrice = innPrice;
		this.goodsPrice = goodsPrice;
	}

	public Integer getReservationIdx() {
		return reservationIdx;
	}

	public void setReservationIdx(Integer reservationIdx) {
		this.reservationIdx = reservationIdx;
	}

	public Integer getTravelPrice() {
		return travelPrice;
	}

	public void setTravelPrice(Integer travelPrice) {
		this.travelPrice = travelPrice;
	}

	public Integer getFlightPrice() {
		return flightPrice;
	}

	public void setFlightPrice(Integer flightPrice) {
		this.flightPrice = flightPrice;
	}

	public Integer getInnPrice() {
		return innPrice;
	}

	public void setInnPrice(Integer innPrice) {
		this.innPrice = innPrice;
	}

	public Integer getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(Integer goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	
	
	
}
