package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDAO;

public class UpAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		  String b_idx = request.getParameter("b_idx");
		  String bc_key = request.getParameter("bc_key");
		  String cPage = request.getParameter("cPage");


          BbsDAO.up(b_idx);

		return "Controller?type=view&bc_key="+bc_key+"&cPage="+cPage+"&b_idx="+b_idx;
	}

}
