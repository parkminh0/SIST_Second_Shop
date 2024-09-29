package action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.UgradeDAO;
import dao.UserDAO;
import vo.UgradeVO;
import vo.UserVO;
import vo.admin.UserCountVO;

public class UserAction implements Action {

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

		UserCountVO ucvo = UserDAO.countForAdmin();
		request.setAttribute("ucvo", ucvo);

		UgradeVO[] ugvo_list = UgradeDAO.getList();
		request.setAttribute("ugvo_list", ugvo_list);

		return "/admin/user/user.jsp";
	}

}
