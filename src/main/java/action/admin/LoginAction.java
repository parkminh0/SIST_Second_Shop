package action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.UserDAO;
import vo.UserVO;

public class LoginAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String viewPath = "";

		String id = request.getParameter("user_id");
		String pw = request.getParameter("user_pw");

		// 로그인된 정보가 없을 시 login.jsp로 이동
		if (id == null)
			return "/admin/login.jsp";

		// login.jsp에서 로그인한 경우
		UserVO uvo = UserDAO.adminLogin(id,pw);

		if(uvo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user_vo", uvo);
			viewPath = "Controller?type=adindex";
		} else {
			viewPath= "/admin/login.jsp?fail=1";
		}
		return viewPath;
	}
}
