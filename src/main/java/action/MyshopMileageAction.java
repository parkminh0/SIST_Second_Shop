package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MileDAO;
import service.PagingService;
import util.Paging;
import vo.OrderVO;
import vo.UserVO;

public class MyshopMileageAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user_vo");
		if (obj == null) {
			return "/user/account/needlogin.jsp";
		} else {
			UserVO uvo = (UserVO) obj;
			PagingService.setPage(4, 3);
			Paging page = PagingService.getPage();
			//현재페이지값 받기
			String cPage = request.getParameter("cPage");
			String getMile = request.getParameter("getMile");
			String tab_type = request.getParameter("tab_type");


			String u_idx = uvo.getU_idx();
			int tabType = 1;


			//전체페이지 수를 구하기
			if(tab_type == null || tab_type.equals("history")) {
				tabType = 1;
			} else if(tab_type.equals("unavail")) {
				tabType = 0;
			}


			page.setTotalRecord(MileDAO.getCount(u_idx, tabType));


			if(cPage != null) {

				page.setNowPage(Integer.parseInt(cPage));
				//이때!
				//게시물을 추출할 때 사용되는 begin과 end가 구해지고
				//시작페이지(startPage)와 끝페이지(endPage)도 구해졌다.
			} else {
				page.setNowPage(1);
			}

			OrderVO[] mile_ar = MileDAO.getList(
					u_idx, page.getBegin(), page.getEnd(), tabType);


			if(getMile == null) {
				getMiles(u_idx, uvo);
			}

			//위의 배열 ar을 jsp에서 표현하기 위해 request에 저장하자
			request.setAttribute("mile_ar", mile_ar);
			request.setAttribute("page", page);


		}
		return "/user/myshop/myshop.jsp";
		}



	private void getMiles(String u_idx, UserVO uvo) {
		int total_mile = 0;
		int used_mile = 0;
		int unavail_mile = 0;

		int total_spend = 0;

		OrderVO[] o_ar =MileDAO.getWholeList(u_idx);
		if (o_ar != null && o_ar.length != 0) {
			for(OrderVO ovo: o_ar) {
				if(ovo.getConfirm().equals("0")) {
					total_spend += ovo.getPrimary_price();
				} else {
					total_spend += ovo.getFinal_price();
				}
				total_mile += Integer.parseInt(ovo.getMile());
				used_mile += Integer.parseInt(ovo.getUsedmile());
				if(ovo.getConfirm().equals("0")) {
					unavail_mile += Integer.parseInt(ovo.getMile());
				}
			}
		}

		uvo.setTotal_spend(String.valueOf(total_spend));
		uvo.setTotal_mile(String.valueOf(total_mile));
		uvo.setUsed_mile(used_mile);
		uvo.setUnavail_mile(unavail_mile);
		uvo.setAvail_mile(String.valueOf( total_mile - (used_mile + unavail_mile) ));
	}

}
