<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <!--@layout(/layout/basic/main.html)-->
 <%-- <%@ include file="/layout/main.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" >
<meta http-equiv="Pragma" content="no-cache" >
<meta http-equiv="Expires" content="-1" >
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/layout_beta.css?vs=2406261322" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/reset_front.css?vs=2406261322" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/suio.css?vs=2406261322" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/dashboard_v3.css?vs=2406261322" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/dashboard_v4.css?vs=2406261322" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/plugin/jquery.mCustomScrollbar.min.css" media="all" charset="utf-8" />

<link rel="stylesheet" type="text/css" href="/shop/admin/css/index.css" media="all" charset="utf-8" />
<link rel="stylesheet" type="text/css" href="/shop/admin/css/order.css" media="all" charset="utf-8" />
<style>
.logo{
	margin : 20% 0%;
}
</style>
</head>
<body>
<div id="wrap" class=" beta">
    <hr class="layout" />
    <div id="container">
        <div id="sidebar">
			<div class="logo">
			    <h1>
			        <a href="Controller?type=adindex">
                    	<img src="/shop/layout/header/img/logo_off_new.png" alt="" class="off -mov" width="200"/>
	                </a>
			    </h1>
			</div>
			<div class="snbArea simple">
								<div id="menuList" class="eCustomScrollbar">
					<div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside">
						<div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;">
							<ul class="menu">
		                    	<li class="">
		                			<a id="QA_Lnb_Menu10258" href="Controller?type=adindex" class="link home" name="홈">홈</a>
		            			</li>
		                        <li class="hasChild show">
		                			<a id="QA_Lnb_Menu1681" href="#none" class="link order" name="주문">주문</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu2056" href="Controller?type=adproduct" class="link product" name="상품">상품</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu6" href="Controller?type=aduser" class="link member" name="고객">고객</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu7" href="Controller?type=adbbs" class="link board" name="게시판">게시판</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu1250" href="Controller?type=adcoupon" class="link promotion" name="프로모션">쿠폰</a>
		            			</li>
		                       	<li class="hasChild ">
		                			<a id="QA_Lnb_Menu2060" href="Controller?type=adstatistic" class="link calculate" name="통계">통계</a>
		            			</li>
		                        </ul>
						</div>
					</div>
				</div>
				<div class="subMenu eClone eCustomScrollbar mCustomScrollbar _mCS_3 mCS-autoHide mCS_no_scrollbar">
					<div id="mCSB_3" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 1016px;">
						<div id="mCSB_3_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
            				<div class="depthList">
                				<ul class="depth2">
                                	                                                                     
                                	<li class="selected ">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=adorder" class="link ">
				                            <span class="ellips">주문 대시보드</span>
				                        </a>
                    				</li>                                                                     
                                	<li class=" ">
				                   		<a id="QA_Lnb_Menu10395" href="Controller?type=adtotalorder" class="link ">
				                            <span class="ellips">전체 주문조회</span>
				                        </a>
                    				</li>                                                                     
                                	<li class=" ">
				                   		<a id="QA_Lnb_Menu10396" href="Controller?type=adbeforedeli" class="link ">
				                            <span class="ellips">배송 준비중 관리</span>
				                        </a>
                    				</li>                                                                     
                                	<li class=" ">
				                   		<a id="QA_Lnb_Menu10397" href="Controller?type=adproceeddeli" class="link ">
				                            <span class="ellips">배송중 관리</span>
				                        </a>
                    				</li>                                                                     
                                	<li class=" ">
				                   		<a id="QA_Lnb_Menu10398" href="Controller?type=adenddeli" class="link ">
				                            <span class="ellips">배송 완료 관리</span>
				                        </a>
                    				</li>                                                                     
                                	<li class=" ">
				                   		<a id="QA_Lnb_Menu10399" href="Controller?type=adendorder" class="link ">
				                            <span class="ellips">구매 확정 관리</span>
				                        </a>
                    				</li>                                                                     
                                	<li class=" ">
				                   		<a id="QA_Lnb_Menu10400" href="Controller?type=otherorder_cancel" class="link ">
				                            <span class="ellips">취소/교환/반품/환불 관리</span>
				                        </a>
                    				</li>                                                                     
                 				</ul>
           					</div>
        				</div>
       				</div>
   				</div>
			</div>
        </div>
        <hr class="layout" />
        <div id="content">
       	<!-- 컨텐츠 시작 -->
       		<c:set var="order_qty" value="0"/>
			<c:set var="order_price" value="0"/>
			<c:set var="changed_qty" value="0"/>
			<c:set var="changed_price" value="0"/>
			<c:set var="cancel_qty" value="0"/>
			<c:set var="cancel_price" value="0"/>
			<c:set var="order_qty_30" value="0"/>
			<c:set var="order_price_30" value="0"/>
			<c:set var="changed_qty_30" value="0"/>
			<c:set var="changed_price_30" value="0"/>
			<c:set var="cancel_qty_30" value="0"/>
			<c:set var="cancel_price_30" value="0"/>
			<c:forEach var="cell" items="${requestScope.cell_list }" varStatus="idx">
			<c:set var="order_qty_30" value="${order_qty_30 + cell.getOrder_qty()}"/>
			<c:set var="order_price_30" value="${order_price_30 + cell.getOrder_price()}"/>
			<c:set var="changed_qty_30" value="${changed_qty_30 + cell.getChanged_qty()}"/>
			<c:set var="changed_price_30" value="${changed_price_30 + cell.getChanged_price()}"/>
			<c:set var="cancel_qty_30" value="${cancel_qty_30 + cell.getCancel_qty()}"/>
			<c:set var="cancel_price_30" value="${cancel_price_30 + cell.getCancel_price()}"/>
			<c:if test="${idx.index eq 0}">
				<c:set var="order_qty" value="${order_qty + cell.getOrder_qty()}"/>
				<c:set var="order_price" value="${order_price + cell.getOrder_price()}"/>
				<c:set var="changed_qty" value="${changed_qty + cell.getChanged_qty()}"/>
				<c:set var="changed_price" value="${changed_price + cell.getChanged_price()}"/>
				<c:set var="cancel_qty" value="${cancel_qty + cell.getCancel_qty()}"/>
				<c:set var="cancel_price" value="${cancel_price + cell.getCancel_price()}"/>
			</c:if>
			</c:forEach>
    		<div id="react-dom-root">
				<div class="MuiContainer-root MuiContainer-maxWidthXl css-ou99bh" data-testid="Layout_Container">
					<div class="MuiStack-root css-tfkmr0" data-testid="PageHeading_Stack"><div class="MuiGrid-root MuiGrid-container css-v3z1wi" data-testid="PageHeading_Grid"><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-md-6 css-196gsvj" data-testid="PageHeading_Grid_1"><div class="MuiStack-root css-1x4jos1" data-testid="PageHeading_Stack_1"><div class="MuiStack-root css-lmzl00" data-testid="PageHeading_Stack_2"><span class="MuiTypography-root MuiTypography-base.h5B css-avyusg" data-testid="PageHeading_Typography">주문 대시보드</span></div>
					</div></div></div></div>

