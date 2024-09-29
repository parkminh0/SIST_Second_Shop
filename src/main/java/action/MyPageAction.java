package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MileDAO;
import dao.UserDAO;
import vo.OrderVO;
import vo.UserVO;

public class MyPageAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user_vo");
		if (obj == null) {
			return "/user/account/needlogin.jsp";
		} else {
			UserVO prev_uvo = (UserVO) obj;

			UserVO uvo = UserDAO.login(prev_uvo.getId(),prev_uvo.getPw());
			session.removeAttribute("user_vo");
			session.setAttribute("user_vo", uvo);

			//현재페이지값 받기
			String u_idx = uvo.getU_idx();

			getMiles(u_idx, uvo);

		}
		return "/user/myshop/myshop.jsp";
		}



	private void getMiles(String u_idx, UserVO uvo) {
		int total_mile = 0;
		int used_mile = 0;
		int unavail_mile = 0;

		int total_spend = 0;

		OrderVO[] o_ar =MileDAO.getWholeList(u_idx);
		if (o_ar != null && o_ar.length != 0) {
			for(OrderVO ovo: o_ar) {
				if(ovo.getConfirm().equals("0")) {
					total_spend += ovo.getPrimary_price();
				} else {
					total_spend += ovo.getFinal_price();
				}
				total_mile += Integer.parseInt(ovo.getMile());
				used_mile += Integer.parseInt(ovo.getUsedmile());
				if(ovo.getConfirm().equals("0")) {
					unavail_mile += Integer.parseInt(ovo.getMile());
				}
			}
		}

		uvo.setTotal_spend(String.valueOf(total_spend));
		uvo.setTotal_mile(String.valueOf(total_mile));
		uvo.setUsed_mile(used_mile);
		uvo.setUnavail_mile(unavail_mile);
		uvo.setAvail_mile(String.valueOf( total_mile - (used_mile + unavail_mile) ));
	}

}
