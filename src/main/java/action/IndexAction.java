package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.IndexDAO;
import vo.ProductVO;
import vo.UserVO;

public class IndexAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		List<ProductVO> nr_list = IndexDAO.getNR_list();
		List<ProductVO> n_list = IndexDAO.getN_list();
		List<ProductVO> r_list = IndexDAO.getR_list();


		request.setAttribute("nr_list", nr_list);
		request.setAttribute("n_list", n_list);
		request.setAttribute("r_list", r_list);
		Object obj = request.getSession().getAttribute("user_vo");
		if(obj != null) {

			UserVO uvo = (UserVO) obj;

			String u_idx = uvo.getU_idx();
			List<ProductVO> bs_list = IndexDAO.getBS_list(u_idx);
			List<ProductVO> in_list = IndexDAO.getIN_list(u_idx);

			request.setAttribute("bs_list", bs_list);
			request.setAttribute("in_list", in_list);
		}


		return "/index.jsp";
	}

}
