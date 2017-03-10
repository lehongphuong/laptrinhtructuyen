package model.bo;

import java.util.ArrayList;

import model.bean.Editorial;
import model.dao.EditorialDAO;

public class EditorialBO {
	EditorialDAO dao=new EditorialDAO();
	
	/*
	 *get all categories
	 */
	public ArrayList<Editorial> getAllEditorial() {
		return dao.getAllEditorial();
	}

	
	public void insertEditorial(Editorial Editorial) {
		insertEditorial(Editorial);

	}

	// update
	public void updateEditorial(Editorial Editorial) {
		updateEditorial(Editorial);
	}

	// delete
	public void deleteEditorial(int editId) {
		deleteEditorial(editId);

}
}
