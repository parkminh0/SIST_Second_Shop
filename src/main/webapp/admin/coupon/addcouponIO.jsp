<%@page import="service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="dao.CouponDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	SqlSession ss = FactoryService.getFactory().openSession();
	String mode = request.getParameter("mode");

	String c_idx = request.getParameter("c_idx");
	String c_name = request.getParameter("coupon_name");
	String d_type = request.getParameter("fbenefit_parent_type");
	String d_price = request.getParameter("d_price");
	String issue_sort = request.getParameter("fissue_type");
	String issue_at = request.getParameter("startDate");
	String due_date = request.getParameter("endDate");
	String category_key = request.getParameter("category_key");
	String min_order_price = request.getParameter("min_order_price");
	String max_discount = request.getParameter("max_d_price");
	System.out.println(issue_sort);
	Map<String, String> map = new HashMap<>();
	map.put("c_idx", c_idx);
	map.put("c_name", c_name);
	map.put("d_type", d_type);
	map.put("d_price", d_price);
	map.put("issue_sort", issue_sort);
	map.put("issue_at", issue_at);
	map.put("due_date", due_date);
	map.put("category_key", category_key);
	map.put("min_order_price", min_order_price);
	map.put("max_discount", max_discount);
	map.put("mode", mode);
	
	int res = 0;	
	if (mode == null)
		res = CouponDAO.addCoupon(map);
	else if (mode.equals("edit")){
		res = CouponDAO.editCoupon(map);
	} else if (mode.equals("del")){
		res = CouponDAO.deleteCoupon(map);
	}
%>