package model.bean;

public class Submit {
	private int submitId;
	private int subId;
	private int userId;
	private String date;
	private float point;

	public Submit() {
		super();
	}

	public Submit(int submitId, int subId, int userId, String date, float point) {
		super();
		this.submitId = submitId;
		this.subId = subId;
		this.userId = userId;
		this.date = date;
		this.point = point;
	}

	public int getSubmitId() {
		return submitId;
	}

	public void setSubmitId(int submitId) {
		this.submitId = submitId;
	}

	public int getSubId() {
		return subId;
	}

	public void setSubId(int subId) {
		this.subId = subId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public float getPoint() {
		return point;
	}

	public void setPoint(float point) {
		this.point = point;
	}

}
