<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!--@layout(/layout/basic/main.html)-->
 <%@ include file="/layout/main.jsp" %>
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
<style>
#container {
    position: relative;
    width: 100%;
    height: 100%;
    padding: 56px 0 0 256px;
    box-sizing: border-box;
    background-color: #f4f5f8;
    transition: padding 0.3s;
}
#content {
    min-height: 750px;
    min-width: 960px;
    padding: 24px 24px 100px;
    vertical-align: top;
    box-sizing: border-box;
}
.headingArea {
    position: relative;
    margin: 0 0 16px;
}
.headingArea h1 {
    position: relative;
    display: inline-block;
    padding: 0 2px 0 0;
    height: 32px;
    line-height: 32px;
    color: #1b1e26;
    font-size: 20px;
    vertical-align: middle;
}
.optionArea {
    margin: 0 0 16px;
    clear: both;
}
html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
    margin: 0;
    padding: 0;
}
.mOption table {
    line-height: 18px;
    background-color: #fff;
}

table {
    table-layout: fixed;
    width: 100%;
    border: 0;
    border-spacing: 0;
    border-collapse: collapse;
}
colgroup {
    display: table-column-group;
    unicode-bidi: isolate;
}
<colgroup>
                    <col style="width:170px;">
                    <col style="width:auto;">
                    <col style="width:170px;">
                    <col style="width:auto;">
</colgroup>
tbody {
    display: table-row-group;
    vertical-align: middle;
    unicode-bidi: isolate;
    border-color: inherit;
}
tr {
    display: table-row;
    vertical-align: inherit;
    unicode-bidi: isolate;
    border-color: inherit;
}
.mOption th {
    font-weight: normal;
    vertical-align: middle;
    background-color: #fafafb;
}

.mOption th, .mOption td {
    height: 28px;
    padding: 8px;
    border: 1px solid #d9dadc;
    text-align: left;
}
element.style {
    position: relative;
}
.mOption th, .mOption td {
    height: 28px;
    padding: 8px;
    border: 1px solid #d9dadc;
    text-align: left;
}
:root [class*='duet-date-theme'] {
    --duet-color-primary: #D6DAE1;
    --duet-color-text: #1B1E26;
    --duet-color-text-active: #fff;
    --duet-color-placeholder: #666;
    --duet-color-button: #fff;
    --duet-color-surface: #fff;
    --duet-color-overlay: rgba(0, 0, 0, 0.8);
    --duet-font: "Noto Sans KR", "맑은 고딕", "malgun gothic", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
    --duet-font-normal: 400;
    --duet-font-bold: 600;
    --duet-radius: 0px;
    --duet-z-index: 600;
}

.duet-date-picker-grid {
    display: inline-block;
    max-width: 500px;
}
.hydrated {
    visibility: inherit;
}


<style>
.duet-date *, .duet-date *::before, .duet-date *::after {
    box-sizing: border-box;
    margin: 0;
    width: auto;
}
.mOption th {
    font-weight: normal;
    vertical-align: middle;
    background-color: #fafafb;
}

.mOption th, .mOption td {
    height: 28px;
    padding: 8px;
    border: 1px solid #d9dadc;
    text-align: left;
}
.mOption th, .mOption td {
    height: 28px;
    padding: 8px;
    border: 1px solid #d9dadc;
    text-align: left;
}

th, td {
    border: 0;
    word-wrap: break-word;
}
.mOptionToogle {
    position: relative;
    margin: 0 0 42px;
}