<div class="MuiGrid-root MuiGrid-container MuiGrid-item MuiGrid-grid-xs-12 css-srsewn" data-testid="RealTimeSalesStatus_Grid"><div class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation1 MuiCard-root css-w85y81" data-testid="BoardInfoCard_Card"><div class="MuiCardHeader-root css-1cg1x61" data-testid="BoardInfoCard_CardHeader"><div class="MuiCardHeader-content css-11qjisw"><span class="MuiTypography-root MuiTypography-h5 MuiCardHeader-title css-ol1ja4"><div class="MuiStack-root css-1gkfa3t" data-testid="BoardInfoCard_Stack"><span class="MuiTypography-root MuiTypography-base.subTitle1B css-1iqlcnz" data-testid="BoardInfoCard_Typography">실시간 매출 현황</span>
  </div></span>
  
  </div>
  </div><div class="MuiCardContent-root css-bjeup0" data-testid="BoardInfoCard_CardContent"><div class="MuiGrid-root MuiGrid-container css-1d3bbye" data-testid="RealTimeSalesStatus_Grid_1"><div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 css-he9kdn" data-testid="RealTimeSalesStatus_Grid_2"><div class="MuiTableContainer-root css-1j4pt9b" data-testid="HighlightTable_TableContainer"><table class="MuiTable-root highlight highlight-list-low css-abr37k" data-testid="HighlightTable_Table"><thead class="MuiTableHead-root css-1wbz3t9" data-testid="HighlightTable_TableHead"><tr class="MuiTableRow-root MuiTableRow-head css-1u6a08m" data-testid="HighlightTable_TableRow"><th class="MuiTableCell-root MuiTableCell-head MuiTableCell-alignRight MuiTableCell-paddingNone MuiTableCell-sizeMedium css-1atnbx2" scope="col" data-testid="HighlightTable_TableCell"><span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-1y2y1ny" data-testid="HighlightTable_Typography">구분</span></th><th class="MuiTableCell-root MuiTableCell-head MuiTableCell-alignRight MuiTableCell-paddingNone MuiTableCell-sizeMedium css-1atnbx2" scope="col" data-testid="HighlightTable_TableCell"><span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-1y2y1ny" data-testid="HighlightTable_Typography">오늘</span></th><th class="MuiTableCell-root MuiTableCell-head MuiTableCell-alignRight MuiTableCell-paddingNone MuiTableCell-sizeMedium css-1atnbx2" scope="col" data-testid="HighlightTable_TableCell"><span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-1y2y1ny" data-testid="HighlightTable_Typography">최근 30일</span></th>
  <th class="MuiTableCell-root MuiTableCell-head MuiTableCell-alignLeft MuiTableCell-paddingNone MuiTableCell-sizeMedium css-tj07zx" scope="col" data-testid="HighlightTable_TableCell">
  <span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-1y2y1ny" data-testid="HighlightTable_Typography">바로가기</span></th></tr></thead>
  
  <tbody class="MuiTableBody-root css-1xnox0e" data-testid="HighlightTable_TableBody">
  <tr class="MuiTableRow-root css-1e1lt7w" data-testid="HighlightTableRow_TableRow">
  <td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignCenter MuiTableCell-sizeMedium css-1lsabfx" data-testid="HighlightTableRow_TableCell">
  <hr class="MuiDivider-root MuiDivider-fullWidth MuiDivider-vertical css-aqzz99" data-testid="HighlightTableRow_Divider">
  <div class="MuiStack-root css-udwogp" data-testid="HighlightTableRow_Stack">
  <span class="MuiTypography-root MuiTypography-base.subTitle2B css-1i9amdt" data-testid="HighlightTableRow_Typography">총 주문 금액</span>
  </div>
  </td>
  <td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignCenter MuiTableCell-sizeMedium css-1lsabfx" data-testid="HighlightTableRow_TableCell">
  <div class="MuiStack-root css-8ka3aj" data-testid="HighlightTableCell_Stack">
  <div class="MuiStack-root css-lamwhn" data-testid="HighlightTableCell_Stack_1">
  <a class="MuiTypography-root MuiTypography-custom.h6BH MuiLink-root MuiLink-underlineAlways css-sdodfs"> <fmt:formatNumber value="${order_price }" type="number"/></a>
  <span class="MuiTypography-root MuiTypography-custom.body1H css-grko2a" data-testid="HighlightTableCell_Typography">원</span>
  </div>
  
  
  <div class="MuiStack-root css-1mzerio" data-testid="HighlightTableCell_Stack_2">
  <div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoBluePurpleLow MuiChip-filledDecoBluePurpleLow css-pm13i0">
  <span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${order_qty }" type="number"/>건</span></div></div></div></td>
  
  <td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignCenter MuiTableCell-sizeMedium css-1lsabfx" >
  <div class="MuiStack-root css-8ka3aj" data-testid="HighlightTableCell_Stack">
  <div class="MuiStack-root css-lamwhn" data-testid="HighlightTableCell_Stack_1">
  <a class="MuiTypography-root MuiTypography-custom.h6BH MuiLink-root MuiLink-underlineAlways css-13xs5pa"> <fmt:formatNumber value="${order_price_30 }" type="number"/></a>
  <span class="MuiTypography-root MuiTypography-custom.body1H css-grko2a" data-testid="HighlightTableCell_Typography">원</span>
  </div><div class="MuiStack-root css-1mzerio" data-testid="HighlightTableCell_Stack_2">
  <div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoRedPurpleLow MuiChip-filledDecoRedPurpleLow css-19w345y" data-gtm="TODO_Realtime_month_sales_status" data-testid="HighlightTableCell_Chip">
  <span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${order_qty_30 }" type="number"/>건</span></div></div></div></td>
  
  <td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignCenter MuiTableCell-sizeMedium css-1lsabfx" >
  <a class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedBaseLow MuiButton-sizeX2Small MuiButton-containedSizeX2Small MuiButton-root MuiButton-contained MuiButton-containedBaseLow MuiButton-sizeX2Small MuiButton-containedSizeX2Small css-1s1f4ox" tabindex="0" data-gtm="TODO_Realtime_order_check" href="Controller?type=adtotalorder" data-testid="HighlightTableRow_Button">주문조회</a>
  </td></tr>
  
  <tr class="MuiTableRow-root css-1fe8a7f" data-testid="HighlightTableRow_TableRow"><td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignCenter MuiTableCell-sizeMedium css-1lsabfx" data-testid="HighlightTableRow_TableCell"><hr class="MuiDivider-root MuiDivider-fullWidth MuiDivider-vertical css-aqzz99" data-testid="HighlightTableRow_Divider"><div class="MuiStack-root css-udwogp" data-testid="HighlightTableRow_Stack"><span class="MuiTypography-root MuiTypography-base.subTitle2B css-1i9amdt" data-testid="HighlightTableRow_Typography">총 실 결제 금액</span><div class="css-1r5gb7q e1irxonl6"><div lang="ko_KR" class="css-udaan e1irxonl5"><button type="button" role="button" lang="ko_KR" data-gtm="TODO_Realtime_actual_amount_tip" class="css-9cqkax e1irxonl4"></button><div class=" css-1rpel5e e1irxonl3"><div class=" css-8ji9zs e1irxonl2"></div><button type="button" class="css-bwa5a9 e1irxonl1"></button><span class="css-xloucr e1irxonl0"></span></div></div></div></div></td><td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignCenter MuiTableCell-sizeMedium css-1lsabfx" data-testid="HighlightTableRow_TableCell"><div class="MuiStack-root css-8ka3aj" data-testid="HighlightTableCell_Stack"><div class="MuiStack-root css-lamwhn" data-testid="HighlightTableCell_Stack_1">
  <a class="MuiTypography-root MuiTypography-custom.h6BH MuiLink-root MuiLink-underlineAlways css-sdodfs"><fmt:formatNumber value="${changed_price}" type="number"/></a>
  <span class="MuiTypography-root MuiTypography-custom.body1H css-grko2a" data-testid="HighlightTableCell_Typography">원</span></div>
  <div class="MuiStack-root css-1mzerio" data-testid="HighlightTableCell_Stack_2">
  <div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoBluePurpleLow MuiChip-filledDecoBluePurpleLow css-pm13i0" data-gtm="TODO_Realtime_today_actual_amount" data-testid="HighlightTableCell_Chip">
  <span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${changed_qty }" type="number"/>건</span>
  </div></div></div></td>
  <td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignCenter MuiTableCell-sizeMedium css-1lsabfx" data-testid="HighlightTableRow_TableCell">
  <div class="MuiStack-root css-8ka3aj" data-testid="HighlightTableCell_Stack">
  <div class="MuiStack-root css-lamwhn" data-testid="HighlightTableCell_Stack_1">
  <a class="MuiTypography-root MuiTypography-custom.h6BH MuiLink-root MuiLink-underlineAlways css-13xs5pa"><fmt:formatNumber value="${changed_price_30 }" type="number"/></a>
  <span class="MuiTypography-root MuiTypography-custom.body1H css-grko2a" data-testid="HighlightTableCell_Typography">원</span></div>
  <div class="MuiStack-root css-1mzerio" data-testid="HighlightTableCell_Stack_2">
  <div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoRedPurpleLow MuiChip-filledDecoRedPurpleLow css-19w345y" data-gtm="TODO_Realtime_month_actual_amount" data-testid="HighlightTableCell_Chip">
  <span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${changed_qty_30 }" type="number"/>건</span></div></div></div></td>
  <td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignCenter MuiTableCell-sizeMedium css-1lsabfx" data-testid="HighlightTableRow_TableCell">
  <a class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedBaseLow MuiButton-sizeX2Small MuiButton-containedSizeX2Small MuiButton-root MuiButton-contained MuiButton-containedBaseLow MuiButton-sizeX2Small MuiButton-containedSizeX2Small css-1s1f4ox" tabindex="0" data-gtm="TODO_Realtime_payment_check" href="Controller?type=adtotalorder" data-testid="HighlightTableRow_Button">결제조회</a></td></tr>
  
  
  <tr class="MuiTableRow-root css-7nzvog" data-testid="HighlightTableRow_TableRow">
  <td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignCenter MuiTableCell-sizeMedium css-1lsabfx" data-testid="HighlightTableRow_TableCell">
  <hr class="MuiDivider-root MuiDivider-fullWidth MuiDivider-vertical css-ccvyr1" data-testid="HighlightTableRow_Divider">
  <div class="MuiStack-root css-udwogp" data-testid="HighlightTableRow_Stack">
  <span class="MuiTypography-root MuiTypography-base.subTitle2M css-18ktvil" data-testid="HighlightTableRow_Typography">총 환불 금액</span>
  <div class="css-1r5gb7q e1irxonl6"><div lang="ko_KR" class="css-udaan e1irxonl5">
  <button type="button" role="button" lang="ko_KR" data-gtm="TODO_Realtime_refund_amount_tip" class="css-9cqkax e1irxonl4"></button>
  <div class=" css-1rpel5e e1irxonl3"><div class=" css-8ji9zs e1irxonl2"></div>
  <button type="button" class="css-bwa5a9 e1irxonl1"></button><span class="css-xloucr e1irxonl0"></span></div></div></div></div>
  </td><td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignCenter MuiTableCell-sizeMedium css-1lsabfx" data-testid="HighlightTableRow_TableCell">
  <div class="MuiStack-root css-8ka3aj" data-testid="HighlightTableCell_Stack"><div class="MuiStack-root css-lamwhn" data-testid="HighlightTableCell_Stack_1">
  <a class="MuiTypography-root MuiTypography-custom.h6BH MuiLink-root MuiLink-underlineAlways css-sdodfs" > <fmt:formatNumber value="${cancel_price }" type="number"/></a>
  <span class="MuiTypography-root MuiTypography-custom.body1H css-grko2a" data-testid="HighlightTableCell_Typography">원</span>
  </div><div class="MuiStack-root css-1mzerio" data-testid="HighlightTableCell_Stack_2">
  <div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoBluePurpleLow MuiChip-filledDecoBluePurpleLow css-pm13i0" data-gtm="TODO_Realtime_today_refund_amount" data-testid="HighlightTableCell_Chip"><span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${cancel_qty}" type="number"/>건</span></div></div></div></td>
  <td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignCenter MuiTableCell-sizeMedium css-1lsabfx" data-testid="HighlightTableRow_TableCell"><div class="MuiStack-root css-8ka3aj" data-testid="HighlightTableCell_Stack"><div class="MuiStack-root css-lamwhn" data-testid="HighlightTableCell_Stack_1">
  <a class="MuiTypography-root MuiTypography-custom.h6BH MuiLink-root MuiLink-underlineAlways css-13xs5pa"><fmt:formatNumber value="${cancel_price_30 }" type="number"/></a><span class="MuiTypography-root MuiTypography-custom.body1H css-grko2a" data-testid="HighlightTableCell_Typography">원</span></div>
  <div class="MuiStack-root css-1mzerio" data-testid="HighlightTableCell_Stack_2">
  <div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoRedPurpleLow MuiChip-filledDecoRedPurpleLow css-19w345y" data-gtm="TODO_Realtime_month_refund_amount" data-testid="HighlightTableCell_Chip">
  <span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${cancel_qty_30 }" type="number"/>건</span></div></div></div></td><td class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignCenter MuiTableCell-sizeMedium css-1lsabfx" data-testid="HighlightTableRow_TableCell"><a class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedBaseLow MuiButton-sizeX2Small MuiButton-containedSizeX2Small MuiButton-root MuiButton-contained MuiButton-containedBaseLow MuiButton-sizeX2Small MuiButton-containedSizeX2Small css-1s1f4ox" tabindex="0" data-gtm="TODO_Realtime_refund_check" href="/admin/php/shop1/s_new/order_cash_refund_f.php?rows=20&amp;searchSorting=order_desc&amp;btnDate=9999&amp;date_type=refund_date&amp;memberType=1&amp;shop_no_order=1&amp;orderStatus[]=T&amp;RefundType=all&amp;incoming=T&amp;realclick=T&amp;tabStatus=T&amp;initSearchFlag=T&amp;year1=2024&amp;month1=07&amp;day1=10&amp;year2=2024&amp;month2=07&amp;day2=10&amp;start_date=2024-07-10&amp;end_date=2024-07-10&amp;start_time=00:00&amp;end_time=23:59" data-testid="HighlightTableRow_Button">환불조회</a></td></tr></tbody></table></div></div></div></div></div></div>
  
