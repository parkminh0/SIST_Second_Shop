package action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BbsDAO;
import vo.BbsVO;
import vo.BoardCategoryVO;

public class FullListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		BbsVO[] vvar = null;
		BoardCategoryVO[] vvar2 = null;
		vvar2 = BbsDAO.bbscategorysearch();
		if (vvar2 != null && vvar2.length != 0) {
			List<BbsVO> list = new ArrayList<>();
			for(int i = 1; i<=vvar2.length; i++) {
				BbsVO[] bar = BbsDAO.fulllist(String.valueOf(i));
				list.addAll(Arrays.asList(bar));
			}
			
			vvar = list.toArray(new BbsVO[0]);
		}
		
		request.setAttribute("vvar", vvar);
		request.setAttribute("vvar2", vvar2);

		return "/bbs/fulllist.jsp";
	}

}
