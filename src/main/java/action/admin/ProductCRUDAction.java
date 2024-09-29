package action.admin;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.ProductDAO;
import vo.CategoryVO;
import vo.ProductVO;
import vo.UserVO;

public class ProductCRUDAction implements Action {

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

		String product_key = request.getParameter("product_key");
		if (product_key != null) {
			request.setAttribute("mode", "edit");
			ProductVO pvo = ProductDAO.getProdctByKey(product_key);
			request.setAttribute("pvo", pvo);

			ServletContext application = request.getServletContext();
			Object tmp = application.getAttribute("category_list");
			CategoryVO[] c_list = (CategoryVO[])tmp;

			for(CategoryVO cvo:c_list) {
				if (cvo.getCategory_key().equals(pvo.getCategory_key())) {
					request.setAttribute("nowcate", cvo);
					request.setAttribute("cate1", cvo);
					return "/admin/product/crudProduct.jsp";
				}
				if (cvo.getCategory_list() != null) {
					for(CategoryVO cvo_2:cvo.getCategory_list()) {
						if (cvo_2.getCategory_key().equals(pvo.getCategory_key())) {
							request.setAttribute("nowcate", cvo_2);
							request.setAttribute("cate1", cvo);
							request.setAttribute("cate2", cvo_2);
							request.setAttribute("cate2_list", cvo.getCategory_list());
							return "/admin/product/crudProduct.jsp";
						}
						if (cvo_2.getCategory_list() != null) {
							for(CategoryVO cvo_3:cvo_2.getCategory_list()) {
								if (cvo_3.getCategory_key().equals(pvo.getCategory_key())) {
									request.setAttribute("nowcate", cvo_3);
									request.setAttribute("cate1", cvo);
									request.setAttribute("cate2", cvo_2);
									request.setAttribute("cate3", cvo_3);
									request.setAttribute("cate2_list", cvo.getCategory_list());
									request.setAttribute("cate3_list", cvo_2.getCategory_list());
									return "/admin/product/crudProduct.jsp";
								}
							}
						}
					}
				}
			}

		}

		return "/admin/product/crudProduct.jsp";
	}

}
