package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BbsAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String bc_key = request.getParameter("bc_key");
		String viewpath = "Controller?type=list";
		if(bc_key == null || bc_key.length()==0) {
			viewpath += "&bc_key=1";
		} else {
			viewpath += "&bc_key="+bc_key;
		}


		return viewpath;
	}

}
