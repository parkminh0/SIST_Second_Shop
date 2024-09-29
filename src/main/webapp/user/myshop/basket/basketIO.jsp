<%@page import="service.BasIntService"%>
<%@page import="vo.BasketVO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="vo.InterestVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="vo.UserVO"%>
<%@page import="service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   		pageEncoding="UTF-8"%>
<%
	String incDec = request.getParameter("incDec");
	String basket_key = request.getParameter("basket_key"); 
	UserVO uvo = (UserVO)session.getAttribute("user_vo");
	String option_key= request.getParameter("option_key");
	
	
	
	if (uvo != null){
		SqlSession ss = FactoryService.getFactory().openSession();
		try {
			int result;
			
			HashMap<String, String> map = new HashMap<>();
			map.put("basket_key", basket_key);
			
			switch (incDec) {
			case "up":
				map.put("change", "1");
				break;
			case "down":
				map.put("change", "-1");
				break;
			}
			result = ss.update("basket.changeCnt",map);
			if (result > 0){
				ss.commit();

				List<BasketVO> basket_list = ss.selectList("basket.search",uvo.getU_idx());
				uvo.setBasket_list(basket_list);
				BasIntService.updateInterestBasket(request);
				
				
			} else {
				ss.rollback();
			}
			
		} catch (Exception e){
			e.printStackTrace();
		}
		
		ss.close();
	}
%>
