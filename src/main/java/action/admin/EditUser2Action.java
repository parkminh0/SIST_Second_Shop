package action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.UserDAO;

public class EditUser2Action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 사용자 수정 Action
		String u_idx = request.getParameter("u_idx");
		String ug_idx = request.getParameter("ug_idx");
		String admin = request.getParameter("admin");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String addr_detail = request.getParameter("addr_detail");
		String zip_code = request.getParameter("zip_code");
		String sex = request.getParameter("sex");
		String btd = request.getParameter("btd");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String total_spend = request.getParameter("total_spend");
		String total_mile = request.getParameter("total_mile");
		String avail_mile = request.getParameter("avail_mile");
		String reg_dtm = request.getParameter("reg_dtm");
		String del = request.getParameter("del");
		String del_dtm = request.getParameter("del_dtm");
		String del_reason = request.getParameter("del_reason");
		
		// Null 값 처리
	    ug_idx = ug_idx.isEmpty() ? null : ug_idx;
	    admin = admin.isEmpty() ? null : admin;
	    id = id.isEmpty() ? null : id;
	    pw = pw.isEmpty() ? null : pw;
	    name = name.isEmpty() ? null : name;
	    addr = addr.isEmpty() ? null : addr;
	    addr_detail = addr_detail.isEmpty() ? null : addr_detail;
	    zip_code = zip_code.isEmpty() ? null : zip_code;
	    sex = sex.isEmpty() ? null : sex;
	    btd = btd.isEmpty() ? null : btd;
	    email = email.isEmpty() ? null : email;
	    phone = phone.isEmpty() ? null : phone;
	    total_spend = total_spend.isEmpty() ? null : total_spend;
	    total_mile = total_mile.isEmpty() ? null : total_mile;
	    avail_mile = avail_mile.isEmpty() ? null : avail_mile;
	    reg_dtm = reg_dtm.isEmpty() ? null : reg_dtm;
	    del = del.isEmpty() ? null : del;
	    del_dtm = del_dtm.isEmpty() ? null : del_dtm;
	    del_reason = del_reason.isEmpty() ? null : del_reason;
		
		
		
		
		
		UserDAO.editUser(u_idx, ug_idx, admin, id, pw, name, addr, addr_detail, zip_code, sex, btd, email, phone, avail_mile, total_spend, avail_mile, reg_dtm, del, del_dtm, del_reason);
		
		
		
		return "Controller?type=edituser&u_idx="+u_idx;
	}

}