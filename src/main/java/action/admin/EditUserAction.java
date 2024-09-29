package action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.UserDAO;
import vo.UserVO;

public class EditUserAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String u_idx = request.getParameter("u_idx");
		UserVO u_vo = UserDAO.user(u_idx);
		HttpSession session = request.getSession();
			
		if(u_vo!=null) {
			session.setAttribute("u_vo", u_vo);	
		}
		
		return "/admin/user/editUser.jsp";
	}

}
