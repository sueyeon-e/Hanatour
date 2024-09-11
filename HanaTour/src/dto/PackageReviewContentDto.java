package dto;

public class PackageReviewContentDto {
	private int categoryIdx; 
	private int reviewStar;
	private int reviewIdx; 
	private String userId; 
	private String pressLike; 
	private String age; 
	private String writeDate; 
	private String packageName; 
	private String text; 
	private int help;
	private int reviewId;
	
    // 리뷰 ID의 getter 메서드
    public int getReviewId() {
        return reviewId;
    }

    // 리뷰 ID의 setter 메서드
    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }
	
	public PackageReviewContentDto(int categoryIdx, int reviewStar, int reviewIdx, String userId, String pressLike,
			String age, String writeDate, String packageName, String text, int help) {
		super();
		this.categoryIdx = categoryIdx;
		this.reviewStar = reviewStar;
		this.reviewIdx = reviewIdx;
		this.userId = userId;
		this.pressLike = pressLike;
		this.age = age;
		this.writeDate = writeDate;
		this.packageName = packageName;
		this.text = text;
		this.help = help;
	}

	public int getCategoryIdx() {
		return categoryIdx;
	}

	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}

	public int getReviewStar() {
		return reviewStar;
	}

	public void setReviewStar(int reviewStar) {
		this.reviewStar = reviewStar;
	}

	public int getReviewIdx() {
		return reviewIdx;
	}

	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPressLike() {
		return pressLike;
	}

	public void setPressLike(String pressLike) {
		this.pressLike = pressLike;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getHelp() {
		return help;
	}

	public void setHelp(int help) {
		this.help = help;
	}
	
}