<style>
.duet-date *, .duet-date *::before, .duet-date *::after {
    box-sizing: border-box;
    margin: 0;
    width: auto;
}
.mButton {
    margin: 10px 0 0 0;
    padding: 0 4px 0 0;
    text-align: right;
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
		                			<a id="QA_Lnb_Menu1681" href=Controller?type=adorder class="link order" name="주문">주문</a>
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
		                			<a id="QA_Lnb_Menu2060" href="#none" class="link calculate" name="통계">통계</a>
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
                                	<li class=" ">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=adorder" class="link ">
				                            <span class="ellips">주문 대시보드</span>
				                        </a>
                    				</li>                                                                     
                                	<li class=" ">
				                   		<a id="QA_Lnb_Menu10395" href="Controller?type=adtotalorder" class="link ">
				                            <span class="ellips">전체 주문조회</span>
				                        </a>
                    				</li>                                                                     
                                	<li class="">
				                   		<a id="QA_Lnb_Menu10396" href="Controller?type=adbeforedeli" class="link ">
				                            <span class="ellips">배송 준비중 관리</span>
				                        </a>
                    				</li>                                                                     
                                	<li class="">
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
                                	<li class="hasChild show inSelect ">
		                                <a data-gtm="LNB_75" id="QA_Lnb_Menu75" href="Controller?type=otherorder_cancel" menuno="75" treeno="290" class="link " targetframe="F">
		                                    <span class="ellips">취소/교환/반품/환불</span>
		                                </a>
		                                <!-- LNB 3depth -->
		                                <ul class="depth3">
		                                	<li class="selected">
                                                <a data-gtm="LNB_76" id="QA_Lnb_Menu76" href="Controller?type=otherorder_cancel" menuno="76" treeno="292" class="link " targetframe="F">
                                                    <span class="ellips">취소 관리</span>
                                                </a>
                                            </li>
                                            <li class=" ">
                                                <a data-gtm="LNB_77" id="QA_Lnb_Menu77" href="Controller?type=otherorder_exchange" menuno="77" treeno="294" class="link " targetframe="F">
                                                    <span class="ellips">교환 관리</span>
                                                </a>
                                            </li>
                                            <li class=" ">
                                                <a data-gtm="LNB_78" id="QA_Lnb_Menu78" href="Controller?type=otherorder_return" menuno="78" treeno="295" class="link " targetframe="F">
                                                    <span class="ellips">반품 관리</span>
                                                </a>
                                            </li>
                                            <li class=" ">
                                                <a data-gtm="LNB_79" id="QA_Lnb_Menu79" href="Controller?type=otherorder_refund" menuno="79" treeno="296" class="link " targetframe="F">
                                                    <span class="ellips">환불 관리</span>
                                                </a>
                                            </li>
                                            </ul>
                            </li>
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
		<div id="content">
            <iframe src="about:blank" name="paymentActionIframe" id="paymentActionIframe" style="display:none;margin-top:30px;margin-right:30px;height:450px;" frameborder="0"></iframe>
            <form id="ExcelCreateRequestPopUp" name="ExcelCreateRequestPopUp" target="" action="" method="post">
            <input type="hidden" id="excel_request" name="excel_request" value="order">        <input type="hidden" id="excel_location" name="excel_location" value="shipped_begin_list">    <input type="hidden" id="excel_where" name="excel_where" value=""> </form>

            <form name="frm" method="post" action="shipped_begin_list.php">
                <input type="hidden" name="realclick" id="realclick" value="F">
                <input type="hidden" name="tabclick" id="tabclick" value="F">
                <input type="hidden" name="listKeyType" id="listKeyType" value="om_no">
                <input type="hidden" name="print_select_nos">
                <input type="hidden" name="listType" id="listType" value="">
                <input type="hidden" id="listName" value="shipped_begin_list">
                <input type="hidden" name="keyType" id="keyType" value="om_no">
                <input type="hidden" name="queryString" id="queryString" value="rows=20&amp;searchSorting=order_desc&amp;eResponseInfo=&amp;isBusanCall=&amp;isChinaCall=&amp;orderCallnum=&amp;cticall=&amp;realclick=&amp;tabclick=&amp;searchStatusType=&amp;MSK=&amp;MSV=&amp;orderStatusPayment=all&amp;date_type=order_date&amp;btnDate=7&amp;product_search_type=&amp;find_option=&amp;order_product_name=&amp;order_product_code=&amp;order_product_no=&amp;order_product_text=&amp;order_set_product_no=&amp;layer_order_product_code=&amp;layer_order_product_opt_id=&amp;popup_item_code=&amp;popup_product_code=&amp;payed=&amp;payed_sql_version=1&amp;bank_info=&amp;memberType=1&amp;group_no=&amp;isMemAuth=&amp;isBlackList=&amp;isFirstOrder=&amp;isPointfyUsedMember=&amp;shipment_type=all&amp;bunch=&amp;shippedAgain=&amp;shipmentMessage=&amp;delivSeperated=&amp;isReservedOrder=&amp;isSubscriptionOrder=&amp;paystandard=choice&amp;product_total_price1=&amp;product_total_price2=&amp;item_count_start=&amp;item_count_end=&amp;orderPathType=A&amp;search_SaleOpenMarket=&amp;mkSaleType=M&amp;mkSaleTypeChg=&amp;inflowPathType=A&amp;inflowPath=&amp;inflowPathGroup=&amp;inflowPathDetail=&amp;paymethodType=A&amp;paymentMethod=&amp;pgListType=A&amp;pgList=&amp;paymentInfo=&amp;discountMethod=&amp;discountCode=&amp;shop_no_order=1&amp;delvReady=&amp;delvCancel=&amp;orderStatusNotPayCancel=&amp;orderStatusCancel=&amp;orderSearchCancelStatus=&amp;orderStatusExchange=&amp;orderSearchExchangeStatus=&amp;orderStatusReturn=&amp;orderStatusRefund=&amp;orderSearchRefundStatus=&amp;orderSearchShipStatus=&amp;orderStatus[]=all&amp;RefundType=all&amp;RefundSubType=all&amp;sc_id=all&amp;second_shipping_company_id=all&amp;ShipCompanyId=all&amp;SecondShipCompanyId=all&amp;HopeShipCompanyId=all&amp;post_express_flag=all&amp;tabStatus=all&amp;rejectedUndoneStatus=&amp;paymethod_total_count=&amp;search_invoice_print_flag=all&amp;search_is_escrow_shipping_registered=all&amp;search_print_second_invoice=all&amp;incoming=&amp;is_purchased=all&amp;order_fail_code=&amp;isBlackOrder=&amp;start_date=2024-06-25&amp;year1=2024&amp;month1=06&amp;day1=25&amp;start_time=00:00:00&amp;end_date=2024-07-02&amp;year2=2024&amp;month2=07&amp;day2=02&amp;end_time=23:59:59&amp;realclick=T">
                <input type="hidden" name="isOpenMarketCancled" id="isOpenMarketCancled" value="">
                <input type="hidden" id="pageName" value="shipped_begin_list">
                <input type="hidden" name="bPrdPrepareUse" value="">
                <input type="hidden" name="bExpressFlag" value="">
                <input type="hidden" id="cur_page" value="1">
                <input type="hidden" name="excel_private_auth" id="excel_private_auth" value="T">
                <input type="hidden" name="excel_public_auth" id="excel_public_auth" value="T">
                <input type="hidden" name="navi_hide" value="">
                <input type="hidden" name="mallId" value="sist001">
                <input type="hidden" name="shopNo" value="1">

                <script id="check_down"></script>
                <!-- 참고 : Frame 구분 시 컨텐츠 시작 -->
                <div class="headingArea">
                    <div class="mTitle">
                                                <h1>취소 관리</h1>
                    </div>
                    <div class="mBreadcrumb">
                        <ol>
                                                        <li class="home">홈</li><li class="" ="867"="">주문</li> <li title="현재 위치"><strong>배송 준비중 관리</strong></li>
                                                    </ol>
                    </div>
                                    </div>
               
                    
                                <!-- ECHOSTING-507840 -->
                <!-- 마켓모드 -->
                
 

<script type="text/javascript" src="/ind-script/moment.php?convert=T&amp;vs=19.547.3.20240701.RLS"></script>
<input type="hidden" id="listShopNo" value="1">
<input type="hidden" id="isUpgradeAfter" value="T">
<input type="hidden" id="isSDE" value="T">
<input type="hidden" id="searchPage" name="searchPage" value="shipped_begin_list">
<input type="hidden" id="menu_no" name="menu_no" value="72">
<input type="hidden" id="sSearchDetailView" name="sSearchDetailView" value="F">
<input type="hidden" id="bIsNewProduct" value="1">
<input type="hidden" id="bOneYearSearchExcept" value="">
<input type="hidden" id="bOrderPrivOrderSearch" value="T">
<input type="hidden" id="searched_shop_no" name="searched_shop_no" value="1">
<input type="hidden" id="sIsBusanCallCenter" name="sIsBusanCallCenter" value="">
<input type="hidden" id="sOrderSearchLimit" name="sOrderSearchLimit" value="">
<input type="hidden" id="sOrderSearchLimitWhole" name="sOrderSearchLimitWhole" value="">
<input type="hidden" id="sIsOrderSearchNotAllowed" name="sIsOrderSearchNotAllowed" value="F">
<input type="hidden" id="sIsSearchWordLength" name="sIsSearchWordLength" value="">
<input type="hidden" id="searchTimeUsed" name="searchTimeUsed" value="F">
<input type="hidden" id="bExistColdData" name="bExistColdData" value="">
<input type="hidden" id="sIsUseDirectSearch" name="sIsUseDirectSearch" value="T">
<div class="optionArea " id="QA_deposit1">

            <div class="mOption">
            <table border="1" summary="">
                <caption>주문 검색</caption>
                <colgroup>
                    <col style="width:170px;">
                    <col style="width:auto;">
                    <col style="width:170px;">
                    <col style="width:auto;">
                </colgroup>
                <tbody>
                
                                                                
                                                                                <tr>
                    <th scope="row">
                        기간
                                            </th>
                    <td colspan="3" style="position:relative;">
                                                <select name="date_type" style="width:115px;" class="fSelect disabled">
                                                            <option value="order_date">주문일</option>
                                                                                            <option value="memo_date">메모작성일</option>
                                                                                            <option value="pay_date" selected="selected">결제일</option>
                                                                                            <option value="shipready_date">송장번호 입력일</option>
                                                                                            <option value="shipbegin_date">배송시작일</option>
                                                                                            <option value="shipend_date">배송완료일</option>
                                                            
                        </select>
                                                    <a href="#none" class="btnDate   " date-interval="0"><span>오늘</span></a>
                                                    <a href="#none" class="btnDate   " date-interval="1"><span>어제</span></a>
                                                    <a href="#none" class="btnDate   " date-interval="3"><span>3일</span></a>
                                                    <a href="#none" class="btnDate  selected " date-interval="7"><span>7일</span></a>
                                                    <a href="#none" class="btnDate   " date-interval="15"><span>15일</span></a>
                                                    <a href="#none" class="btnDate   " date-interval="30"><span>1개월</span></a>
                                                    <a href="#none" class="btnDate   " date-interval="90"><span>3개월</span></a>
                                                    <a href="#none" class="btnDate   " date-interval="180"><span>6개월</span></a>
                        
                        
                        <a href="#ordOption5" class="btnNormal eLayerClick ec-order-list-search-period"><span>기간 설정</span></a>
                        <input type="hidden" name="today" id="today" value="2024-07-02">

                        <div class="duet-date-message-layer direction" style="top: -26px;left: 525px; z-index:99; display:none;">
                            <p class="msg">올바른 날짜를 입력하세요.</p>
                        </div>
                    </td>
                </tr>
                                <tr>
                    <th scope="row">
                        검색어
                                                    <div class="cTip" code="OR.SM.DD.40"><div class="mTooltip gLarge">
    <button type="button" class="icon eTip">도움말</button>
    <div class="tooltip" style="z-index : 1; ">
        <div class="content"></div>
<button type="button" class="close eClose">닫기</button>
        <span class="edge"></span>
    </div>
</div>
</div>
                                            </th>
                    <td colspan="3">
                        <div id="mainSearch">
                                                            <div class="keywordSearchSelect">
                                    <select class="fSelect" name="MSK[]" style="width:163px;">
                                                                                    <option value="choice">-검색항목선택-</option>
                                                                                    <option value="order_id" selected="">주문번호</option>
                                                                                    <option value="ord_item_code">품목별 주문번호</option>
                                                                                    <option value="delivery_code">배송번호</option>
                                                                                    <option value="invoice_no">운송장번호</option>
                                                                                    <option value="s_order_info">마켓주문번호</option>
                                                                                    <option value="line1">-----------------</option>
                                                                                    <option value="o_name">주문자명</option>
                                                                                    <option value="member_id">주문자 아이디</option>
                                                                                    <option value="member_email">회원 이메일</option>
                                                                                    <option value="o_email">주문서 이메일</option>
                                                                                    <option value="o_phone2">주문자 휴대전화</option>
                                                                                    <option value="o_phone1">주문자 일반전화</option>
                                                                                    <option value="client_ip">주문자 IP</option>
                                                                                    <option value="line2">-----------------</option>
                                                                                    <option value="c_p_name">입금자명</option>
                                                                                    <option value="r_name">수령자명</option>
                                                                                    <option value="r_phone2">수령자 휴대전화</option>
                                                                                    <option value="r_phone1">수령자 일반전화</option>
                                                                                    <option value="r_addr">배송지 주소</option>
                                                                                    <option value="ord_add_item">주문서 추가항목</option>
                                                                                    <option value="all_name">주문자명, 입금자명, 수령자명</option>
                                                                                    <option value="r_safe_phone">0504 안심번호</option>
                                                                                    <option value="line3">-----------------</option>
                                                                                    <option value="product_name">상품명</option>
                                                                                    <option value="product_code">상품코드</option>
                                                                                    <option value="item_code">품목코드</option>
                                                                                    <option value="product_tag">상품태그</option>
                                                                                    <option value="manufacturer_name">제조사</option>
                                                                                    <option value="supplier_name">공급사</option>
                                                                                    <option value="line4">-----------------</option>
                                                                                    <option value="msg_writer_name">메모 작성자명</option>
                                                                                    <option value="msg_writer_id">메모 작성자 아이디</option>
                                                                                    <option value="msg">메모 내용</option>
                                                                                    <option value="line5">-----------------</option>
                                                                                    <option value="labels">주문 라벨</option>
                                                                            </select>
                                    <input type="text" class="fText sBaseSearchBox eSearchText" name="MSV[]" id="sBaseSearchBox" style="width:400px;">

                                    <a href="#none" class="btnIcon icoPlus"><span>추가</span></a>
                                    <a href="#none" class="btnNormal productSearchBtn" style="display:none;"><span>상품찾기 <em class="icoLink"></em></span></a>
                                    <input type="hidden" name="order_product_no[]" id="eOrderProductNo" value="">
                                    <input type="hidden" name="find_option[]" value="product_no">
                                </div>
                                                    </div>
                    </td>
                </tr>
                                                                                                                </tbody>
            </table>
        </div>


                            <div class="mOption gDivision">
                <table border="1" summary="">
                    <caption>주문 검색</caption>
                    <colgroup>
                        <col style="width:170px;">
                        <col style="width:auto;">
                        <col style="width:170px;">
                        <col style="width:auto;">
                    </colgroup>
                    <tbody>
                    
                    <tr>
                                                <th scope="row">할인수단</th>
                        <td>
                            <div class="mNewDropSelect">
                                <div class="value">
                                    <p>선택 안 함</p>
                                    <button type="button" class="btnCover eDropSelect"></button>
                                </div>
                                <div class="result" style="top: 2px;">
                                    <ul class="list">
                                        <li class="all selected">
                                            <label class="gLabel"><input type="checkbox" class="fChk" id="discountMethodAll"> 전체</label>
                                            <ul>
                                                                                                    <li>
                                                        <label class="gLabel">
                                                            <input type="checkbox" class="fChk" name="discountMethod[]" value="mileage" data-input-text=""> 적립금
                                                        </label>
                                                                                                            </li>
                                                                                                    <li>
                                                        <label class="gLabel">
                                                            <input type="checkbox" class="fChk" name="discountMethod[]" value="deposit" data-input-text=""> 예치금
                                                        </label>
                                                                                                            </li>
                                                                                                    <li>
                                                        <label class="gLabel">
                                                            <input type="checkbox" class="fChk" name="discountMethod[]" value="coupon" data-input-text=""> 쿠폰
                                                        </label>
                                                                                                            </li>
                                                                                                    <li>
                                                        <label class="gLabel">
                                                            <input type="checkbox" class="fChk" name="discountMethod[]" value="market" data-input-text=""> 마켓할인
                                                        </label>
                                                                                                            </li>
                                                                                                    <li>
                                                        <label class="gLabel" style="padding-right:5px;">
                                                            <input type="checkbox" class="fChk" name="discountMethod[]" value="discount_code" data-input-text="discountCode"> 할인코드
                                                        </label>
                                                                                                                    <label class="gLabel"><input type="text" class="fText" name="discountCode" id="discountCode" placeholder="할인코드(입력코드)를 입력하세요." value="" style="width:200px;display:none;"></label>
                                                                                                            </li>
                                                                                            </ul>

                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </td>
                                                <th scope="row">결제수단</th>
                        <td>
                            <div class="mNewDropSelect">
                                <div class="value">
                                    <p>전체</p>
                                    <button type="button" class="btnCover eDropSelect"></button>
                                </div>
                                <div class="result" style="top: 2px;">
                                    <ul class="list">
                                        <li class="all selected">
                                            <input type="hidden" value="deprecated" name="paymethodType">
                                            <label class="gLabel eSelected"><input type="checkbox" value="all" name="paymentMethod[]" checked="" class="fChk"> 전체</label>
                                            <ul>
                                                                                                    <li><label class="gLabel eSelected"><input type="checkbox" class="fChk paymentMethod" name="paymentMethod[]" value="cash" checked="checked"> 무통장입금</label></li>
                                                                                                    <li><label class="gLabel eSelected"><input type="checkbox" class="fChk paymentMethod" name="paymentMethod[]" value="card" checked="checked"> 신용카드</label></li>
                                                                                                    <li><label class="gLabel eSelected"><input type="checkbox" class="fChk paymentMethod" name="paymentMethod[]" value="tcash" checked="checked"> 계좌이체</label></li>
                                                                                                    <li><label class="gLabel eSelected"><input type="checkbox" class="fChk paymentMethod" name="paymentMethod[]" value="icash" checked="checked"> 가상계좌</label></li>
                                                                                                    <li><label class="gLabel eSelected"><input type="checkbox" class="fChk paymentMethod" name="paymentMethod[]" value="cell" checked="checked"> 휴대폰</label></li>
                                                                                                    <li><label class="gLabel eSelected"><input type="checkbox" class="fChk paymentMethod" name="paymentMethod[]" value="deferpay" checked="checked"> 후불</label></li>
                                                                                                    <li><label class="gLabel eSelected"><input type="checkbox" class="fChk paymentMethod" name="paymentMethod[]" value="cvs" checked="checked"> 편의점</label></li>
                                                                                                    <li><label class="gLabel eSelected"><input type="checkbox" class="fChk paymentMethod" name="paymentMethod[]" value="point" checked="checked"> 선불금</label></li>
                                                                                                    <li><label class="gLabel eSelected"><input type="checkbox" class="fChk paymentMethod" name="paymentMethod[]" value="mileage" checked="checked"> 적립금</label></li>
                                                                                                    <li><label class="gLabel eSelected"><input type="checkbox" class="fChk paymentMethod" name="paymentMethod[]" value="deposit" checked="checked"> 예치금</label></li>
                                                                                                    <li><label class="gLabel eSelected"><input type="checkbox" class="fChk paymentMethod" name="paymentMethod[]" value="etc" checked="checked"> 기타</label></li>
                                                                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </td>
                    </tr>
                                             <tr>
                                                        <th scope="row">
    금액조건
        <div class="cTip" code="OR.SM.DD.70"><div class="mTooltip gLarge">
    <button type="button" class="icon eTip">도움말</button>
    <div class="tooltip" style="z-index : 1; ">
        <div class="content"></div>
<button type="button" class="close eClose">닫기</button>
        <span class="edge"></span>
    </div>
</div>
</div>
    </th>
<td>
    <select class="fSelect" name="paystandard" id="ePayStandard">
                        <option value="total">총상품구매금액</option>
                                                        <option value="totalord">총주문금액</option>
                                <option value="realpay">총실결제금액</option>
                                <option value="product_price">판매가</option>
                    </select>
    <input type="text" name="product_total_price1" id="product_total_price1" class="fText right" value="" style="width:65px;"> <span class="ec-mode-common-period-area">~</span>
    <input type="text" name="product_total_price2" id="product_total_price2" class="fText right" value="" style="width:65px;">
</td>                                                        <th scope="row">주문품목수</th>
                            <td>
                                <input type="text" class="fText right" name="item_count_start" id="item_count_start" value="" style="width:90px;">
                                <span class="ec-mode-common-period-area"> ~</span>
                                <input type="text" class="fText right" name="item_count_end" id="item_count_end" value="" style="width:90px;">
                            </td>
                        </tr>
                                        <tr>
                                                <th scope="row">배송범위/특이사항</th>
                        <td>
                            <div class="mNewDropSelect">
                                <div class="value">
                                    <p>국내배송,해외배송</p>
                                    <button type="button" class="btnCover eDropSelect"></button>
                                </div>
                                <div class="result" id="shipmentUI" style="top: 2px;">
                                    <ul class="list">
                                        <li class="all">
                                            <label class="gLabel">
                                                <input type="checkbox" name="shipment_all" class="fChk" value="1"> 전체
                                            </label>
                                        </li>
                                                                                <li class="selected" id="shipmentType">

                                            <label class="gLabel eSelected">
                                                <input type="checkbox" name="shipment_type[]" value="all" id="shipmentTypeAll" class="fChk"> 배송범위
                                            </label>
                                            <button type="button" class="btnCover eDropSelect"></button>
                                            <ul>
                                                <li><label class="gLabel eSelected"><input type="checkbox" name="shipment_type[]" value="local" class="fChk" checked=""> 국내배송</label></li>
                                                <li><label class="gLabel eSelected"><input type="checkbox" name="shipment_type[]" value="overseas" class="fChk" checked=""> 해외배송</label></li>
                                            </ul>
                                        </li>
                                                                                <li class="selected" id="shipmentSpecial">
                                            <label class="gLabel"><input type="checkbox" name="shipment_special" class="fChk" value="1"> 배송특이사항</label>
                                            <button type="button" class="btnCover eDropSelect"></button>
                                            <ul>
                                                                                                                                                    <li><label class="gLabel"><input type="checkbox" name="bunch" class="fChk" value="1"> 묶음배송</label></li>
                                                    <li><label class="gLabel"><input type="checkbox" name="shippedAgain" class="fChk" value="1"> 재배송</label></li>
                                                                                                <li><label class="gLabel"><input type="checkbox" name="shipmentMessage" value="1" class="fChk"> 배송메시지 입력</label></li>
                                                                                                    <li><label class="gLabel"><input type="checkbox" name="delivSeperated" class="fChk" value="1"> 부분배송</label></li>
                                                                                                                                                    <li><label class="gLabel"><input type="checkbox" name="isReservedOrder" value="1" class="fChk"> 예약주문</label></li>
                                                                                                <li><label class="gLabel"><input type="checkbox" name="isSubscriptionOrder" value="1" class="fChk"> 정기배송(결제)</label></li>
                                            </ul>
                                        </li>

                                    </ul>
                                </div>
                            </div>

                        </td>

                                                <th scope="row">희망배송업체</th>
                        <td>
                                                        <div class="mNewDropSelect" id="hopeShippingCompanyByShop">
                                <div class="value">
                                    <p>선택 안 함</p>
                                    <button type="button" class="btnCover eDropSelect "></button>
                                </div>
                                <div class="result" style="top: 2px;">
                                    <ul class="list">
                                        <li class="all selected">
                                            <label class="gLabel"><input type="checkbox" class="fChk" name="HopeShipCompanyId[]" value="all"> 전체</label>
                                            <ul>
                                                                                                    <li><label class="gLabel"><input type="checkbox" name="HopeShipCompanyId[]" class="fChk" value="3"> 우체국택배</label></li>
                                                                                                    <li><label class="gLabel"><input type="checkbox" name="HopeShipCompanyId[]" class="fChk" value="4"> CJ대한통운</label></li>
                                                                                                    <li><label class="gLabel"><input type="checkbox" name="HopeShipCompanyId[]" class="fChk" value="5"> 한진택배</label></li>
                                                                                                    <li><label class="gLabel"><input type="checkbox" name="HopeShipCompanyId[]" class="fChk" value="6"> 롯데글로벌로지스</label></li>
                                                                                                    <li><label class="gLabel"><input type="checkbox" name="HopeShipCompanyId[]" class="fChk" value="7"> 로젠택배</label></li>
                                                                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                                                        <label><select class="fSelect" style="display:none;min-width:250px;max-width:100%;" disabled="disabled">
                                    <option value="disabled">선택 안 함</option></select></label>
                        </td>

                    </tr>

                    <tr>
                                                                                                    <th scope="row">회원구분</th>
<td>
            <div class="mNewDropSelect">
            <div class="value">
                <p>선택 안 함</p>
                <button type="button" class="btnCover eDropSelect"></button>
            </div>
            <div class="result" style="top: 2px; overflow-y: initial;">
                <ul class="list" id="memberTypeSelectUl">
                    <li class="all">
                        <label class="gLabel"><input type="checkbox" id="memberTypeAll" name="memberType[]" value="1" class="fChk"> 전체</label>
                    </li>
                                        <li class="selected" id="memberGroupList">
                        <input type="checkbox" value="2" name="memberType[]" id="memberType2" style="display:none">
                        <label class="gLabel"><input type="checkbox" name="group_no[]" value="all" class="fChk">  회원</label>
                        <button type="button" class="btnCover eDropSelect"></button>
                        <ul>
                                                        <li><label class="gLabel"><input type="checkbox" name="group_no[]" class="fChk" value="1"> 일반회원</label></li>
                                                    </ul>
                    </li>
                                        <li class="selected">
                        <label class="gLabel"><input type="checkbox" id="nonMember" value="3" name="memberType[]" class="fChk"> 비회원</label>
                    </li>
                </ul>
            </div>
        </div>
            </td>
                                                                        <th scope="row">회원특이사항</th>
                        <td>
                            <div class="mNewDropSelect">
                                <div class="value">
                                    <p>선택 안 함</p>
                                    <button type="button" class="btnCover eDropSelect"></button>
                                </div>
                                <div class="result" style="top: 2px;">
                                    <ul class="list">
                                        <li class="all selected">
                                            <label class="gLabel"><input type="checkbox" class="fChk"> 전체</label>
                                            <ul>
                                                <li><label class="gLabel"><input type="checkbox" name="isMemAuth" value="1" class="fChk"> 특별관리회원</label></li>
                                                <li><label class="gLabel"><input type="checkbox" name="isBlackList" value="1" class="fChk"> 불량회원</label></li>
                                                <li><label class="gLabel"><input type="checkbox" name="isFirstOrder" value="1" class="fChk"> 첫주문</label></li>
                                                                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                                                <th scope="row">결제업체</th>
                        <td>
                            <div class="mNewDropSelect">
                                <div class="value">
                                    <p>전체</p>
                                    <button type="button" class="btnCover eDropSelect"></button>
                                </div>
                                <div class="result" style="top: 2px;">
                                    <ul class="list">
                                        <li class="all selected">
                                            <input type="hidden" name="pgListType" value="deprecated">
                                            <label class="gLabel eSelected"><input type="checkbox" class="fChk" value="all" name="pgList[]" checked=""> 전체</label>
                                            <ul>
                                                                                                                                                            <li><label class="gLabel eSelected"><input type="checkbox" class="fChk pgList" name="pgList[]" value="cod" checked="checked"> 배송받고 직접결제 (COD)</label></li>
                                                                                                            <li><label class="gLabel eSelected"><input type="checkbox" class="fChk pgList" name="pgList[]" value="etc" checked="checked"> 기타</label></li>
                                                                                                                                                </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </td>
                                                <th scope="row">결제특이사항</th>
                        <td>
                            <div class="mNewDropSelect">
                                <div class="value">
                                    <p>선택 안 함</p>
                                    <button type="button" class="btnCover eDropSelect"></button>
                                </div>
                                <div class="result" style="top: 2px;">
                                    <ul class="list">
                                        <li class="all selected">
                                            <label class="gLabel"><input type="checkbox" class="fChk"> 전체</label>
                                            <ul>
                                                                                                    <li><label class="gLabel"><input type="checkbox" class="fChk" name="paymentInfo[]" value="is_escrow"> 에스크로</label></li>
                                                                                                    <li><label class="gLabel"><input type="checkbox" class="fChk" name="paymentInfo[]" value="is_eguarantee"> 전자보증보험</label></li>
                                                                                                    <li><label class="gLabel"><input type="checkbox" class="fChk" name="paymentInfo[]" value="add_payment"> 추가결제</label></li>
                                                                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
                    

    

    <div class="mButton gCenter">
                <a href="#none" id="search_button" class="btnSearch"><span>검색</span></a>
        <div id="ordProgress" class="mLoading">
            <p>처리중입니다. 잠시만 기다려 주세요.</p>
                            <img src="//img.echosting.cafe24.com/suio/ico_loading.gif" alt="">
                    </div>
    </div>

    <input type="hidden" name="main_search" id="main_search" value="">
</div>
<div class="section" id="QA_inquiry2">
                                            <div class="mTab typeTab eTab">
                            <ul>
                                <li class="selected"><a href="#none" id="eOrdNumTab">주문번호별</a></li>
                                <li><a href="#none" id="ePrdNumTab">품목주문별</a></li>
                            </ul>
                        </div>
                                        <div id="tabNumber" class="tabCont">
                        <div class="mState typeHeader">
                            <div class="gLeft">
                                                            </div>
                        </div>
                        <div class="mCtrl typeSetting setting">
                            <div class="gLeft">
                                                                                            </div>
                            <div class="gRight">
                                <label><input type="checkbox" id="eResponseInfo" class="fChk"> 수령자 정보 표시</label>
                                <select name="searchSorting" class="fSelect">
                                    <option value="order_asc">주문일순</option>
                                    <option value="order_desc" selected="">주문일역순</option>
                                                                            <option value="settle_price_asc">총 실결제금액순</option>
                                        <option value="settle_price_desc">총 실결제금액역순</option>
                                                                    </select>
                                <select name="rows" class="fSelect" init_rows="20">
                                    <option value="10">10개씩보기</option>
                                    <option value="20" selected="" }="">20개씩보기</option>
                                    <option value="30">30개씩보기</option>
                                    <option value="50">50개씩보기</option>
                                    <option value="100">100개씩보기</option>
                                    <option value="200">200개씩보기</option>
                                    <option value="300">300개씩보기</option>
                                    <option value="500">500개씩보기</option>
                                </select>
                            </div>
                        </div>
                        <div id="searchResultList" class="mBoard typeOrder typeList gScroll gCellSingle">
                            <table border="1" summary="" class="thead">
                                <caption>전체주문 조회 목록</caption>
                                <tbody>
                                <tr>
                                    <th scope="col" class="w24"><input type="checkbox" id="allChk"></th>
                                    <th scope="col" class="w50" style="display:none;">No</th>
                                                                                                            <th scope="col" class="w120" style="">주문일(결제일)</th>
                                    <th scope="col" class="w120" style="">주문번호</th>
                                    <th scope="col" class="w95" style="">주문자 <div class="cTip eSmartMode" code="OD.AO.170"></div></th>
                                    <th scope="col" class="w95" style="display:none;">
                                        사업자 회원 정보
                                    </th>
                                    <th scope="col" class="w120" style="">상품명</th>
                                                                        <th scope="col" class="w105" style="">총 상품구매금액</th>
                                                                        <th scope="col" class="w105" style="display:none;">총 주문금액</th>
                                    <th scope="col" class="w105" style="">총 실결제금액</th>
                                    <th scope="col" class="w60" style="">결제수단</th>
                                    <th scope="col" class="w55" style="">결제상태</th>
                                                                        <th scope="col" class="w45" style="">미배송</th>
                                    <th scope="col" class="w45" style="">배송중</th>
                                    <th scope="col" class="w50" style="">배송완료</th>
                                    <th scope="col" class="w60" style="display:none;">구매 확정</th>
                                    <th scope="col" class="w45" style="">취소</th>
                                    <th scope="col" class="w45" style="">교환</th>
                                                                        <th scope="col" class="w45" style="">반품</th>
                                                                            <th scope="col" class="w90" style=" ">목록삭제</th>
                                                                        <th scope="col" class="w35" style="">메모</th>
                                </tr>
                                </tbody>
                            </table>
                                                                                                <table border="1" summary="">
                                        <caption>전체주문 조회 목록</caption>
                                        <tbody class="empty">
                                        <tr>
                                            <td colspan="17">검색된 주문내역이 없습니다.</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                                            
                        </div>
                        <div class="mPaginate">
                            <ol><li><strong>1</strong></li></ol>
                        </div>
                                            </div>
                </div>
                                <iframe border="0" frameborder="0" height="0" name="print_orders" src="" width="0"></iframe>
                                
                <div id="shippingCompanyNumberListPopup" class="mLayer gSmall">
                    <h2>배송 업체 번호</h2>
                    <div class="wrap scroll">
                        <div class="mBoard">
                            <table border="1" summary="">
                                <caption>배송 업체 번호</caption>
                                <colgroup>
                                    <col style="width:auto;">
                                    <col style="width:190px;">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">배송 업체</th>
                                    <th scope="col">배송 업체 번호</th>
                                </tr>
                                </thead>
                                <tbody class="center">
                                                                    <tr>
                                        <td>
                                                                                            우체국택배
                                                                                        <!-- ECHOSTING-467550 -->
                                                                                            <span class="icoDefault">기본</span>
                                                                                    </td>
                                        <td>3</td>
                                    </tr>
                                                                    <tr>
                                        <td>
                                                                                            자체배송
                                                                                        <!-- ECHOSTING-467550 -->
                                                                                    </td>
                                        <td>2</td>
                                    </tr>
                                                                    <tr>
                                        <td>
                                                                                            CJ대한통운
                                                                                        <!-- ECHOSTING-467550 -->
                                                                                    </td>
                                        <td>4</td>
                                    </tr>
                                                                    <tr>
                                        <td>
                                                                                            한진택배
                                                                                        <!-- ECHOSTING-467550 -->
                                                                                    </td>
                                        <td>5</td>
                                    </tr>
                                                                    <tr>
                                        <td>
                                                                                            롯데글로벌로지스
                                                                                        <!-- ECHOSTING-467550 -->
                                                                                    </td>
                                        <td>6</td>
                                    </tr>
                                                                    <tr>
                                        <td>
                                                                                            로젠택배
                                                                                        <!-- ECHOSTING-467550 -->
                                                                                    </td>
                                        <td>7</td>
                                    </tr>
                                                                </tbody>
                            </table>
                        </div>
                    </div>
                    <button type="button" id="shippingCompanyNumberListPopupClose" class="btnClose eClose">닫기</button>
                </div>
                

 


                
                
                
                <!-- 라벨 팝업 -->
                <input type="hidden" id="labelAutoSearchListOpen" value="F">

