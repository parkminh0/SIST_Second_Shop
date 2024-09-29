<%@page import="vo.admin.statistic_product_cellVO"%>
<%@page import="vo.admin.statistic_product_interestVO"%>
<%@page import="util.Paging"%>
<%@page import="vo.admin.statistic_product_basketVO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="vo.OptionVO"%>
<%@page import="vo.ProductVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	
	// 조회구분
	String search_by = request.getParameter("search_by");
	
	// 순위 기준
	String rank_by = request.getParameter("rank_by");
	
	// 일자
	String start_date = request.getParameter("start_date");
	String end_date = request.getParameter("end_date");
	
	// 카테고리
	String search2_1 = request.getParameter("search2_1");
	String search2_2 = request.getParameter("search2_2");
	String search2_3 = request.getParameter("search2_3");
	
	// 검색분류
	String search1 = request.getParameter("search1");
	String search1_text = request.getParameter("search1_text");
	
	// 가격
	String price = request.getParameter("price");
	String price_min = request.getParameter("price_min");
	String price_max = request.getParameter("price_max");
	
	Map<String, String> map = new HashMap<>();
	map.put("search_by", search_by);
	map.put("rank_by", rank_by);
	map.put("start_date", start_date);
	map.put("end_date", end_date);
	map.put("search2_1", search2_1);
	map.put("search2_2", search2_2);
	map.put("search2_3", search2_3);
	map.put("search1", search1);
	map.put("search1_text", search1_text);
	map.put("price", price);
	map.put("price_min", price_min);
	map.put("price_max", price_max);
	
	Paging p = new Paging(10, 10);
	String cPage = request.getParameter("cPage");
	statistic_product_cellVO[] cell_list = null;
	switch (search_by){
	// 판매 상품 분석
	case "1":
		//전체페이지 수를 구하기
		p.setTotalRecord(ProductDAO.statistic_product_cell_paging(map));
		if(cPage != null && !cPage.equals("0")) {
			p.setNowPage(Integer.parseInt(cPage));
		} else {
			p.setNowPage(1);
		}
		map.put("begin", String.valueOf(p.getBegin()));
		map.put("end", String.valueOf(p.getEnd()));
		
		cell_list = ProductDAO.statistic_product_cell(map);
%>
        <div class="mTitle">
        	<h2>판매상품 순위 내역</h2>
        </div>
        <div class="mBoard typeList">
            <table border="1" summary="">
                <caption>판매상품 순위 내역</caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:12%;">
                    <col style="width:auto;">
                    <col style="width:12%;">
                    <col style="width:5%;">
                    <col style="width:5%;">
                    <col style="width:5%;">
                    <col style="width:5%;">
                    <col style="width:12%;">
                </colgroup>
                <thead>
	                <tr>
	                    <th scope="col">순위</th>
	                    <th scope="col">상품코드</th>
	                    <th scope="col">상품명/옵션</th>
                        <th scope="col">판매가 </th>
                        <th scope="col">재고</th>
                        <th scope="col">결제수량</th>
	                    <th scope="col">환불수량</th>
	                    <th scope="col">판매수량 </th>
	                    <th scope="col">판매합계</th>
	                </tr>
                </thead>
<%
		if (cell_list == null || cell_list.length == 0){
%>
				<tbody class="empty">
                	<tr>
                    	<td colspan="9">검색 결과가 없습니다.</td>
                    </tr>
				</tbody>
<%
		} else {
%>
           	<tbody class="right">
<%
			int qty = 0;
			int cancel_qty = 0;
			int changed_qty = 0;
			int changed_price = 0;
			for (statistic_product_cellVO vo : cell_list){
				qty += Integer.parseInt(vo.getQty());
				cancel_qty += Integer.parseInt(vo.getCancel_qty());
				changed_qty += Integer.parseInt(vo.getChanged_qty());
				changed_price += Integer.parseInt(vo.getChanged_price());
%>
				<tr>
	                <td class="center"><%=vo.getRnum() %></td>
	                <td class="center"><%=vo.getProduct_key() %></td>
	                <td>
	                	<div class="gGoods gSmall">
		                <span class="frame"><img src="<%=vo.getImg_url() %>" width="32" height="32" alt=""/></span>
		                <p><%=vo.getProd_name() %></p>
		                <ul class="etc"><li>사이즈 : <%=vo.getSize() %></li><li>색상 : <%=vo.getColor() %></li></ul></div>
	                </td>
	                <td><%=vo.getCell_price() %></td>
	                <td><%=vo.getProd_stock() %></td>
	                <td><%=vo.getQty() %></td>
	                <td><%=vo.getCancel_qty() %></td>
	                <td><%=vo.getChanged_qty() %></td>
	                <td><%=vo.getChanged_price() %></td>
                </tr>             
<% 
			}   	
%>
			</tbody>
			<tfoot>
            	<tr class="right">
                	<th colspan="5" class="center">합계</th>
             		<td><%=qty %></td>
	                <td><%=cancel_qty %></td>
	                <td><%=changed_qty %></td>
	                <td><%=changed_price %></td>
            	</tr>
           	</tfoot>
<%
		}
%>
       	</table>
       </div>
<%
		break;
	// 취소/반품 분석
	case "2":
		//전체페이지 수를 구하기
		p.setTotalRecord(ProductDAO.statistic_product_cell_paging(map));
		if(cPage != null && !cPage.equals("0")) {
			p.setNowPage(Integer.parseInt(cPage));
		} else {
			p.setNowPage(1);
		}
		map.put("begin", String.valueOf(p.getBegin()));
		map.put("end", String.valueOf(p.getEnd()));
		
		cell_list = ProductDAO.statistic_product_cell(map);
%>
        <div class="mTitle">
        	<h2>취소/반품 상품 순위 내역</h2>
        </div>
        <div class="mBoard typeList">
            <table border="1" summary="">
                <caption>취소/반품 상품 순위 내역</caption>
                <colgroup>
                    <col style="width:8%;">
                    <col style="width:12%;">
                    <col style="width:auto;">
                    <col style="width:12%;">
                    <col style="width:5%;">
                    <col style="width:5%;">
                    <col style="width:5%;">
                    <col style="width:5%;">
                    <col style="width:12%;">
                </colgroup>
                <thead>
	                <tr>
	                    <th scope="col">순위</th>
	                    <th scope="col">상품코드</th>
	                    <th scope="col">상품명/옵션</th>
                        <th scope="col">판매가 </th>
                        <th scope="col">재고</th>
                        <th scope="col">결제수량</th>
	                    <th scope="col">환불수량</th>
	                    <th scope="col">판매수량 </th>
	                    <th scope="col">판매합계</th>
	                </tr>
                </thead>
<%
		if (cell_list == null || cell_list.length == 0){
%>
				<tbody class="empty">
                	<tr>
                    	<td colspan="9">검색 결과가 없습니다.</td>
                    </tr>
				</tbody>
<%
		} else {
%>
           	<tbody class="right">
<%
			int qty = 0;
			int cancel_qty = 0;
			int changed_qty = 0;
			int changed_price = 0;
			for (statistic_product_cellVO vo : cell_list){
				qty += Integer.parseInt(vo.getQty());
				cancel_qty += Integer.parseInt(vo.getCancel_qty());
				changed_qty += Integer.parseInt(vo.getChanged_qty());
				changed_price += Integer.parseInt(vo.getChanged_price());
%>
				<tr>
	                <td class="center"><%=vo.getRnum() %></td>
	                <td class="center"><%=vo.getProduct_key() %></td>
	                <td>
	                	<div class="gGoods gSmall">
		                <span class="frame"><img src="<%=vo.getImg_url() %>" width="32" height="32" alt=""/></span>
		                <p><%=vo.getProd_name() %></p>
		                <ul class="etc"><li>사이즈 : <%=vo.getSize() %></li><li>색상 : <%=vo.getColor() %></li></ul></div>
	                </td>
	                <td><%=vo.getCell_price() %></td>
	                <td><%=vo.getProd_stock() %></td>
	                <td><%=vo.getQty() %></td>
	                <td><%=vo.getCancel_qty() %></td>
	                <td><%=vo.getChanged_qty() %></td>
	                <td><%=vo.getChanged_price() %></td>
                </tr>             
<% 
			}   	
%>
			</tbody>
			<tfoot>
            	<tr class="right">
                	<th colspan="5" class="center">합계</th>
             		<td><%=qty %></td>
	                <td><%=cancel_qty %></td>
	                <td><%=changed_qty %></td>
	                <td><%=changed_price %></td>
            	</tr>
           	</tfoot>
<%
		}
%>
       	</table>
       </div>
<%
		break;
	// 장바구니 상품 분석
	case "3":
		//전체페이지 수를 구하기
		p.setTotalRecord(ProductDAO.statistic_product_basket_paging(map));
		if(cPage != null && !cPage.equals("0")) {
			p.setNowPage(Integer.parseInt(cPage));
		} else {
			p.setNowPage(1);
		}
		
		map.put("begin", String.valueOf(p.getBegin()));
		map.put("end", String.valueOf(p.getEnd()));
		
		statistic_product_basketVO[] basket_list = ProductDAO.statistic_product_basket(map);
%>
		<div class="mTitle">
            <h2>장바구니 상품 순위 내역</h2>
        </div>
        <div class="mBoard">
            <table border="1" summary="">
                <caption>장바구니 상품 순위 내역</caption>
                <colgroup>
                       <col style="width:8%;"/>
                       <col style="width:12%;"/>
                       <col style="width:auto;"/>
                       <col style="width:12%;"/>
                       <col style="width:7%;"/>
                       <col style="width:7%;"/>
                       <col style="width:7%;"/>
                   </colgroup>
                <thead>
                	<tr>
                       <th scope="col">순위</th>
                       <th scope="col">상품코드</th>
                       <th scope="col">상품명/옵션</th>
                       <th scope="col">판매가</th>
                       <th scope="col">수량</th>
                       <th scope="col">재고</th>
                       <th scope="col">회원수</th>
                   </tr>
                </thead>
<%
		if (basket_list == null || basket_list.length == 0){
%>
				<tbody class="empty">
                	<tr>
                    	<td colspan="7">검색 결과가 없습니다.</td>
                    </tr>
<%
		} else {
%>
	            <tbody class="right">
<%
			for (statistic_product_basketVO vo : basket_list){
%>
					<tr>
                        <td class="center"><%=vo.getRnum()%></td>
                        <td class="center"><%=vo.getProduct_key()%></td>
                        <td>
                            <div class="gGoods gSmall">
                                <span class="frame">
                                	<img src="<%=vo.getImg_url()%>" width="32" height="32" alt="">
                               	</span>
                                <p><%=vo.getProd_name()%></p>
                                <p></p>
                                <ul class="etc"><li>색상 : <%=vo.getColor() %></li><li>사이즈 : <%=vo.getSize() %></li>
                                </ul>
                                <p></p>
                            </div>
                        </td>
                        <td><%=vo.getCell_price() %></td>
                        <td><%=vo.getB_qty() %></td>
                        <td><%=vo.getProd_stock() %></td>
                        <td><%=vo.getU_qty() %></td>
                    </tr>
<%
			}
		}
%>
		    	</tbody>
			</table>
		</div>
<%
		break;
	// 관심 상품 분석
	case "4":
		//전체페이지 수를 구하기
		p.setTotalRecord(ProductDAO.statistic_product_interest_paging(map));
		if(cPage != null && !cPage.equals("0")) {
			p.setNowPage(Integer.parseInt(cPage));
		} else {
			p.setNowPage(1);
		}
		
		map.put("begin", String.valueOf(p.getBegin()));
		map.put("end", String.valueOf(p.getEnd()));
		statistic_product_interestVO[] interest_list = ProductDAO.statistic_product_interest(map);
%>
		<div class="mTitle">
            <h2>관심 상품 순위 내역</h2>
        </div>
        <div class="mBoard">
            <table border="1" summary="">
                <caption>관심 상품 순위 내역</caption>
                <colgroup>
                    <col style="width:8%;"/>
                    <col style="width:12%;"/>
                    <col style="width:auto;"/>
                    <col style="width:12%;"/>
                    <col style="width:7%;"/>
                    <col style="width:7%;"/>
                </colgroup>
                <thead>
                	<tr>
	                    <th scope="col">순위</th>
	                    <th scope="col">상품코드</th>
	                    <th scope="col">상품명</th>
                        <th scope="col">판매가</th>
	                    <th scope="col">재고</th>
	                    <th scope="col">회원수</th>
	                </tr>
                </thead>
<%
		if (interest_list == null || interest_list.length == 0){
%>
				<tbody class="empty">
                	<tr>
                    	<td colspan="6">검색 결과가 없습니다.</td>
                    </tr>
<%
		} else {
%>
	            <tbody class="right">
<%
			for (statistic_product_interestVO vo : interest_list){
%>
					<tr>
                        <td class="center"><%=vo.getRnum() %></td>
                        <td class="center"><%=vo.getProduct_key() %></td>
                        <td>
                            <div class="gGoods gSmall">
                                <span class="frame"><img src="<%=vo.getImg_url() %>" width="32" height="32" alt=""></span>
                                <p><%=vo.getProd_name() %></p>
                                <p></p><ul class="etc"></ul><p></p>
                            </div>
                        </td>
                        <td><%=vo.getCell_price() %></td>
                        <td><%=vo.getStock() %></td>
                        <td><%=vo.getU_qty() %></td>
                    </tr>
<%
			}
		}
%>
		    	</tbody>
			</table>
		</div>
<%
		break;
	}
	
	pageContext.setAttribute("page", p);
%>

<div class="mPaginate">
	<c:if test="${page.getStartPage() >= page.getPagePerBlock()}">
	<a href="#" onclick="getList('${page.getNowPage()-page.getPagePerBlock()}');" class="prev">이전 10페이지</a>
	</c:if>
	<ol>
	<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" varStatus="idx">
	<c:if test="${page.getNowPage() eq idx.index}">
	<li>
		<strong title="현재페이지">${idx.index}</strong>
	</li>
	</c:if>
	<c:if test="${page.getNowPage() ne idx.index}">
	<li>
		<a href="#" onclick="getList('${idx.index}');">${idx.index}</a>
	</li>
	</c:if>
	</c:forEach>
	</ol>
	<c:if test="${page.getEndPage() < page.getTotalPage()}">
	<a href="#" onclick="getList('${page.getNowPage()+page.getPagePerBlock()}');" class="next">다음 10페이지</a>
	</c:if>
</div>