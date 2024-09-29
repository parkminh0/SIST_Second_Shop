package action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BbsDAO;
import vo.UserVO;


public class WriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		// bc_key이라는 파라미터 값 받기
		String bc_key = request.getParameter("bc_key");
		String viewPath = null;

		String enc_type = request.getContentType();

		if(enc_type == null) {
			HttpSession session = request.getSession();
			UserVO uvo = (UserVO) session.getAttribute("user_vo");
			if (uvo == null) {
				return "/user/account/needlogin.jsp";
			}
			viewPath = "bbs/board.jsp";
		}else if(enc_type.startsWith("multipart")) {
			try {
				//첨부된 파일이 저장될 곳을 절대경로로 만들어야 한다.
				ServletContext application = request.getServletContext();

				String realPath = application.getRealPath("/bbs/upload");

				MultipartRequest mr = new MultipartRequest(request, realPath, 5*1024*1024, "utf-8",new DefaultFileRenamePolicy());
				String title = mr.getParameter("title");

				// 해당 인자(u_idx)가 이름을 가져오기에
				// 현재 로그인된 유저 정보를 가져오고
				// 그 유저정보에 있는 u_idx를 가져옴
				HttpSession session = request.getSession();
				UserVO uvo = (UserVO) session.getAttribute("user_vo");
				String u_idx = uvo.getU_idx();

				String content = mr.getParameter("content");
				File f = mr.getFile("file");
				String fname = null;
				String oname = null;

				//만약! 파일첨부하지 않았다면 f에는 null이다.
				if(f != null) {
					fname = f.getName();// 현재 저장된 파일명

					//원래 파일명
					oname = mr.getOriginalFileName("file");
				}
				String b_idx = BbsDAO.add(title, u_idx, content, bc_key);

				if(fname != null && oname != null) {
					BbsDAO.addfile(b_idx, fname, oname);
				}
				String cPage = mr.getParameter("cPage");
				viewPath = "Controller?type=list&cPage="+cPage+"&bc_key="+bc_key;

			}catch(Exception e) {
				e.printStackTrace();
			}

		}

		return viewPath;
	}

}
