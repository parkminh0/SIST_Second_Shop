<%@page import="dao.optionDAO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="service.FactoryService"%>
<%@page import="vo.CategoryVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
	
	String category_key = request.getParameter("category_key");
	
	SqlSession ss = FactoryService.getFactory().openSession();

	if (category_key != null){
		String cate1 = request.getParameter("cate1");
		String cate2 = request.getParameter("cate2");

		List<CategoryVO> list = ss.selectList("category.getList", category_key);
		if (list != null){
			pageContext.setAttribute("cate_list", list);
			if (cate2 != null && cate2.equals("yes")){
%>
				<c:set var="cate_list" value="${cate_list}"/>
				<c:forEach var="category" items="${cate_list}">
					<li class="li_cate3" data-key="${category.category_key}">${category.category_name}</li>
				</c:forEach>
<%
			} else if (cate1 != null && cate1.equals("yes")) {
%>
				<c:set var="cate_list" value="${cate_list}"/>
				<c:forEach var="category" items="${cate_list}">
					<li class="li_cate2" data-key="${category.category_key}">${category.category_name}<span class="right"> &gt;</span></li>
				</c:forEach>
<%
			}
		}
	} 
	
	String mode = request.getParameter("mode");
	if (mode != null) {

		String product_key = request.getParameter("prod_key");
		String del = request.getParameter("selling_status"); // 0 or 1
		String isnew = request.getParameter("isnew"); // 1 or null
		String isrecommend = request.getParameter("isrecommend"); // 1 or null
		String crud_category_key = request.getParameter("crud_category_key");
		String prod_name = request.getParameter("prod_name");
		String stock = request.getParameter("stock");
		String img_url = "/shop/img/product/" + request.getParameter("img_url");
		String prod_desc1 = request.getParameter("prod_desc1");
		String prod_desc2 = request.getParameter("prod_desc2");
		String factory = request.getParameter("factory");
		String material = request.getParameter("material");
		String ori_price = request.getParameter("ori_price");
		String cell_price = request.getParameter("cell_price");
		
		Map<String, String> map = new HashMap<>();
		map.put("product_key", product_key);
		map.put("del", del);
		map.put("isnew", isnew);
		map.put("isrecommend", isrecommend);
		map.put("category_key", crud_category_key);
		map.put("prod_name", prod_name);
		map.put("img_url", img_url);
		map.put("prod_desc1", prod_desc1);
		map.put("prod_desc2", prod_desc2);
		map.put("factory", factory);
		map.put("material", material);
		map.put("ori_price", ori_price);
		map.put("cell_price", cell_price);
		map.put("stock", stock);
		
		int res = 0;
		int opt_res = 0;
		
		if (mode.equals("add")){
			res = ProductDAO.addProduct(map);
		} else if (mode.equals("edit")){
			res = ProductDAO.editProduct(map);
			opt_res = optionDAO.deleteOption(map);
		} else if (mode.equals("delete")){
			res = ProductDAO.deleteProduct(map);
			opt_res = optionDAO.deleteOption(map);
		}
		
		if(res > 0){
			pageContext.setAttribute("product_key", res);
		}
	}
	
	ss.close();
%>
<input id="crud_prod_key" type="hidden" value="${product_key}"/>
<input id="up_cate_key" type="hidden" value="<%=category_key %>"/>