<div id="layerAddOrder" class="mLayer typeSpacing gSmall" style="width: 432px; left: 50%; margin-left: -216px; top: 534.5px; display: none;">
    <h2>주문 라벨 일괄 추가</h2>
    <div class="wrap">
        <div class="mBox typeBorder">
            <strong>품목별 주문번호 : </strong><span class="orderLabelItemCodes"></span>
        </div>
        <div class="mTitle">
            <h3>추가할 라벨</h3>
        </div>
        <div class="searchBox">
            <div class="mSearch">
                <div class="search">
                    <input id="addLabelSearch" type="text" class="fText eFocus" placeholder="라벨을 입력하세요.">
                    <button type="button" class="btnReset eReset" style="display: none;">초기화</button>
                    <div class="dropdown">
                        <ul class="option">

                        </ul>
                    </div>
                </div>
                <a href="#none" class="btnNormal" id="applyAddLabel"><span>적용</span></a>
            </div>
            <div class="mBubble">
                <ul class="bubbleList">

                </ul>

            </div>
        </div>
    </div>
    <div class="footer gFixed">
        <div class="left">
            <a href="/disp/admin/shop1/Order/LabelManage" class="txtEmLink">라벨 관리<i class="icoArrow"></i></a>
        </div>
        <div class="right">
            <a href="javascript:void(0)" class="btnNormal eClose"><span>닫기</span></a>
            <a href="javascript:void(0)" class="btnCtrl" id="saveAddLabelChange"><span>저장</span></a>
        </div>
    </div>
    <button type="button" class="btnClose eClose">닫기</button>