<!-- 하단 오늘할일 -->  
  <div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 css-he9kdn" style="margin-top: 50px;">
				<div class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation1 MuiCard-root css-10kzmkx">
					<div class="MuiCardHeader-root css-1cg1x61">
						<div class="MuiCardHeader-content css-11qjisw">
							<span class="MuiTypography-root MuiTypography-h5 MuiCardHeader-title css-ol1ja4">
								<div class="MuiStack-root css-1wtl5jp">
									<span class="MuiTypography-root MuiTypography-base.subTitle1B css-1iqlcnz">오늘의 할 일</span>
									<div class="css-1r5gb7q e1irxonl6">
										<div lang="ko_KR" class="css-udaan e1irxonl5">
										<button type="button" lang="ko_KR"class="css-9cqkax e1irxonl4"></button>
											<div class=" css-1rpel5e e1irxonl3">
												<div class=" css-8ji9zs e1irxonl2"></div>
												<button type="button" class="css-bwa5a9 e1irxonl1"></button>
												<span class="css-xloucr e1irxonl0"></span>
											</div>
										</div>
									</div>
								</div>
							</span>
						</div>
					</div>
					<div class="MuiCardContent-root css-bjeup0">
						<div class="MuiGrid-root MuiGrid-container css-1on9dlm">
							<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-true css-r3xjrv">
								<div class="MuiStack-root css-nw2i60">
									<div class="MuiStack-root css-1b6n4o1">
										<div class="MuiStack-root css-zhmvqp">
											<span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-168a1n3">배송 준비중</span>
										</div>
										<div class="MuiStack-root css-278aby">
											<a class="MuiTypography-root MuiTypography-custom.subTitle3BH MuiLink-root MuiLink-underlineAlways css-zkh9pm" href="#">${requestScope.status_vo.d_ready }</a>
										</div>
									</div>
								</div>
							</div>
							<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-true css-r3xjrv">
								<div class="MuiStack-root css-nw2i60">
									<div class="MuiStack-root css-1b6n4o1">
										<div class="MuiStack-root css-zhmvqp">
											<span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-168a1n3">배송중</span>
										</div>
										<div class="MuiStack-root css-278aby">
											<a class="MuiTypography-root MuiTypography-custom.subTitle3BH MuiLink-root MuiLink-underlineAlways css-zkh9pm" href="#">${requestScope.status_vo.d_ing }</a>
										</div>
									</div>
								</div>
							</div>
							
							<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-true css-r3xjrv">
								<div class="MuiStack-root css-nw2i60">
									<div class="MuiStack-root css-1b6n4o1">
										<div class="MuiStack-root css-zhmvqp">
											<span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-168a1n3">배송완료</span>
										</div>
										<div class="MuiStack-root css-278aby">
											<a class="MuiTypography-root MuiTypography-custom.subTitle3BH MuiLink-root MuiLink-underlineAlways css-zkh9pm" href="#">${requestScope.status_vo.d_end}</a>
										</div>
									</div>
								</div>
							</div>
							<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-true css-r3xjrv">
								<div class="MuiStack-root css-nw2i60">
									<div class="MuiStack-root css-1b6n4o1">
										<div class="MuiStack-root css-zhmvqp">
											<span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-168a1n3">구매확정</span>
										</div>
										<div class="MuiStack-root css-278aby">
											<a class="MuiTypography-root MuiTypography-custom.subTitle3BH MuiLink-root MuiLink-underlineAlways css-zkh9pm" href="#">${requestScope.status_vo.d_confirm}</a>
										</div>
									</div>
								</div>
							</div>
							<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-true css-r3xjrv">
								<div class="MuiStack-root css-nw2i60" style="background-color: rgb(254, 246, 248)">
									<div class="MuiStack-root css-1b6n4o1">
										<div class="MuiStack-root css-zhmvqp">
											<span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-168a1n3">취소신청</span>
										</div>
										<div class="MuiStack-root css-278aby">
											<a style="color: rgb(215, 25, 82);" class="MuiTypography-root MuiTypography-custom.subTitle3BH MuiLink-root MuiLink-underlineAlways css-zkh9pm" href="#">${requestScope.status_vo.cancel_qty}</a>
										</div>
									</div>
								</div>
							</div>
							<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-true css-r3xjrv">
								<div class="MuiStack-root css-nw2i60" style="background-color: rgb(254, 246, 248)">
									<div class="MuiStack-root css-1b6n4o1">
										<div class="MuiStack-root css-zhmvqp">
											<span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-168a1n3">교환신청</span>
										</div>
										<div class="MuiStack-root css-278aby">
											<a style="color: rgb(215, 25, 82);" class="MuiTypography-root MuiTypography-custom.subTitle3BH MuiLink-root MuiLink-underlineAlways css-zkh9pm" href="#">${requestScope.status_vo.exchange_qty}</a>
										</div>
									</div>
								</div>
							</div>
							<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-true css-r3xjrv">
								<div class="MuiStack-root css-nw2i60" style="background-color: rgb(254, 246, 248)">
									<div class="MuiStack-root css-1b6n4o1">
										<div class="MuiStack-root css-zhmvqp">
											<span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-168a1n3">환불신청</span>
										</div>
										<div class="MuiStack-root css-278aby">
											<a style="color: rgb(215, 25, 82);" class="MuiTypography-root MuiTypography-custom.subTitle3BH MuiLink-root MuiLink-underlineAlways css-zkh9pm" href="#">${requestScope.status_vo.refund_qty }</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- 하단 오늘할일 -->
  </div></div><div class="css-0 eve68q64"></div></div>
		<!-- 여기까지 content -->
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
    function updateTime() {
        const options = {
            timeZone: 'Asia/Seoul',
            year: 'numeric',
            month: '2-digit',
            day: '2-digit',
            hour: '2-digit',
            minute: '2-digit',
            second: '2-digit'
        };
        const formatter = new Intl.DateTimeFormat([], options);
        const now = new Date();
        document.getElementById('currentTime').textContent = formatter.format(now);
    }

    setInterval(updateTime, 1000); // 매초 업데이트
    updateTime(); // 페이지 로드 시 초기 시간 설정
</script>
	
</body>
</html>