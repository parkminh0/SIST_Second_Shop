<%@page import="service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="util.Paging"%>
<%@page import="dao.OrderDAO"%>
<%@page import="vo.OrderVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%
    request.setCharacterEncoding("utf-8");
	SqlSession ss = FactoryService.getFactory().openSession();
	
    // 조회구분
    String search_by = request.getParameter("search_by");
    System.out.println("search_by" + search_by);
    
    // 일자
    String start_date = request.getParameter("start_date");
    String end_date = request.getParameter("end_date");
    
    // 검색분류
    String search_type = request.getParameter("search_type");
    String search_text = request.getParameter("search_text");
    
    Map<String, String> map = new HashMap<>();
    map.put("start_date", start_date);
    map.put("end_date", end_date);
    map.put("search_type", search_type.trim());
    map.put("search_text", search_text.trim());
    
    Paging p = new Paging(10, 10);
    String cPage = request.getParameter("cPage");
    if (cPage == null || cPage.equals("0") || cPage.equals("")) {
        cPage = "1";
    }
    
    OrderVO[] ar = OrderDAO.searchDeli(map);
    
    	System.out.println(OrderDAO.searchDeli(map));
    	System.out.println("search_by:"+search_by);
    	
	    switch (search_by) {
	        // 배송 준비중 관리
	        case "1":
	        case "2":
	        case "3":
	            if(cPage != null && !cPage.equals("0")) {
	                p.setNowPage(Integer.parseInt(cPage));
	            } else {
	                p.setNowPage(1);
	            }
	            
	            map.put("begin", String.valueOf(p.getBegin()));
	            map.put("end", String.valueOf(p.getEnd()));
// 	            ar = OrderDAO.searchDeli(map);
	            System.out.println("111"+ar);
	            if (ar == null) {
                    ar = new OrderVO[0]; // 검색 결과가 없을 경우 빈 배열로 초기화
                }
	            p.setTotalRecord(ar.length);
	            break;
	    }

    pageContext.setAttribute("page", p);
    
    System.out.println("Search Results: ");
    for (OrderVO ovo : ar) {
        System.out.println("123"+ ovo.toString());
    }
%>

<div id="shipedReadyList" class="mBoard typeOrder gScroll gCellSingle typeList">
    <table border="1" summary="" class="thead">
        <caption>배송준비중 관리 목록</caption>
        <thead>
            <tr>
                <th scope="col" class="w35"><input type="checkbox" id="allChk"></th>
                <th scope="col" class="w120">주문번호</th>
                <th scope="col" class="w65">주문일</th>
                <th scope="col" class="w80">주문자 <div class="cTip eSmartMode" code="OD.OF.DD.200"></div></th>
                <th scope="col" class="w220">상품명/옵션</th>
                <th scope="col" class="w30">수량</th>
                <th scope="col" class="w100">결제금액<h2>a</h2></th>
            </tr>
        </thead>
        <tbody>
<%
    for (OrderVO ovo:ar) {
%>
            <tr>
                <td class="w35"><input type="checkbox" id="allChk"></td>
                <td class="w120"><%=ovo.getOrder_key() %></td>
                <td class="w65"><%=ovo.getOrder_dtm() %></td>
                <td class="w80"><%=ovo.getReceiver() %> <div class="cTip eSmartMode" code="OD.OF.DD.200"></div></td>
                <td class="w220">상품명/옵션</td>
                <td class="w30"><%=ovo.getOrder_qty() %></td>
                <td class="w100"><%=ovo.getFinal_price() %></td>
            </tr>
<%
	System.out.print("key:" + ovo.getOrder_key());
    }
%>
        </tbody>
    </table>
</div>

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