</div>

<div id="layerEditOrder" class="mLayer typeSpacing gSmall" style="width: 432px; left: 50%; margin-left: -216px; top: 321.5px;">
    <h2>주문 라벨 편집</h2>
    <div class="wrap">
        <div class="mBox typeBorder">
            <strong>품목별 주문번호 : </strong><span class="orderLabelEditItemCode"></span>
        </div>
        <div class="mTitle">
            <h3>추가할 라벨</h3>
        </div>
        <div class="searchBox">
            <div class="mSearch">
                <div class="search">
                    <input id="editLabelSearch" type="text" class="fText eFocus" placeholder="라벨을 입력하세요.">
                    <button type="button" class="btnReset eReset" style="display: none;">초기화</button>
                    <div class="dropdown">
                        <ul class="option">

                        </ul>
                    </div>
                </div>
                <a href="#none" class="btnNormal" id="applyEditLabel"><span>적용</span></a>
            </div>
            <div class="mBubble">
                <ul class="bubbleList">

                </ul>
            </div>
        </div>
    </div>
    <div class="footer gFixed">
        <div class="left">
            <a href="/disp/admin/shop1/Order/LabelManage" class="txtEmLink">라벨 관리<i class="icoArrow"></i></a>
        </div>
        <div class="right">
            <a href="javascript:void(0)" class="btnNormal eClose"><span>닫기</span></a>
            <a href="javascript:void(0)" class="btnCtrl" id="saveEditLabelChange"><span>저장</span></a>
        </div>
    </div>
    <button type="button" class="btnClose eClose">닫기</button>
