<%@page import="dao.OrderDAO"%>
<%@page import="vo.admin.statistic_cell_dayVO"%>
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
	String search_day = request.getParameter("search_day");
	String search_month = request.getParameter("search_month");
	
	
	
	// 일자
	String start_date = request.getParameter("start_date");
	String end_date = request.getParameter("end_date");
	String start_month = request.getParameter("start_month");
	String end_month = request.getParameter("end_month");
	
	Map<String, String> map = new HashMap<>();
	map.put("search_by", search_by);
	map.put("start_date", start_date);
	map.put("end_date", end_date);
	
	Paging p = new Paging(10, 10);
	String cPage = request.getParameter("cPage");
	
	statistic_cell_dayVO[] day_list = null;
	
	switch (search_by){
	case "1":
		//전체페이지 수를 구하기
		p.setTotalRecord(OrderDAO.statistic_cell_day_paging(map));
		if(cPage != null && !cPage.equals("0")) {
			p.setNowPage(Integer.parseInt(cPage));
		} else {
			p.setNowPage(1);
		}
		map.put("begin", String.valueOf(p.getBegin()));
		map.put("end", String.valueOf(p.getEnd()));
		
		day_list = OrderDAO.statistic_cell_day(map);
%>
	<div class="mTitle">
        <h2>일별 매출내역</h2> 
    </div>
    <div class="mState"></div>
    <div class="mBoard gScroll">
        <table border="1" summary="">
            <caption>일별 매출내역</caption>
<%
		break;
	case "2":
		//전체페이지 수를 구하기
		p.setTotalRecord(OrderDAO.statistic_cell_month_paging(map));
		if(cPage != null && !cPage.equals("0")) {
			p.setNowPage(Integer.parseInt(cPage));
		} else {
			p.setNowPage(1);
		}
		map.put("begin", String.valueOf(p.getBegin()));
		map.put("end", String.valueOf(p.getEnd()));
		
		day_list = OrderDAO.statistic_cell_month(map);
%>
	<div class="mTitle">
        <h2>월별 매출내역</h2> 
    </div>
    <div class="mState"></div>
    <div class="mBoard gScroll">
        <table border="1" summary="">
            <caption>월별 매출내역</caption>
<%
		break;
	}
%>
     <colgroup>
         <col style="width:110px;">
         <col style="width:80px;">
         <col style="width:80px;">
         <col style="width:100px;">
         <col style="width:80px;">
         <col style="width:80px;">
         <col style="width:100px;">
         <col style="width:100px;">
         <col style="width:140px;">
     </colgroup>
     <thead>
      <tr>
          <th scope="col" rowspan="2">일자</th>
          <th scope="col" colspan="5">결제완료 주문 </th>
          <th scope="col" rowspan="2">결제합계 </th>
          <th scope="col" rowspan="2">환불합계 </th>
          <th scope="col" rowspan="2">순매출 </th>
      </tr>
      <tr>
          <th scope="col">주문수</th>
          <th scope="col">품목수</th>
          <th scope="col">상품구매금액</th>
          <th scope="col">할인</th>
          <th scope="col">쿠폰</th>                                                                                                             
      </tr>
     </thead>
<%
	if(day_list == null || day_list.length == 0){
%>
					<tbody class="empty">
                    <tr>
                        <td colspan="10">검색 결과가 없습니다.</td>
                    </tr>
                    </tbody>
<%
	} else {
%>
		<tbody class="right">
<%
		int order_qty = 0;
		int prod_qty = 0;
		int before_price = 0;
		int mile_price = 0;
		int coupon_price = 0;
		int after_price = 0;
		int cancel_price = 0;
		int changed_price = 0;
		
		for (statistic_cell_dayVO vo:day_list){
			order_qty += Integer.parseInt(vo.getOrder_qty());
			prod_qty += Integer.parseInt(vo.getProd_qty());
			before_price += Integer.parseInt(vo.getBefore_price());
			mile_price += Integer.parseInt(vo.getMile_price());
			coupon_price += Integer.parseInt(vo.getCoupon_price());
			after_price += Integer.parseInt(vo.getAfter_price());
			cancel_price += Integer.parseInt(vo.getCancel_price());
			changed_price += Integer.parseInt(vo.getChanged_price());
%>
               	<tr>
                    <td class="center"><%=vo.getOrder_dtm() %></td>
                    <td><%=vo.getOrder_qty()%></td>
                    <td><%=vo.getProd_qty() %></td>
                    <td><%=vo.getBefore_price() %></td>
                    <td><%=vo.getMile_price() %></td>
                    <td><%=vo.getCoupon_price() %></td>
                    <td><%=vo.getAfter_price() %></td>
                    <td><%=vo.getCancel_price() %></td>
                	<td><%=vo.getChanged_price() %></td>   
                </tr>
<%
		}
%>
		</tbody>
		<tfoot class="right">
            <tr>
             <td class="center">합계</td>
             <td><%=order_qty %></td>
             <td><%=prod_qty %></td>
             <td><%=before_price %></td>
             <td><%=mile_price %></td>
             <td><%=coupon_price %></td>
             <td><%=after_price %></td>
             <td><%=cancel_price %></td>
             <td><%=changed_price %></td>             
            </tr>
       	</tfoot>
		</table>
    </div>
<%
	pageContext.setAttribute("page", p);
	}
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