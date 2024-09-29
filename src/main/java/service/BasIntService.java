package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dao.BasketDAO;
import vo.BasketVO;
import vo.InterestVO;
import vo.UserVO;

public class BasIntService {

	public static void updateBasket(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("user_vo");

		List<BasketVO> bs_list =  BasketDAO.getList(uvo.getU_idx());
		session.removeAttribute("user_vo");
		uvo.setBasket_list(bs_list);
		session.setAttribute("user_vo",uvo);

	}


	public static void updateInterestBasket(HttpServletRequest request) {
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("user_vo");

		// 초기화
		for(BasketVO bvo: uvo.getBasket_list()) {
			bvo.setInterested(false);
		}

		// 관심상품에 있는 상품만 true로 변경
		if(uvo.getInterest_list() != null) {
			for(InterestVO ivo: uvo.getInterest_list()) {
				for(BasketVO bvo: uvo.getBasket_list()) {
					if(bvo.getPvo().getProduct_key().equals(ivo.getProduct_key())) {
						bvo.setInterested(true);
					}
				}
			}
		}
		session.setAttribute("user_vo", uvo);
	}


}