</div>

<div id="layerRemoveOrder" class="mLayer typeSpacing gSmall" style="width:432px;">
    <h2>주문 라벨 일괄 제거</h2>
    <div class="wrap">
        <div class="mBox typeBorder">
            <strong>품목별 주문번호 : </strong><span class="orderLabelItemCodes"></span>
        </div>
        <div class="mTitle">
            <h3>제거할 라벨</h3>
        </div>
        <div class="searchBox">
            <div class="mSearch">
                <div class="search">
                    <input id="removeLabelSearch" type="text" class="fText eFocus" placeholder="라벨을 입력하세요.">
                    <button type="button" class="btnReset eReset" style="display: none;">초기화</button>
                    <div class="dropdown">
                        <ul class="option">

                        </ul>
                    </div>
                </div>
                <a href="#none" class="btnNormal" id="applyRemoveLabel"><span>적용</span></a>
            </div>
            <div class="mBubble">
                <ul class="bubbleList">

                </ul>
                <!--p class="empty">라벨을 확인하세요.</p-->
            </div>
        </div>
    </div>
    <div class="footer gFixed">
        <div class="left">
            <a href="/disp/admin/shop1/Order/LabelManage" class="txtEmLink">라벨 관리<i class="icoArrow"></i></a>
        </div>
        <div class="right">
            <a href="javascript:void(0)" class="btnNormal eClose"><span>닫기</span></a>
            <a href="javascript:void(0)" class="btnCtrl" id="saveRemoveLabelChange"><span>저장</span></a>
        </div>
    </div>
    <button type="button" class="btnClose eClose">닫기</button>
</div>



            <input type="hidden" id="do_init" value="T"></form>
            <form name="frm_sms" id="eSmsSendForm">
            </form>
        </div>
		<!-- 여기까지 content -->
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
document.getElementById("QA_Lnb_Menu75").addEventListener("click", function(event) {
    event.preventDefault(); // 기본 동작 막기
    var depth3Menu = document.getElementById("depth3Menu");
    if (depth3Menu.style.display === "none" || depth3Menu.style.display === "") {
        depth3Menu.style.display = "block";
    } else {
        depth3Menu.style.display = "none";
    }
});
</script>
	
</body>
</html> --%>