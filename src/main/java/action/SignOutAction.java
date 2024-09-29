package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;

public class SignOutAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// u_idx, del_reason
		String u_idx = request.getParameter("u_idx");
		String del_reason = request.getParameter("del_reason");

		UserDAO.del(u_idx, del_reason);

		HttpSession session = request.getSession();
		session.removeAttribute("user_vo");



		return "Controller?type=index";
	}

}
