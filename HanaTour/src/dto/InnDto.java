package dto;

public class InnDto {
	private int inn_idx;
	private String inn_kor;
	private String inn_eng;
	public InnDto(int inn_idx, String inn_kor, String inn_eng) {
		super();
		this.inn_idx = inn_idx;
		this.inn_kor = inn_kor;
		this.inn_eng = inn_eng;
	}
	public int getInn_idx() {
		return inn_idx;
	}
	public void setInn_idx(int inn_idx) {
		this.inn_idx = inn_idx;
	}
	public String getInn_kor() {
		return inn_kor;
	}
	public void setInn_kor(String inn_kor) {
		this.inn_kor = inn_kor;
	}
	public String getInn_eng() {
		return inn_eng;
	}
	public void setInn_eng(String inn_eng) {
		this.inn_eng = inn_eng;
	}
	
} 
