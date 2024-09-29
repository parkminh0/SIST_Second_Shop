package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

public class SignUpAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String viewPath = null;
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String sex = request.getParameter("sex");
		String name = request.getParameter("name");
		String btd = request.getParameter("btd");
		String zip_code = request.getParameter("zip_code");
		String addr1 = request.getParameter("addr");
		String addr2 = request.getParameter("addr2");

		// 로그인된 정보가 없을 시 signup.jsp로 이동
		if (id == null)
			return "/user/account/SignUp.jsp";

		int cnt = UserDAO.signUp(id, pw, email, phone, name,addr1,addr2,sex,btd,zip_code);


		if(cnt>0) {
			viewPath = "Controller?type=login";
		}else {
			viewPath = "Controller?type=index";
		}

		return viewPath;
	}

}
