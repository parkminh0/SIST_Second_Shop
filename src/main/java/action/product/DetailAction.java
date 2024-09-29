package action.product;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.ProductDAO;
import vo.CategoryVO;
import vo.ProductVO;

public class DetailAction implements Action {



	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String product_key = request.getParameter("product");
		ProductVO pvo = ProductDAO.getProdctByKey(product_key);
		request.setAttribute("product_vo", pvo);
		HttpSession session = request.getSession();

		 // 세션에서 p_list를 가져오기
        List<ProductVO> p_list = (List<ProductVO>) session.getAttribute("p_list");
        if (p_list == null) {
            p_list = new ArrayList<>();
            session.setAttribute("p_list", p_list);
        }

        // 상품이 p_list에 있는지 확인
        boolean isProductInList = false;
        for (ProductVO product : p_list) {
            if (product.getProduct_key().equals(pvo.getProduct_key())) {
                isProductInList = true;
                break;
            }
        }

        // 상품이 p_list에 없으면 조회수 증가 및 p_list에 추가
        if (!isProductInList) {
            ProductDAO.ViewQtyUp(product_key);
            p_list.add(pvo);
        }



		ServletContext application = request.getServletContext();
		Object obj = application.getAttribute("category_list");
		CategoryVO[] c_list = (CategoryVO[])obj;

		for(CategoryVO cvo:c_list) {
			if (cvo.getCategory_key().equals(pvo.getCategory_key())) {
				request.setAttribute("nowcate", cvo);
				request.setAttribute("cate1", cvo);


				return "/product/detail.jsp";
			}
			if (cvo.getCategory_list() != null) {
				for(CategoryVO cvo_2:cvo.getCategory_list()) {
					if (cvo_2.getCategory_key().equals(pvo.getCategory_key())) {
						request.setAttribute("nowcate", cvo_2);
						request.setAttribute("cate1", cvo);
						request.setAttribute("cate2", cvo_2);
						return "/product/detail.jsp";
					}
					if (cvo_2.getCategory_list() != null) {
						for(CategoryVO cvo_3:cvo_2.getCategory_list()) {
							if (cvo_3.getCategory_key().equals(pvo.getCategory_key())) {
								request.setAttribute("nowcate", cvo_3);
								request.setAttribute("cate1", cvo);
								request.setAttribute("cate2", cvo_2);
								request.setAttribute("cate3", cvo_3);
								return "/product/detail.jsp";
							}
						}
					}
				}
			}
		}

		return "/product/detail.jsp";
	}
}
