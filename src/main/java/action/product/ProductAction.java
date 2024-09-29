package action.product;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.ProductDAO;
import util.Paging;
import vo.CategoryVO;
import vo.ProductVO;

public class ProductAction implements Action {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String category_key = request.getParameter("category");
		String orderby = request.getParameter("orderby");
		String depth = request.getParameter("depth");

		ServletContext application = request.getServletContext();
		CategoryVO[] c_list = (CategoryVO[])application.getAttribute("category_list");

		Paging page = new Paging(16, 5);
		String cPage = request.getParameter("cPage");
		//전체페이지 수를 구하기
		page.setTotalRecord(ProductDAO.getProductCount(category_key, depth));
		if(cPage != null) {
			page.setNowPage(Integer.parseInt(cPage));
		} else {
			page.setNowPage(1);
		}

		ProductVO[] p_list = ProductDAO.getProdctByCategory(category_key, orderby, depth, page.getBegin(), page.getEnd());
		HttpSession session = request.getSession();
		session.setAttribute("orderby", orderby);
		request.setAttribute("product_list", p_list);
		request.setAttribute("page", page);
		for(CategoryVO cvo:c_list) {
			if (cvo.getCategory_key().equals(category_key)) {
				request.setAttribute("nowcate", cvo);
				request.setAttribute("cate1", cvo);
				request.setAttribute("depth", "1");
				return "/product/product.jsp";
			}
			if (cvo.getCategory_list() != null) {
				for(CategoryVO cvo_2:cvo.getCategory_list()) {
					if (cvo_2.getCategory_key().equals(category_key)) {
						request.setAttribute("nowcate", cvo_2);
						request.setAttribute("cate1", cvo);
						request.setAttribute("cate2", cvo_2);
						request.setAttribute("depth", "2");
						return "/product/product.jsp";
					}
					if (cvo_2.getCategory_list() != null) {
						for(CategoryVO cvo_3:cvo_2.getCategory_list()) {
							if (cvo_3.getCategory_key().equals(category_key)) {
								request.setAttribute("nowcate", cvo_3);
								request.setAttribute("cate1", cvo);
								request.setAttribute("cate2", cvo_2);
								request.setAttribute("cate3", cvo_3);
								request.setAttribute("depth", "3");
								return "/product/product.jsp";
							}
						}
					}
				}
			}
		}
		return "/product/product.jsp";
	}

}