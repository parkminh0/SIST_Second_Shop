package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDAO;
import util.Paging;
import vo.BbsVO;

public class SearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		//페이징 처리를 위한 객체생성

		Paging page = new Paging(3, 3);

		String bc_key = request.getParameter("bc_key");
		//현재페이지값 받기
		String cPage = request.getParameter("cPage");
		String keyword = request.getParameter("keyword");
		String searchType = request.getParameter("searchType");
	
		//전체페이지 수를 구하기
		page.setTotalRecord(BbsDAO.getSearchCount(bc_key,searchType, keyword));

		if(cPage != null) {

			page.setNowPage(Integer.parseInt(cPage));
			//이때!
			//게시물을 추출할 때 사용되는 begin과 end가 구해지고
			//시작페이지(startPage)와 끝페이지(endPage)도 구해졌다.
		}else {
			page.setNowPage(1);
			}

		BbsVO[] ar = BbsDAO.getSearch(
				bc_key, searchType, keyword, page.getBegin(), page.getEnd());

		//위의 배열 ar을 jsp에서 표현하기 위해 request에 저장하자
		request.setAttribute("s_ar", ar);
		request.setAttribute("s_page", page);


		return "/bbs/board.jsp";
	}

}
