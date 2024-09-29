package action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BbsDAO;
import vo.BbsVO;

public class ViewAction implements Action {
	List<BbsVO> r_list;

	public boolean checkBbs(BbsVO vo) {
		boolean value = true;

		for(BbsVO bvo: r_list) {
			if(bvo.getB_idx().equals(vo.getB_idx())) {
				value = false;
			}
		}

		return value;
	}

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();

		Object obj = session.getAttribute("read_list");
		if(obj == null) {
			r_list = new ArrayList<>();
			// 생성된 리스트를 세션에 저장
			session.setAttribute("read_list", r_list);
		} else {
			r_list = (ArrayList<BbsVO>) obj;
		}


		String b_idx = request.getParameter("b_idx");
		BbsVO[] sear = BbsDAO.view(b_idx);
		request.setAttribute("sear", sear);
		BbsVO bvo = sear[0];
		if(bvo != null) {
			if(checkBbs(bvo)) {
				BbsDAO.hitInc(b_idx); // 조회수 증가
				r_list.add(bvo);	// 다음에 읽기를 수행할 때
									// 조회수를 증가시키지않도록
									// r_list에 추가시켜준다.
			}
			request.setAttribute("bvo", bvo);
		}

		return "/bbs/board.jsp";
	}

}
