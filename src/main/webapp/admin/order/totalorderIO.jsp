<%@page import="dao.OrderDAO"%>
<%@page import="vo.admin.admin_order_totalorderVO"%>
<%@page import="util.Paging"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//조회 구분
	String search_by = request.getParameter("search_by");
	String search_text = request.getParameter("search_text");
	
	// 일자
	String start_date = request.getParameter("start_date");
	String end_date = request.getParameter("end_date");
	
	Map<String, String> map = new HashMap<>();
	map.put("search_by", search_by);
	map.put("search_text", search_text);
	map.put("start_date", start_date);
	map.put("end_date", end_date);
	
	Paging p = new Paging(10, 10);
	String cPage = request.getParameter("cPage");
	//전체페이지 수를 구하기
	p.setTotalRecord(OrderDAO.admin_order_totalorder_paging(map));
	if(cPage != null && !cPage.equals("0")) {
		p.setNowPage(Integer.parseInt(cPage));
	} else {
		p.setNowPage(1);
	}
	
	map.put("begin", String.valueOf(p.getBegin()));
	map.put("end", String.valueOf(p.getEnd()));
	pageContext.setAttribute("page", p);
	
	admin_order_totalorderVO[] order_list = OrderDAO.admin_order_totalorder(map);
	if (order_list != null && order_list.length != 0){
		%>
		<table border="1" summary="">
            <caption>전체주문 조회 목록</caption>
            <tbody class="right">
        <%
        	for(admin_order_totalorderVO vo:order_list){
        %>
        	<tr> 
                <td class="w120  center" style="">
                	<%=vo.getOrder_dtm() %>
                </td>
                <td class="w120 orderNum" style="">
                    <img src="//img.echosting.cafe24.com/icon/ico_route_timon.gif" alt="티몬" title="티몬">
                    <a href="#" id="eOrderDetailPopup0"><span id="copyarea_0"><%=vo.getOrder_key() %></span></a>
                </td>
                <td class="w95 center" style="" bgcolor="">
                <%=vo.getName() %>
                </td>
                <td class="w105" style="">
                                                                     <%=vo.getPrimary_price() %>
                        <br>
                 </td>
                 <td class="w105" style="display:none;">
                 <%=vo.getFinal_price() %>
                        <br></td>
                <td class="w105" style="">
					<a href="#" data-orderid="20240408-0000011" data-norderid="timon" class="txtLink eLayerClick">
                                                                         106,000
                                                                            </a>
                                                                        <br>
                   
                <td class="w45" style=""><%=vo.getD_ready() %></td>
                <td class="w45" style=""><%=vo.getD_ing() %></td>
                <td class="w50" style=""><%=vo.getD_done() %></td>
                <td class="w45" style=""><%=vo.getCancel_qty() %></td>
                <td class="w45" style=""><%=vo.getExchange_qty() %></td>
                <td class="w45" style=""><%=vo.getRefund_qty() %></td>
            </tr>
        <%
        	}
        %>
         	</tbody>
        </table>   
        <div class="mPaginate">
            <ol><li><strong>1</strong></li></ol>
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
		<%
	} else {
		%>
		<table border="1" summary="">
                       <caption>전체주문 조회 목록</caption>
                       <tbody class="empty">
                      <tr>
                          <td colspan="14">검색된 주문내역이 없습니다.</td>
                      </tr>
                    	</tbody>
                   </table>   
		<%
	}
%>