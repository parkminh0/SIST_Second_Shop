<%@page import="vo.CategoryVO"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String category_key = request.getParameter("category_key");
	String category_name = request.getParameter("category_name");
	String up_category_key = request.getParameter("up_category_key");
	String mode = request.getParameter("mode");
	
	Map<String, String> map = new HashMap<>();
	map.put("category_key", category_key);
	map.put("category_name", category_name);
	map.put("up_category_key", up_category_key);
	
	CategoryVO[] c_list = null;
	if (mode.equals("0")){
		c_list = CategoryDAO.addCategory(map);
	} else if (mode.equals("1")){
		c_list =  CategoryDAO.editCategory(map);
	} else if (mode.equals("2")){
		c_list =  CategoryDAO.deleteCategory(map);
	}
	application.setAttribute("category_list", c_list);
%>