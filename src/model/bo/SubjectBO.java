package model.bo;

import java.util.ArrayList;

import model.bean.Subject;
import model.dao.SubjectDAO;

public class SubjectBO {
SubjectDAO dao=new SubjectDAO();
/*
 *get all categories
 */
public ArrayList<Subject> getAllSubject() {
	return dao.getAllSubject();
}


public void insertSubject(Subject Subject) {
	insertSubject(Subject);

}

// update
public void updateSubject(Subject Subject) {
	updateSubject(Subject);
}

//delete
	public void deleteSubject(int subId) {
		deleteSubject(subId);
	}
}