package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;
import vo.UserVO;

public class OrderPageAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String u_idx = request.getParameter("u_idx");
		UserVO[] ar =  UserDAO.userinfo(u_idx);

		String c_idx = request.getParameter("c_idx");
		String isApply = request.getParameter("isApply");
	 	String max = request.getParameter("max");
	 	String min = request.getParameter("min");
	 	String d_price = request.getParameter("d_price");
	 	String d_type = request.getParameter("d_type");

	 	if(d_price != null && d_type == null) {
	 		d_price = String.valueOf(Integer.valueOf(d_price)*0.01);
	 	}

	 	request.setAttribute("c_idx", c_idx);
	 	request.setAttribute("isApply", isApply);
	 	request.setAttribute("max", max);
	 	request.setAttribute("min", min);
	 	request.setAttribute("d_price", c_idx);
		request.setAttribute("ar", ar);

		return "/order/orderpage.jsp";
	}

}