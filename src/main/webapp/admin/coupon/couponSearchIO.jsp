<%@page import="util.Paging"%>
<%@page import="service.PagingService"%>
<%@page import="service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dao.CouponDAO"%>
<%@page import="vo.CouponVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
		
		session = request.getSession();
		String c_name = request.getParameter("c_name");
		String d_type = request.getParameter("d_type");
		String issue_sort = request.getParameter("issue_sort");
		String category_key = request.getParameter("category_key");	
		String issue_at = request.getParameter("issue_at");
		String cPage = request.getParameter("cPage");
		
		if (cPage == null || cPage.equals("0") || cPage.equals("")) {
	        cPage = "1";
	    }
		
		Map<String, String> map = new HashMap<>();
		map.put("c_name", c_name);
		map.put("d_type", d_type);
		map.put("issue_sort", issue_sort);
		map.put("category_key", category_key);
		map.put("issue_at", issue_at);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		Paging p = new Paging(5, 3);
		
		//전체페이지 수를 구하기
		p.setTotalRecord(CouponDAO.searchForAdminPaging(map));

		if(cPage != null && !cPage.equals("0")) {
			p.setNowPage(Integer.parseInt(cPage));
		} else {
			p.setNowPage(1);
		}
		
		session.setAttribute("page", p);
		map.put("begin", String.valueOf(p.getBegin()));
		map.put("end", String.valueOf(p.getEnd()));
		
		List<CouponVO> c_list = ss.selectList("coupon.searchCoupons", map);
		
		session.setAttribute("c_ar", c_list);
		ss.close();
%>