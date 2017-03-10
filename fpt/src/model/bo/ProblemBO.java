package model.bo;

import java.util.ArrayList;

import model.bean.Problem;
import model.dao.ProblemDAO;

public class ProblemBO {
ProblemDAO dao=new ProblemDAO(); 

/*
 *get all categories
 */
public ArrayList<Problem> getAllProblem() {
	return dao.getAllProblem();
}


public void insertProblem(Problem Problem) {
	insertProblem(Problem);

}

// update
public void updateProblem(Problem Problem) {
	updateProblem(Problem);
}

// delete
public void deleteProblem(int proId) {
	deleteProblem(proId);
}

}
