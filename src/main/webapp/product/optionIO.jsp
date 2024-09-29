<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String option_key = request.getParameter("option_key");
	String size = request.getParameter("size");
	String color = request.getParameter("color");
	String prod_stock = request.getParameter("prod_stock");
	String cell_price = request.getParameter("cell_price");
%>
<tr class="option_product">
	<input type="hidden" class="option_box_id" id="option_box1_id" value="<%=option_key%>" name="item_code[]"/>
    <td>
        <p class="product">
            사이즈 - <span><%=size%></span><br/>
            색상 - <span><%=color%></span>
        </p>
    </td>
    <td>
        <span class="quantity" style="width:65px;">
            <input type="text" id="option_box1_quantity" name="quantity_opt[]" class="quantity_opt eProductQuantityClass" value="1"/>
            <a href="javascript:;" class="up eProductQuantityUpClass"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif" alt="수량증가" id="option_box1_up" class="option_box_up"/></a>
            <a href="javascript:;" class="down eProductQuantityDownClass"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif" alt="수량감소" id="option_box1_down" class="option_box_down"/></a>
        </span>
        <a href="#none" class="delete"><img src="//img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif" alt="삭제" class="option_box_del" /></a>
    </td>
    <td class="right">
    	<span id="option_box1_price">
    		<span class="ec-front-product-item-price"><%=cell_price %>원</span>
    	</span>
    </td>
</tr>