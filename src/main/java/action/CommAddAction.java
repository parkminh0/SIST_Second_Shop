package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDAO;

public class CommAddAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String b_idx = request.getParameter("b_idx");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		String bc_key = request.getParameter("bc_key");
		String cPage = request.getParameter("cPage");

		BbsDAO.reply(writer, content, b_idx);
		return "Controller?type=view&b_idx="+b_idx+"&bc_key="+bc_key+"&cPage="+cPage;
	}

}
