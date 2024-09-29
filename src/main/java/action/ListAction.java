package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDAO;
import service.PagingService;
import util.Paging;
import vo.BbsVO;

public class ListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		//페이징 처리를 위한 객체생성

		PagingService.setPage(3, 3);

		Paging page = PagingService.getPage();

		String bc_key = request.getParameter("bc_key");
		//현재페이지값 받기
		String cPage = request.getParameter("cPage");

		//전체페이지 수를 구하기
		page.setTotalRecord(BbsDAO.getCount(bc_key));

		if(cPage != null) {

			page.setNowPage(Integer.parseInt(cPage));
			//이때!
			//게시물을 추출할 때 사용되는 begin과 end가 구해지고
			//시작페이지(startPage)와 끝페이지(endPage)도 구해졌다.
		}else
			page.setNowPage(1);

		BbsVO[] b_ar = BbsDAO.getList(
				bc_key, page.getBegin(), page.getEnd());

		//위의 배열 ar을 jsp에서 표현하기 위해 request에 저장하자
		request.setAttribute("b_ar", b_ar);
		request.setAttribute("page", page);

		return "/bbs/board.jsp";
	}

}
