<%@page import="dao.CouponDAO"%>
<%@page import="vo.CouponVO"%>
<%@page import="vo.CouponlistVO"%>
<%@page import="dao.UserDAO"%>
<%@page import="util.Paging"%>
<%@page import="service.PagingService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cPage = request.getParameter("cPage");
	String u_idx = request.getParameter("u_idx");
	String c_idx = request.getParameter("c_idx");
	String isApply = request.getParameter("isApply");
	String price = request.getParameter("price");
	if(c_idx != null && isApply != null) {
		UserDAO.mycouponupdate(u_idx, c_idx, isApply);
	}
	
	
	CouponVO[] cvvo = null;
	
	cvvo = CouponDAO.searchCoupon(c_idx);
	
	String d_price = "0";
	String min_order_price = "0";
	String max_discount = "0";
	
	if(isApply.equals("1")){
		d_price = cvvo[0].getD_price();
		min_order_price = cvvo[0].getMin_order_price();
		max_discount = cvvo[0].getMax_discount();
		
		if(Integer.parseInt(d_price) < 100 && Integer.parseInt(min_order_price) <= Integer.parseInt(price)){
			double ss = Double.parseDouble(d_price);
			double bb = Double.parseDouble(price);
			bb = bb*ss*0.01;
			if( bb > Double.parseDouble(max_discount)){
				d_price = max_discount;
			}else{
				d_price = String.valueOf(bb);
			}
			price = String.valueOf(Double.parseDouble(price) - Double.parseDouble(d_price));
		}else if(Integer.parseInt(d_price) > 100 && Integer.parseInt(min_order_price) <= Integer.parseInt(price)){
			price = String.valueOf(Integer.parseInt(price) - Integer.parseInt(d_price));
		}
	}
	
	response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write("{\"d_price\": \"" + d_price + "\", \"price\": \"" + price + "\"}");
%>
