package action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import dao.OrderDAO;
import vo.UserVO;
import vo.admin.admin_index_cellVO;
import vo.admin.admin_index_statusVO;

public class OrderAdminAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user_vo");
		if (obj == null) {
			return "Controller?type=adlogin";
		} else {
			UserVO vo = (UserVO)obj;
			if (vo.getAdmin().equals("0")) {
				return "Controller?type=adlogin";
			}
		}
		admin_index_statusVO vo = OrderDAO.admin_index_status();
		admin_index_cellVO[] cell_list = OrderDAO.admin_index_cell();

		request.setAttribute("status_vo", vo);
		request.setAttribute("cell_list", cell_list);

		return "/admin/order/order.jsp";
	}

}
