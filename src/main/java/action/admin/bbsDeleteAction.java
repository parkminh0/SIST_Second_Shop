package action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.BbsDAO;

public class bbsDeleteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bc_key = request.getParameter("bc_key");
		String[] bckeys = bc_key.split(",");
		
		for(int i = 0; i<bckeys.length; i++) {
			BbsDAO.bbsdelete(bc_key);
		}
		
		return "/admin/bbs/bbs.jsp";
	}
}
