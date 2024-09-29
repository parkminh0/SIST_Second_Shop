package control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import dao.CategoryDAO;


/**
 * Servlet implementation class Controller
 */
@WebServlet(
		urlPatterns = { "/Controller" },
		initParams = {
				@WebInitParam(name = "myParam", value = "/WEB-INF/action.properties")
		})
public class Controller extends HttpServlet {
private static final long serialVersionUID = 1L;

	private HashMap<String, Action> actionMap;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        actionMap = new HashMap<>();
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	@Override
	public void init() throws ServletException {
		// properties 파일 절대경로 얻기
		String props_path = getInitParameter("myParam");
		ServletContext application = getServletContext();
		String realPath = application.getRealPath(props_path);
		// Properties 객체 안에 파일 내용 저장
		Properties prop = new Properties();
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(realPath);
			prop.load(fis);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Iterator<Object> it = prop.keySet().iterator();
		while(it.hasNext()) {
			String key = (String)it.next();
			String value = prop.getProperty(key);
			try {
				Object obj = Class.forName(value).newInstance();
				actionMap.put(key, (Action)obj);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 카테고리 1회 생성
		application.setAttribute("category_list", CategoryDAO.getList());
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String type = request.getParameter("type");
		if(type == null) {
			type = "index";
		}

		Action action = actionMap.get(type);
		String viewPath = action.execute(request, response);
		RequestDispatcher disp = request.getRequestDispatcher(viewPath);
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
