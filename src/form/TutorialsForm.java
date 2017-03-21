package form;

import java.util.ArrayList;

import model.bean.Categories;
import model.bean.Tutorial;
import model.bean.TutorialCode;

import org.apache.struts.action.ActionForm;

public class TutorialsForm extends ActionForm {

	private String cateId;
	private String menuId;
	private String name; // name of categorie
	private ArrayList<Categories> cateList;

	private String userId;
	private String username;
	private String password;
	private String avatar;
	private String university;
	private String point;
	private String typeUser;

	public TutorialCode getTutCode() {
		return tutCode;
	}

	public void setTutCode(TutorialCode tutCode) {
		this.tutCode = tutCode;
	}

	private String statusLogin;
	private String rank;
	// tutorial
	private ArrayList<Tutorial> tutList;
	private ArrayList<TutorialCode> tutCodeList;

	private TutorialCode tutCode;
	
	

	public ArrayList<TutorialCode> getTutCodeList() {
		return tutCodeList;
	}

	public void setTutCodeList(ArrayList<TutorialCode> tutCodeList) {
		this.tutCodeList = tutCodeList;
	}

	public String getCateId() {
		return cateId;
	}

	public void setCateId(String cateId) {
		this.cateId = cateId;
	}

	public String getMenuId() {
		return menuId;
	}

	public void setMenuId(String menuId) {
		this.menuId = menuId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<Categories> getCateList() {
		return cateList;
	}

	public void setCateList(ArrayList<Categories> cateList) {
		this.cateList = cateList;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getUniversity() {
		return university;
	}

	public void setUniversity(String university) {
		this.university = university;
	}

	public String getPoint() {
		return point;
	}

	public void setPoint(String point) {
		this.point = point;
	}

	public String getTypeUser() {
		return typeUser;
	}

	public void setTypeUser(String typeUser) {
		this.typeUser = typeUser;
	}

	public String getStatusLogin() {
		return statusLogin;
	}

	public void setStatusLogin(String statusLogin) {
		this.statusLogin = statusLogin;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public ArrayList<Tutorial> getTutList() {
		return tutList;
	}

	public void setTutList(ArrayList<Tutorial> tutList) {
		this.tutList = tutList;
	}

}
