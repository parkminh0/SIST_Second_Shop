<%@page import="service.BasIntService"%>
<%@page import="java.util.List"%>
<%@page import="vo.BasketVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="vo.InterestVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="vo.UserVO"%>
<%@page import="service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mode = request.getParameter("mode");
	String product_key = request.getParameter("product_key"); 
	UserVO uvo = (UserVO)session.getAttribute("user_vo");
	
	
	Date today = new Date();
	// 포맷 지정 후: 2022-11-16 19:15:44
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	if (uvo != null){
		InterestVO ivo = new InterestVO();
		ivo.setU_idx(uvo.getU_idx());
		ivo.setProduct_key(product_key);
		ivo.setCreate_dtm(dateFormat.format(today));
		
		SqlSession ss = FactoryService.getFactory().openSession();
		try {
			int result;
			switch (mode) {
			case "on":
				result = ss.insert("interest.add", ivo);
				if (result > 0){
					ss.commit();
					uvo.getInterest_list().add(ivo);
					session.removeAttribute("user_vo");
					session.setAttribute("user_vo", uvo);
					BasIntService.updateInterestBasket(request);
					
				} else {
					ss.rollback();
				}
				break;
			case "off":
				result = ss.delete("interest.delete", ivo);
				if (result > 0){
					ss.commit();
					for (int i = 0; i < uvo.getInterest_list().size(); i++){
						if (uvo.getInterest_list().get(i).getProduct_key().equals(product_key)){
							uvo.getInterest_list().remove(i);
							session.removeAttribute("user_vo");
							session.setAttribute("user_vo", uvo);
							BasIntService.updateInterestBasket(request);
							break;
						}
					}
				} else {
					ss.rollback();
				}
				break;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		
		ss.close();
	}
%>