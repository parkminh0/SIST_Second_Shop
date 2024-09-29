package action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BasketDAO;
import dao.OrderDAO;
import dao.UgradeDAO;
import dao.UserDAO;
import vo.BasketVO;
import vo.ProductVO;

public class OrderSuccessAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    response.setCharacterEncoding("UTF-8");
		String u_idx = request.getParameter("u_idx");
		String delivery_msg = request.getParameter("delivery_msg");
		String delivery_price = request.getParameter("delivery_price");
		String d_price = request.getParameter("d_price");
		String destination = request.getParameter("destination");
		String receiver = request.getParameter("receiver");
		String zip_code = request.getParameter("zip_code");
		String receiver_tel = request.getParameter("receiver_tel");
		String order_qty = request.getParameter("order_qty");
		String primary_price = request.getParameter("final_price");
		String final_price = request.getParameter("final_price");
		String mile = null;
		if(u_idx != null) {
		String ug_idx = UserDAO.usermile(u_idx)[0].getUg_idx();
		String grade = UgradeDAO.searchUgrade(ug_idx)[0].getGrade();
		String ratio_mile = UgradeDAO.searchUgrade(ug_idx)[0].getRatio_mile();
		mile = String.valueOf(Double.parseDouble(ratio_mile)*Double.parseDouble(primary_price)/100);
		String path = null;
			if(u_idx != null && final_price != null) {
				int cnt = OrderDAO.saveOrder(u_idx, "2", delivery_price, delivery_msg, grade, ratio_mile, mile, "0", 
						d_price, "1", destination, receiver, zip_code, receiver_tel, order_qty, primary_price, final_price);
			}
		}
		String optionKeysParam = request.getParameter("option_keys");
		String[] optionKeys = optionKeysParam.split(",");
		String bQtysParam = request.getParameter("b_qtys");
		String[] bQtys = bQtysParam.split(",");

		//임시
		String c_idx = "1";

		for (int i = 0; i < optionKeys.length; i++) {
			int j = 0;
			ProductVO[] pvo = OrderDAO.searchprodinfo(optionKeys[j]);
			OrderDAO.saveOrderdetail(String.valueOf((OrderDAO.searchorderkey(0))) , optionKeys[j], "2", c_idx, mile, d_price, bQtys[i], pvo[j].getOri_price(), pvo[j].getCell_price());
			j++;
	    }
		

		List<BasketVO> basket_list =  BasketDAO.getList(u_idx);
		for (BasketVO bvo : basket_list) {
		    for (int i = 0; i < optionKeys.length; i++) {
		        if (bvo.getOption_key().equals(optionKeys[i])) {
		        	if(Integer.parseInt(bvo.getB_qty()) > Integer.parseInt(bQtys[i].trim())) {
		        		BasketDAO.descbasket(bvo.getBasket_key(), bQtys[i].trim());
		        	}else {
		            BasketDAO.deletebasket(bvo.getBasket_key());
		        }
		    }
		}



	}
		return "order/toss/success.jsp";
}
}
