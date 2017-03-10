package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Categories;
import model.bean.Menu;
import model.bo.CategoriesBO;
import model.bo.MenuBO;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import form.HomeForm;

public class HomeAction extends Action {
	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HomeForm homeForm = (HomeForm) form;
		System.out.println("home action");
		
		MenuBO menuBO=new MenuBO();
		CategoriesBO categoriesBO=new CategoriesBO();
		
		ArrayList<Menu> menuList=menuBO.getAllMenu();
		ArrayList<Categories> cateList=categoriesBO.getAllCategories();
		System.out.println("size "+cateList.size());
		
		homeForm.setMenuList(menuList);
		homeForm.setCateList(cateList);
		

		return mapping.findForward("thanhCong");
	}

}
