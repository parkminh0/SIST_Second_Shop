package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDAO;

public class FindInfoAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		String viewPath = "/user/account/find_info.jsp";

		String f_type = request.getParameter("f_type");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String info = request.getParameter("info");
		String changePw = request.getParameter("changePw");


		if(f_type != null) {
			String find_id = null;
			switch(info) {
			case "id":
				find_id = UserDAO.findInfo(name,email);
				request.setAttribute("result_id", find_id);
				break;
			case "pw":
				if(changePw != null) {
					int chk = UserDAO.changePw(id, changePw);
					if(chk > 0) {
						request.setAttribute("pw_change","Success");
					}
				} else {
					find_id = UserDAO.findInfo(name,email);
					if(find_id.equals(id)) {
						request.setAttribute("result_pw", "Success");
					} else {
						request.setAttribute("result_pw", "Fail");
					}
				}
			}


		}

		return viewPath;
	}

}
