package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import vo.UserVO;

public class ModifyAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("user_vo");
		if (uvo == null) {
			return "/user/account/needlogin.jsp";
		}
		
		String chk_modify = request.getParameter("chk_modify");
		if (chk_modify == null)
			return "/user/account/modify.jsp";

		String u_idx = request.getParameter("u_idx");
		String user_id = request.getParameter("u_id");
		String user_pw = request.getParameter("passwd");
		String name = request.getParameter("name");
		String zip_code = request.getParameter("zip_code");
		String addr1 = request.getParameter("addr");
		String addr2 = request.getParameter("addr_d");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String sex = request.getParameter("sex");
		String[] btd_list = request.getParameterValues("btd");
		String btd = null;
		try {
			btd = String.join("-", btd_list);
		} catch (Exception e) {

		}

		UserVO user_vo = UserDAO.modify(u_idx, user_id, user_pw, name, zip_code, addr1, addr2, phone, email, sex, btd);
		if (user_vo != null) {
			session.setAttribute("user_vo", user_vo);
		}
		return "/index.jsp";
	}

}
