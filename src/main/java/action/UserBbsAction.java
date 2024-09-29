package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BbsDAO;
import util.Paging;
import vo.BbsVO;
import vo.UserVO;

public class UserBbsAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//페이징 처리를 위한 객체생성

		Paging page = new Paging(3, 3);

		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("user_vo");
		if(uvo == null) {
			return "/user/account/needlogin.jsp";
		}

		String u_idx = uvo.getU_idx();
		//현재페이지값 받기
		String cPage = request.getParameter("cPage");
		//전체페이지 수를 구하기
		page.setTotalRecord(BbsDAO.userbbscount(u_idx));
		if(cPage != null) {

			page.setNowPage(Integer.parseInt(cPage));

		}else
			page.setNowPage(1);

		BbsVO[] ub_ar = BbsDAO.usergetList(u_idx, page.getBegin(), page.getEnd());

		//위의 배열 ar을 jsp에서 표현하기 위해 request에 저장하자
		request.setAttribute("ub_ar", ub_ar);
		request.setAttribute("page", page);

		return "/bbs/board.jsp";
	}

}
