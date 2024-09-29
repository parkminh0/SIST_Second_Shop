package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDAO;
import vo.BbsVO;

public class DelAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String b_idx = request.getParameter("b_idx");
		String bc_key = request.getParameter("bc_key");
		String cPage = request.getParameter("cPage");


		String c_idx = request.getParameter("c_idx");

		String viewpath = "";

		if(c_idx == null || c_idx.length() == 0) {
			int chk = BbsDAO.del(b_idx);
			viewpath = "Controller?type=bbs&cPage="+cPage+"&bc_key="+bc_key;
			if(chk < 1) { // 삭제 실패시 view로 다시
				BbsVO[] ar = BbsDAO.view(b_idx);
				request.setAttribute("ar", ar);
				viewpath = "/bbs/view.jsp";
			}
		} else {
			int chk = BbsDAO.delComm(c_idx);
			viewpath = "Controller?type=view&cPage="+cPage+"&bc_key="+bc_key+"&b_idx="+b_idx;
		}

		return viewpath;
	}

}
