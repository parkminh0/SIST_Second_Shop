package action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BbsDAO;
import vo.BbsVO;


public class EditAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		try {
		String viewPath = null;
		// bc_key이라는 파라미터 값 받기
		String b_idx = request.getParameter("b_idx");
		String bc_key = request.getParameter("bc_key");
		String cPage = request.getParameter("cPage");
		String edit = request.getParameter("edit");



		if(edit == null) { //수정화면으로
			BbsVO[] b_ar = BbsDAO.view(b_idx);
			BbsVO bvo = b_ar[0];
			request.setAttribute("bvo", bvo);

			viewPath = "/bbs/board.jsp";

		} else { // 수정하기

			ServletContext application = request.getServletContext();
			String realPath = application.getRealPath("/upload");
			MultipartRequest mr = new MultipartRequest(request, realPath, 5*1024*1024, "utf-8",new DefaultFileRenamePolicy());
			String title = mr.getParameter("title");
			String content = mr.getParameter("content");

			File f = mr.getFile("file");

			String fname = null;
			String oname = null;

			if(f != null) {
				fname = f.getName();
				oname = mr.getOriginalFileName("file");
			}

			int chk1 = BbsDAO.edit(b_idx, title, content);
			int chk2 = BbsDAO.edit_bf(b_idx, fname, oname);
			viewPath = "Controller?type=view&b_idx="+b_idx+"&bc_key="+bc_key+"&cPage="+cPage;
		}




		return viewPath;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return "/bbs/board.jsp";
	}

}
