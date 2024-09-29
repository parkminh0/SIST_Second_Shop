package action.admin;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.CouponDAO;
import dao.ProductDAO;
import vo.CategoryVO;
import vo.CouponVO;
import vo.ProductVO;
import vo.UserVO;

public class CouponAddAction implements Action {

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
			
			
		String c_idx = request.getParameter("c_idx");
		if (c_idx != null) {
			request.setAttribute("mode", "edit");
			CouponVO cvo = CouponDAO.getCouponByKey(c_idx);
			request.setAttribute("cvo", cvo);
			request.setAttribute("c_idx", cvo.getC_idx());
			
		
			
				}
			}
		return "/admin/coupon/addcoupon.jsp";
		}

	}
