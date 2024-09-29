package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import util.Paging;
import vo.CouponlistVO;
import vo.UserVO;

public class MyCouponAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		Paging page = new Paging(3,3);
		String cPage = request.getParameter("cPage");
		String u_idx = request.getParameter("u_idx");
		//List<Object> ar = new ArrayList<>();

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user_vo");
		if (obj == null) {
			return "/user/account/needlogin.jsp";
		} else {
			UserVO uvo = (UserVO) obj;
			u_idx = uvo.getU_idx();
		}

		page.setTotalRecord(UserDAO.couponcount(u_idx));

		if(cPage != null) {
			page.setNowPage(Integer.parseInt(cPage));
		}else
			page.setNowPage(1);
		CouponlistVO[] couponlist = UserDAO.mycoupon(u_idx,page.getBegin(),page.getEnd());
		/*
		 * for(CouponlistVO cp : couponlist) { String c_idx = cp.getC_idx(); CouponVO[]
		 * car = UserDAO.mycouponlist(c_idx); ar.addAll(Arrays.asList(car));
		 * cp.setC_qty(cp.getC_qty()); ar.add(cp); }
		 */

		request.setAttribute("mc_ar", couponlist);
		request.setAttribute("u_idx", u_idx);
		request.setAttribute("page", page);

		return "user/myshop/myshop.jsp";
	}

}
