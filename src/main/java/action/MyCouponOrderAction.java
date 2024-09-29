package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import service.PagingService;
import util.Paging;
import vo.CouponlistVO;

public class MyCouponOrderAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		

		return "order/mycouponorder.jsp";
	}

}
