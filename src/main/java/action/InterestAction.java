package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.InterestDAO;
import service.PagingService;
import util.Paging;
import vo.InterestVO;
import vo.ProductVO;
import vo.UserVO;

public class InterestAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("user_vo");
		if (uvo == null) {
			return "/user/account/needlogin.jsp";
		}

		String viewPath = null;
		
		//현재페이지값 받기
		String cPage = request.getParameter("cPage");

		//전체페이지 수를 구하기
        PagingService.setPage(5, 5);

		Paging page = PagingService.getPage();
		
		String u_idx = uvo.getU_idx();
		
		List<InterestVO> ivo = InterestDAO.getInterKey(u_idx);
		
		page.setTotalRecord(ivo.size());

		if(cPage != null) {

			page.setNowPage(Integer.parseInt(cPage));
			//이때!
			//게시물을 추출할 때 사용되는 begin과 end가 구해지고
			//시작페이지(startPage)와 끝페이지(endPage)도 구해졌다.
		} else {
			page.setNowPage(1);
		}

        List<ProductVO> p_list = InterestDAO.search2(u_idx, page.getBegin(), page.getEnd());

        session.setAttribute("p_list", p_list);
        request.setAttribute("page", page);

        viewPath = "/user/myshop/wish_list.jsp";
        
		return viewPath;
	}
}
