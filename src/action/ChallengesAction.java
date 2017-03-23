package action;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Problem;
import model.bean.Status;
import model.bean.User;
import model.bo.CategoriesBO;
import model.bo.EditorialBO;
import model.bo.LeaderBoardBO;
import model.bo.ProblemBO;
import model.bo.StatusBO;
import model.bo.SubjectBO;
import model.bo.SubmitBO;
import model.bo.UserBO;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.MyCookie;
import form.ChallengesForm;

public class ChallengesAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		ChallengesForm challengesForm = (ChallengesForm) form;
		String cateId = request.getParameter("cateId");
		String menuId = request.getParameter("menuId");
		String subId = request.getParameter("subId");
		String userId = "";

		CategoriesBO categoriesBO = new CategoriesBO();
		SubjectBO subjectBO = new SubjectBO();

		UserBO userBO = new UserBO();

		/**
		 * LAY DU LIEU NGUOI DUNG
		 */

		MyCookie myCookie = new MyCookie(request, response);
		String statusLogin = myCookie.getCookie("statusLogin");
		User user = new User();
		if (statusLogin == null) {
			statusLogin = "notLogin";
		}

		// kiem tra va lay thong tin neu dang nhap thanh cong
		if ("login".equals(statusLogin)) {
			// dang nhap thanh cong
			user = userBO.getOneUserById(myCookie.getCookie("userId"));
			challengesForm.setUserId(user.getUserId() + "");
			userId = user.getUserId() + "";
			challengesForm.setUsername(user.getUsername());
			challengesForm.setPassword(user.getPassword());
			challengesForm.setAvatar(user.getAvatar());
			challengesForm.setUniversity(user.getUniversity());
			challengesForm.setPoint(user.getPoint() + "");
			challengesForm.setTypeUser(user.getTypeUser());
			// get du lieu cho rank dua vao point
			challengesForm.setRank(""
					+ userBO.getRankUserById(user.getUserId()));
		}
		challengesForm.setStatusLogin(statusLogin);

		/**
		 * KET THUC LAY DU LIEU NGUOI DUNG
		 */

		// set du lieu cho form
		challengesForm.setCateId(cateId);
		challengesForm.setMenuId(menuId);
		// set list categories
		challengesForm.setCateList(categoriesBO.getAllCategories());
		// set list subject

		// get du lieu cho status button dua vao bang status
		StatusBO statusBO = new StatusBO();
		ArrayList<Status> statusList = statusBO.getAllStatus();

		request.setAttribute("statusList", statusList);

		// get information for problem page
		ProblemBO problemBO = new ProblemBO();
		Problem problem=problemBO.getProblemBySubId(subId);
		challengesForm.setProblem(problem);

		// set info for submition with userId and subMit id and after show all
		SubmitBO submitBO = new SubmitBO();
		challengesForm.setSubmitList(submitBO.getAllSubmitOfUserWithSubId(
				userId, subId));
		// set infor for leaderbord with sub id
		LeaderBoardBO leaderBoardBO = new LeaderBoardBO();
		challengesForm.setLeaderList(leaderBoardBO
				.getAllLeaderbBoardBySubId(subId));

		// set editorial by submit id
		EditorialBO editorialBO = new EditorialBO();

		challengesForm.setEditorial(editorialBO.getAllEditorialBySubId(subId));
		
		/**
		 * khoi tao editor
		 */
		String run = request.getParameter("run");
		String editor = request.getParameter("editor");
		if (run == null) {
			// tao bien editor mirror code edittor
			
			challengesForm.setEditor("C++");
			
			challengesForm.setCodeSample(URLDecoder.decode("%23include+%3Ciostream%3E%0D%0Ausing+namespace+std%3B%0D%0A%0D%0Aint+main%28%29+%7B%0D%0A++++cout%3C%3C%22Helsdf+lo%22%3B%0D%0A++++for%28int+i%3D0%3Bi%3C10%3Bi%2B%2B%29%7B%0D%0A++++++++cout%3C%3Ci%2Ai%3C%3Cendl%3B%0D%0A++++%7D%0D%0A++++return+0%3B%0D%0A%7D"));
			if ("java".equals(editor)) {
				challengesForm.setEditor("JAVA");
				challengesForm.setCodeSample(URLDecoder.decode("import%20java.io.*%3B%0A%0Aclass%20myCode%0A%7B%0A%20%20%20%20public%20static%20void%20main%20(String%5B%5D%20args)%20throws%20java.lang.Exception%0A%20%20%20%20%7B%0A%20%20%20%20%20%20%20%20for(int%20i%3D0%3Bi%3C10%3Bi%2B%2B)System.out.println(%22Hello%20Java%22)%3B%0A%20%20%20%20%7D%0A%7D%0A"));
			}

			if ("python".equals(editor)) {
				challengesForm.setEditor("PYTHON");
				challengesForm.setCodeSample("python sample c++");
			}
		}else{
			 
			challengesForm.setEditor("C++");
			 
			if ("java".equals(editor)) {
				challengesForm.setEditor("JAVA");
			 
			}

			if ("python".equals(editor)) {
				challengesForm.setEditor("PYTHON");
				 
			}
			
		}
		/**
		 * end khoi tao editor
		 */
		

		/**
		 * run code hoac submit
		 */

		String submit = challengesForm.getSubmit();
		if (submit != null) {
			
			challengesForm.setRun("true");
			String codeSample = challengesForm.getCodeSample();
			String inputUser=challengesForm.getInputUser();
			
			if ("runCode".equals(submit)) {
				// runcode lay gia tri trong code sample xu ly
				
				
				String yourOutput="your output";
				
				if(inputUser==null){
					challengesForm.setInputTestCase(problem.getInputTestCase());
					challengesForm.setOutputTestCase(problem.getOutputTestCase());
				}else{
					challengesForm.setInputTestCase(inputUser);
					challengesForm.setOutputTestCase("inputUser");
				}
				
				challengesForm.setYourOutput(yourOutput);
				
			} else {
				// submit code
				System.out.println("submit code " + codeSample);

			}
			challengesForm.setCodeSample(codeSample);
		}

		/**
		 * end run code hoac submit
		 */

		return mapping.findForward("thanhCong");
	}

}
