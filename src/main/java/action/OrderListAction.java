package action;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.OrderListDAO;
import dao.UserDAO;
import service.BasIntService;
import service.PagingService;
import util.Paging;
import vo.OrderDetailVO;
import vo.OrderStatusVO;
import vo.OrderVO;
import vo.UserVO;

public class OrderListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user_vo");
		if (obj == null) {
			return "/user/account/needlogin.jsp";
		}


		UserVO prev_uvo = (UserVO) obj;

		UserVO uvo = UserDAO.login(prev_uvo.getId(),prev_uvo.getPw());
		session.removeAttribute("user_vo");
		session.setAttribute("user_vo", uvo);

		BasIntService.updateInterestBasket(request);

		PagingService.setPage(4, 3);

		Paging page = PagingService.getPage();

		//현재페이지값 받기
		String cPage = request.getParameter("cPage");
		if(cPage == "" || cPage == null) {
			cPage = "1";
		}
		request.setAttribute("cPage", cPage);
		
		String selBd = request.getParameter("selBd");
		if(selBd == "" || selBd == null) {
			selBd = "2";
		}
		request.setAttribute("selBd", selBd);
		
		String listType = "";
		
		if(request.getParameter("listType") == null) {
			Object listTypeObj = request.getAttribute("listType");
			
			if(listTypeObj == null || listTypeObj == "") {
				listType = "1";
			} else {
				listType = (String)listTypeObj;
			}
	
			request.setAttribute("listType",listType);
		} else {
			listType = request.getParameter("listType");
		}
		
		
		
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		
		
		if(start_date == null || start_date.equals("")) {
			LocalDate endDate = LocalDate.now();
			end_date = endDate.toString();
			LocalDate startDate = endDate.minusDays(7);
			start_date = startDate.toString();

		} 
			request.setAttribute("start_date",start_date);
			request.setAttribute("end_date",end_date);

		
		List<OrderVO> o_list = new ArrayList<>();
		
		int totalSize = 0;
		//전체페이지 수를 구하기
//		for(OrderVO ovo: uvo.getOrder_list()){
//			if(ovo.getOrder_changed_qty() > 0) {
//				o_list.add(ovo);
//				totalSize ++;
//			}
//		}
		
		String keyword = null;
		OrderVO[] o_ar_og = null;
		
		switch(listType) {
		case "1":
			keyword = request.getParameter("delivery_key");
			
			if(keyword == null ) {
				keyword = "0";
				request.setAttribute("delivery_key", keyword);
			}
			o_ar_og = OrderListDAO.getOlOd(uvo.getU_idx(), keyword, start_date, end_date);
			
			break;
		case "2":
			keyword = request.getParameter("os_option");
			if(keyword == null) {
				keyword = "0";
				request.setAttribute("os_option", keyword);
			}
			o_ar_og = OrderListDAO.getOlOs(uvo.getU_idx(), keyword, start_date, end_date);
		}
		if(o_ar_og != null) {
			totalSize = o_ar_og.length;
			page.setTotalRecord(totalSize);
		} else {
			page.setTotalRecord(0);
		}
		
		if(cPage != null) {

			page.setNowPage(Integer.parseInt(cPage));
			//이때!
			//게시물을 추출할 때 사용되는 begin과 end가 구해지고
			//시작페이지(startPage)와 끝페이지(endPage)도 구해졌다.
		} else {
			page.setNowPage(1);
		}
		
		OrderVO[] o_ar = null;
		int resultNum = 0;
		
		if(o_ar_og != null) {
			o_ar = Arrays.copyOfRange(o_ar_og, page.getBegin()-1, page.getEnd());
			resultNum = o_ar_og.length;
		}

		if(listType.equals("1")) {
			request.setAttribute("resultNum_1", resultNum);
			request.setAttribute("resultNum_2", 0);
		} else {
			request.setAttribute("resultNum_1", 0);
			request.setAttribute("resultNum_2", resultNum);
		}
		
		
		
//		if(o_list.size()>0) {
//			OrderVO[] o_ar = new OrderVO[page.getEnd() - page.getBegin() +1];
//			o_list.subList(page.getBegin()-1, page.getEnd()).toArray(o_ar);
//			request.setAttribute("o_ar", o_ar);
//		} else {
//			request.setAttribute("o_ar", null);
//		}
		request.setAttribute("o_ar", o_ar);
		
//		request.setAttribute("od_ar", od_ar);
//		request.setAttribute("os_ar", os_ar);
		
		request.setAttribute("page", page);

		return "/user/myshop/myshop.jsp";
	}
}