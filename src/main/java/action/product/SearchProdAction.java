package action.product;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.ProductDAO;
import service.PagingService;
import util.Paging;
import vo.ProductVO;

public class SearchProdAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String keyword = request.getParameter("keyword");
		PagingService.setPage(9, 3);
		Paging page = PagingService.getPage();
		String cPage = request.getParameter("cPage");
		//전체페이지 수를 구하기
		page.setTotalRecord(ProductDAO.getSearchProductCount(keyword));
		if(cPage != null) {
			page.setNowPage(Integer.parseInt(cPage));
		} else {
			page.setNowPage(1);
		}


		ProductVO[] p_list = ProductDAO.getProdctByKeyword(keyword, page.getBegin(), page.getEnd());
		HttpSession session = request.getSession();
		request.setAttribute("product_list", p_list);
		request.setAttribute("page", page);



		return "/product/productSearch.jsp";
	}
}
