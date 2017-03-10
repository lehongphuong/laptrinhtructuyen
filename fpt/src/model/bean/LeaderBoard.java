package model.bean;

public class LeaderBoard {

	private int leadId;
	private int subId;
	private int userId;
	private int codeId;

	public LeaderBoard() {
		super();
	}

	public LeaderBoard(int leadId, int subId, int userId, int codeId) {
		super();
		this.leadId = leadId;
		this.subId = subId;
		this.userId = userId;
		this.codeId = codeId;
	}

	public int getLeadId() {
		return leadId;
	}

	public void setLeadId(int leadId) {
		this.leadId = leadId;
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

	public int getCodeId() {
		return codeId;
	}

	public void setCodeId(int codeId) {
		this.codeId = codeId;
	}

}
