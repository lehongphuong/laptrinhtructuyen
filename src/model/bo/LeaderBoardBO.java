package model.bo;

import java.util.ArrayList;

import model.bean.LeaderBoard;
import model.dao.LeaderBoardDAO;

public class LeaderBoardBO {
 LeaderBoardDAO dao=new LeaderBoardDAO(); 
 /*
	 *get all categories
	 */
	public ArrayList<LeaderBoard> getAllLeaderbBoard() {
		return dao.getAllLeaderbBoard();
	}

	
	public void insertLeaderBoard(LeaderBoard LeaderBoard) {
		insertLeaderBoard(LeaderBoard);

	}

	// update
	public void updateLeaderBoard(LeaderBoard LeaderBoard) {
		updateLeaderBoard(LeaderBoard);
	}

	// delete
	public void deleteLeaderBoard(int leadId) {
		deleteLeaderBoard(leadId);
	}
}
