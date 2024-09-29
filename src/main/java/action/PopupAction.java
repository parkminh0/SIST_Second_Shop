package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ProductDAO;
import vo.ProductVO;

public class PopupAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String product_key = request.getParameter("product_key");
		String viewPath = null;

		if(product_key!=null) {
			HttpSession session = request.getSession();
			ProductVO pvo = ProductDAO.getProdctByKey(product_key);
			session.setAttribute("pvo", pvo);
			viewPath = "/shop/user/myshop/wish_list.jsp";
		}else {
			viewPath = "Controller?type=interest";
		}



		return viewPath;
	}

}
