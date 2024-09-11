package dto;

public class DomesticHotelDto {
	private String inn_img_url;
	private int star;
	private String inn_kor;
	private String domestic_info;
	private String address;
	private String phone;
	private String homepage_url;
	private int min_price;
	public DomesticHotelDto(String inn_img_url, int star, String inn_kor, String domestic_info, String address,
			String phone, String homepage_url, int min_price) {
		super();
		this.inn_img_url = inn_img_url;
		this.star = star;
		this.inn_kor = inn_kor;
		this.domestic_info = domestic_info;
		this.address = address;
		this.phone = phone;
		this.homepage_url = homepage_url;
		this.min_price = min_price;
	}
	public String getInn_img_url() {
		return inn_img_url;
	}
	public void setInn_img_url(String inn_img_url) {
		this.inn_img_url = inn_img_url;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getInn_kor() {
		return inn_kor;
	}
	public void setInn_kor(String inn_kor) {
		this.inn_kor = inn_kor;
	}
	public String getDomestic_info() {
		return domestic_info;
	}
	public void setDomestic_info(String domestic_info) {
		this.domestic_info = domestic_info;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHomepage_url() {
		return homepage_url;
	}
	public void setHomepage_url(String homepage_url) {
		this.homepage_url = homepage_url;
	}
	public int getMin_price() {
		return min_price;
	}
	public void setMin_price(int min_price) {
		this.min_price = min_price;
	}
	
	
	
}
