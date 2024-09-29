package action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.BrandDAO;
import dao.CategoryDAO;
import dao.ProductDAO;
import vo.BrandVO;
import vo.CategoryVO;
import vo.UserVO;
import vo.admin.ProductCountVO;

public class ProductAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user_vo");
		if (obj == null) {
			return "Controller?type=adlogin";
		} else {
			UserVO vo = (UserVO)obj;
			if (vo.getAdmin().equals("0")) {
				return "Controller?type=adlogin";
			}
		}

		ProductCountVO pcvo = ProductDAO.countForAdmin();
		request.setAttribute("pcvo", pcvo);

		BrandVO[] brand_list = BrandDAO.getList();
		request.setAttribute("brand_list", brand_list);

		CategoryVO[] c_list = CategoryDAO.getList();
		request.setAttribute("c_list", c_list);

		return "/admin/product/product.jsp";
	}

}
