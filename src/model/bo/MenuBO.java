package model.bo;

import java.util.ArrayList;

import model.bean.Menu;
import model.dao.MenuDAO;

public class MenuBO {
 MenuDAO dao=new MenuDAO();
 
	/*
	 *get all categories
	 */
	public ArrayList<Menu> getAllMenu() {
		return dao.getAllMenu();
	}

	
	public void insertMenu(Menu Menu) {
		insertMenu(Menu);

	}

	// update
	public void updateMenu(Menu Menu) {
		updateMenu(Menu);
	}

	// delete
	public void deleteMenu(int menuId) {
		deleteMenu(menuId);
	}

}
