<%@page import="dao.ProductDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String product_key = request.getParameter("product_key");
	String mode = request.getParameter("mode");
	Map<String, String> map = new HashMap<>();
	map.put("product_key", product_key);
	map.put("mode", mode);
	
	if (mode.equals("2")){
		ProductDAO.deleteProduct(map);
	} else {
		ProductDAO.updateDel(map);
	}
%>
