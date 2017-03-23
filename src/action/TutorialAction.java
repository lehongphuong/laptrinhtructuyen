package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Response;
import model.bean.Status;
import model.bean.Tutorial;
import model.bean.User;
import model.bo.CategoriesBO;
import model.bo.StatusBO;
import model.bo.SubjectBO;
import model.bo.TutorialBO;
import model.bo.TutorialCodeBO;
import model.bo.UserBO;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import common.CompilerCode;
import common.MyCookie;
import form.TutorialsForm;

public class TutorialAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
	 
		TutorialsForm tf = (TutorialsForm) form;
		String cateId = request.getParameter("cateId");
		String menuId = request.getParameter("menuId");
		String tutId = request.getParameter("tutId");

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
			tf.setUserId(user.getUserId() + "");
			tf.setUsername(user.getUsername());
			tf.setPassword(user.getPassword());
			tf.setAvatar(user.getAvatar());
			tf.setUniversity(user.getUniversity());
			tf.setPoint(user.getPoint() + "");
			tf.setTypeUser(user.getTypeUser());
			// get du lieu cho rank dua vao point
			tf.setRank("" + userBO.getRankUserById(user.getUserId()));
		}
		tf.setStatusLogin(statusLogin);

		/**
		 * KET THUC LAY DU LIEU NGUOI DUNG
		 */

		// set du lieu cho form
		tf.setCateId(cateId);
		tf.setMenuId(menuId);
		// set list categories
		tf.setCateList(categoriesBO.getAllCategories());
		// set list tutorial
		TutorialBO tutorialBO = new TutorialBO();

		ArrayList<Tutorial> tutList = tutorialBO.getAllTutorialByCateId(cateId);
		tf.setTutList(tutList);
		if (tutList.size() > 0) {
			tf.setFirstTutId(tutList.get(0).getTuId() + "");
		}else{
			tf.setFirstTutId("0");
		}
		// get list tutorial code
		TutorialCodeBO tutorialCodeBO = new TutorialCodeBO();
		tf.setTutCodeList(tutorialCodeBO.getAllTutorialCodeByTutId(tutId));

		// tao bien editor mirror code edittor
		tf.setEditor("html");
		if ("7".equals(cateId)) {

			tf.setEditor("c++");
		}
		if ("8".equals(cateId)) {

			tf.setEditor("java");
		}
		if ("9".equals(cateId)) {
			tf.setEditor("python");
		}

		// compiler and run code
		String language = request.getParameter("language");
		String code = tf.getCode();

		if ("c++".equals(language)) {

		}
		if ("java".equals(language)) {

		}
		if ("python".equals(language)) {

		}

		tf.setRun("true");
		

		String result = "Hello World!";
		// bien dich code va dua vao class response
		// CompilerCode compilerCode=new CompilerCode(language, code, "");
		//
		// Response res=new Response(compilerCode.runCodeC());

		// if (code != null)
		// result = code;

		tf.setResult(result);

		return mapping.findForward("thanhCong");
	}

}
