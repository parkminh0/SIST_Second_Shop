package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.BasIntService;
import vo.UserVO;

public class BasketAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("user_vo");
		if (uvo == null) {
			return "/user/account/needlogin.jsp";
		}
		BasIntService.updateBasket(request);

		BasIntService.updateInterestBasket(request);

		return "/user/myshop/myshop.jsp";
	}
}