<%@page import="vo.admin.statistic_user_dayVO"%>
<%@page import="vo.admin.statistic_user_gradeVO"%>
<%@page import="dao.OrderDAO"%>
<%@page import="vo.admin.statistic_user_mileVO"%>
<%@page import="util.Paging"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");

	// 조회 구분
	String search_by = request.getParameter("search_by");
	
	// 일자
	String start_date = request.getParameter("start_date");
	String end_date = request.getParameter("end_date");
	
	Map<String, String> map = new HashMap<>();
	map.put("start_date", start_date);
	map.put("end_date", end_date);
	
	Paging p = new Paging(10, 10);
	String cPage = request.getParameter("cPage");
	
	switch (search_by){
	// 활동 분석
	case "1":
		// 요일별
			statistic_user_dayVO day_list[] = OrderDAO.statistic_user_day(map);
%>
              <div class="mTitle">
                  <h2>요일별 분석내역</h2>
              </div>
                    <div class="mBoard">
                        <table border="1" summary="">
                            <caption>요일별 분석내역</caption>
                            <colgroup>
                                <col style="width:10%;">
                                <col style="width:15%;">
                                <col style="width:15%;">
                                <col style="width:15%;">
                                <col style="width:15%;">
                                <col style="width:auto;">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">요일</th>
                                <th scope="col">신규가입자</th>
                                <th scope="col">결제완료 상품수</th>
                                <th scope="col">결제완료 상품금액</th>
                                <th scope="col">환불완료 상품수</th>
                                <th scope="col">환불완료 상품금액</th>
                            </tr>
                            </thead>
                            <tbody class="right">
<%
					for(statistic_user_dayVO vo : day_list){
%>
						<tr>
                            <td class="center"><%=vo.getDayname() %></td>
                            <td><%=vo.getU_qty() %></td>
                            <td><%=vo.getOd_qty() %></td>
                            <td><%=vo.getTotal_price() %></td>
                            <td><%=vo.getCancel_qty() %></td>
                            <td><%=vo.getCancel_price() %></td>
                        </tr>
<%
					}
%>
       	</tbody>
	</table>
</div>
<%
		break;
	// 회원 등급별 분석
	case "2":
		statistic_user_gradeVO grade_list[] = OrderDAO.statistic_user_grade(map);
%>
        <div class="mTitle">
            <h2>회원등급별 분석내역</h2>
        </div>
        <div class="mBoard">
            <table border="1" summary="">
                <caption>회원등급별 분석내역</caption>
                <colgroup>
                    <col style="width:10%;">
                    <col style="width:15%;">
                    <col style="width:15%;">
                    <col style="width:15%;">
                    <col style="width:15%;">
                    <col style="width:15%;">
                    <col style="width:auto;">
                </colgroup>
                <thead>
                <tr>
                    <th scope="col">회원등급</th>
                    <th scope="col">등급별 회원수</th>
                    <th scope="col">결제완료 주문수</th>
                    <th scope="col">결제완료 상품수</th>
                    <th scope="col">결제완료 상품금액</th>
                    <th scope="col">환불완료 상품수</th>
                    <th scope="col">환불완료 상품금액</th>
                </tr>
                </thead>
<%
		if (grade_list == null || grade_list.length == 0){
%>
                <tbody class="empty">
	                <tr>
	                    <td colspan="7">검색 결과가 없습니다.</td>
	                </tr>
<%
		} else {
			for(statistic_user_gradeVO vo:grade_list){
%>
			<tr>
                <td><%=vo.getGrade() %></td>
                <td><%=vo.getU_qty() %></td>
                <td><%=vo.getQty() %></td>
                <td><%=vo.getOd_qty() %></td>
                <td><%=vo.getTotal_price() %></td>
                <td><%=vo.getCancel_qty() %></td>
                <td><%=vo.getCancel_price() %></td>
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
	// 적립금 분석
	case "3":
		//전체페이지 수를 구하기
		p.setTotalRecord(OrderDAO.statistic_user_mile_paging(map));
		if(cPage != null && !cPage.equals("0")) {
			p.setNowPage(Integer.parseInt(cPage));
		} else {
			p.setNowPage(1);
		}
		
		map.put("begin", String.valueOf(p.getBegin()));
		map.put("end", String.valueOf(p.getEnd()));
		
		statistic_user_mileVO mile_list[] = OrderDAO.statistic_user_mile(map);
%>
        <div class="mTitle">
        	<h2>적립금 지급/차감 내역</h2>
        </div>
        <div class="mBoard">
            <table border="1" summary="">
                <caption>적립금 지급/차감 내역</caption>
                <colgroup>
                    <col class="date">
                    <col style="width:17%;">
                    <col style="width:17%;">
                    <col style="width:17%;">
                    <col style="width:17%;">
                    <col style="width:17%;">
                </colgroup>
                <thead>
                <tr>
                    <th scope="col" rowspan="2">일자</th>
                    <th scope="col" colspan="2">지급 ①</th>
                    <th scope="col" colspan="2">사용/차감 ②</th>
                    <th scope="col" rowspan="2">잔액(①-②)</th>
                </tr>
                <tr>
                    <th scope="col">건수</th>
                    <th scope="col">금액</th>
                    <th scope="col">건수</th>
                    <th scope="col">금액</th>
                </tr>
                </thead>
<%
	if (mile_list == null || mile_list.length == 0){
%>
                <tbody class="empty">
                <tr>
                    <td colspan="6">검색 결과가 없습니다.</td>
                </tr>
<%
	} else {
		for(statistic_user_mileVO vo:mile_list){
%>
				<tr>
                    <td><%=vo.getOrder_dtm() %></td>
                    <td><%=vo.getGetmile() %></td>
                    <td><%=vo.getGetprice() %></td>
                    <td><%=vo.getUsemile() %></td>
                    <td><%=vo.getUseprice() %></td>
                    <td><%=vo.getTotalprice() %></td>
                </tr>
<%
		}
	}
%>
                </tbody>
        	</table>
        </div>
<%
		pageContext.setAttribute("page", p);
		break;
	}
	
%>
<c:if test="${page ne null}">
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
</c:if>