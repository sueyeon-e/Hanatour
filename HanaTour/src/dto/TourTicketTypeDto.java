package dto;

public class TourTicketTypeDto {
	int goodsIdx;
	int goodsTypeIdx;
	String typeDate;
	String goodsTypeTitle;
	String typeInfo;
	String infoInclude;
	String infoExclude;
	public TourTicketTypeDto(int goodsIdx, int goodsTypeIdx, String typeDate, String goodsTypeTitle, String typeInfo,
			String infoInclude, String infoExclude) {
		super();
		this.goodsIdx = goodsIdx;
		this.goodsTypeIdx = goodsTypeIdx;
		this.typeDate = typeDate;
		this.goodsTypeTitle = goodsTypeTitle;
		this.typeInfo = typeInfo;
		this.infoInclude = infoInclude;
		this.infoExclude = infoExclude;
	}
	public int getGoodsIdx() {
		return goodsIdx;
	}
	public void setGoodsIdx(int goodsIdx) {
		this.goodsIdx = goodsIdx;
	}
	public int getGoodsTypeIdx() {
		return goodsTypeIdx;
	}
	public void setGoodsTypeIdx(int goodsTypeIdx) {
		this.goodsTypeIdx = goodsTypeIdx;
	}
	public String getTypeDate() {
		return typeDate;
	}
	public void setTypeDate(String typeDate) {
		this.typeDate = typeDate;
	}
	public String getGoodsTypeTitle() {
		return goodsTypeTitle;
	}
	public void setGoodsTypeTitle(String goodsTypeTitle) {
		this.goodsTypeTitle = goodsTypeTitle;
	}
	public String getTypeInfo() {
		return typeInfo;
	}
	public void setTypeInfo(String typeInfo) {
		this.typeInfo = typeInfo;
	}
	public String getInfoInclude() {
		return infoInclude;
	}
	public void setInfoInclude(String infoInclude) {
		this.infoInclude = infoInclude;
	}
	public String getInfoExclude() {
		return infoExclude;
	}
	public void setInfoExclude(String infoExclude) {
		this.infoExclude = infoExclude;
	}
	
	
}
