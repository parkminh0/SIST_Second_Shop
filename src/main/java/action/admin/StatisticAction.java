package action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.OrderDAO;
import dao.ProductDAO;
import vo.UserVO;
import vo.admin.statistic_mainVO;
import vo.admin.statistic_main_productVO;
import vo.admin.statistic_product_basketVO;

public class StatisticAction implements Action {

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
		
		statistic_mainVO svo = OrderDAO.statistic_main();
		statistic_main_productVO[] product_list = OrderDAO.statistic_main_product();
		statistic_product_basketVO[] basket_list = ProductDAO.statistic_product_basket_top();
		request.setAttribute("svo", svo);
		request.setAttribute("product_list", product_list);
		request.setAttribute("basket_list", basket_list);
		
		return "/admin/statistic/statistic.jsp";
	}

}
