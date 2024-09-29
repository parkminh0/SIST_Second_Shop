<%@page import="dao.optionDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");

	String product_key = request.getParameter("product_key");
	String size = request.getParameter("size");
	String color = request.getParameter("color");
	String prod_stock = request.getParameter("prod_stock");
	
	System.out.println(color);
	Map<String, String> map = new HashMap<>();
	map.put("product_key", product_key);
	map.put("size", size);
	map.put("color", color);
	map.put("prod_stock", prod_stock);
	
	optionDAO.addOption(map);
%>