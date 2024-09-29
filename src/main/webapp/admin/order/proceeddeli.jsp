<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--@layout(/layout/basic/main.html)-->
<%-- <%@ include file="/layout/main.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="-1">
    <title>관리자 페이지</title>
    <link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/layout_beta.css?vs=2406261322" charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/reset_front.css?vs=2406261322" charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/suio.css?vs=2406261322" charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/dashboard_v3.css?vs=2406261322" charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/dashboard_v4.css?vs=2406261322" charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/plugin/jquery.mCustomScrollbar.min.css" media="all" charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="/shop/admin/css/index.css" media="all" charset="utf-8" />
<style>
	.logo {
	    margin: 20% 0%;
	}
	
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
	
	html,body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6, pre,code,form,fieldset,legend,input,textarea,p,blockquote,th,td,img {
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
	
	.mOption th,
	.mOption td {
	    height: 28px;
	    padding: 8px;
	    border: 1px solid #d9dadc;
	    text-align: left;
	}
	
	element.style {
	    position: relative;
	}
	
	.mOption th,
	.mOption td {
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
	    --duet-font: "Noto Sans KR", "맑은 고딕", "malgun gothic", -apple-system, BlinkMacSystemFont, "Segoe UI",
	        Roboto, Helvetica, Arial, sans-serif;
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
	    .duet-date *,
	    .duet-date *::before,
	    .duet-date *::after {
	        box-sizing: border-box;
	        margin: 0;
	        width: auto;
	    }
	
	    .mOption th {
	        font-weight: normal;
	        vertical-align: middle;
	        background-color: #fafafb;
	    }
	
	    .mOption th,
	    .mOption td {
	        height: 28px;
	        padding: 8px;
	        border: 1px solid #d9dadc;
	        text-align: left;
	    }
	
	    .mOption th,
	    .mOption td {
	        height: 28px;
	        padding: 8px;
	        border: 1px solid #d9dadc;
	        text-align: left;
	    }
	
	    th,
	    td {
	        border: 0;
	        word-wrap: break-word;
	    }
	
	    .mOptionToogle {
	        position: relative;
	        margin: 0 0 42px;
	    }
	
	    <style>
	        .duet-date *,
	        .duet-date *::before,
	        .duet-date *::after {
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
    <div id="wrap" class="beta">
        <hr class="layout" />
        <div id="container">
            <div id="sidebar">
                <div class="logo">
                    <h1>
                        <a href="Controller?type=adindex">
                            <img src="/shop/layout/header/img/logo_off_new.png" alt="" class="off -mov" width="200" />
                        </a>
                    </h1>
                </div>
                <div class="snbArea simple">
                    <div id="menuList" class="eCustomScrollbar">
                        <div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside">
                            <div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
                                style="position:relative; top:0; left:0;">
                                <ul class="menu">
                                    <li class="">
                                        <a id="QA_Lnb_Menu10258" href="Controller?type=adindex" class="link home"
                                            name="홈">홈</a>
                                    </li>
                                    <li class="hasChild show">
                                        <a id="QA_Lnb_Menu1681" href=Controller?type=adorder class="link order"
                                            name="주문">주문</a>
                                    </li>
                                    <li class="hasChild ">
                                        <a id="QA_Lnb_Menu2056" href="Controller?type=adproduct" class="link product"
                                            name="상품">상품</a>
                                    </li>
                                    <li class="hasChild ">
                                        <a id="QA_Lnb_Menu6" href="Controller?type=aduser" class="link member"
                                            name="고객">고객</a>
                                    </li>
                                    <li class="hasChild ">
                                        <a id="QA_Lnb_Menu7" href="Controller?type=adbbs" class="link board"
                                            name="게시판">게시판</a>
                                    </li>
                                    <li class="hasChild ">
                                        <a id="QA_Lnb_Menu1250" href="Controller?type=adcoupon" class="link promotion"
                                            name="프로모션">쿠폰</a>
                                    </li>
                                    <li class="hasChild ">
                                        <a id="QA_Lnb_Menu2060" href="#none" class="link calculate"
                                            name="통계">통계</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="subMenu eClone eCustomScrollbar mCustomScrollbar _mCS_3 mCS-autoHide mCS_no_scrollbar">
                        <div id="mCSB_3" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside"
                            style="max-height: 1016px;">
                            <div id="mCSB_3_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y"
                                style="position:relative; top:0; left:0;" dir="ltr">
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
                                            <a id="QA_Lnb_Menu10396" href="Controller?type=adbeforedeli"
                                                class="link ">
                                                <span class="ellips">배송 준비중 관리</span>
                                            </a>
                                        </li>
                                        <li class="selected">
                                            <a id="QA_Lnb_Menu10397" href="Controller?type=adproceeddeli"
                                                class="link ">
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
                                            <a data-gtm="LNB_75" id="QA_Lnb_Menu75" href="Controller?type=otherorder_cancel"
                                                menuno="75" treeno="290" class="link " targetframe="F">
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
                <div id="content">
                    <iframe src="about:blank" name="paymentActionIframe" id="paymentActionIframe"
                        style="display:none;margin-top:30px;margin-right:30px;height:450px;" frameborder="0"></iframe>
                    <form id="ExcelCreateRequestPopUp" name="ExcelCreateRequestPopUp" target="" action="" method="post">
                        <input type="hidden" id="excel_request" name="excel_request" value="order" />
                        <input type="hidden" id="excel_location" name="excel_location" value="shipped_begin_list" />
                        <input type="hidden" id="excel_where" name="excel_where" value="" />
                    </form>

                    <form name="frm" method="post" action="shipped_begin_list.php">
                        <input type="hidden" name="realclick" id="realclick" value="F" />
                        <input type="hidden" name="tabclick" id="tabclick" value="F" />
                        <input type="hidden" name="listKeyType" id="listKeyType" value="om_no" />
                        <input type="hidden" name="print_select_nos" />
                        <input type="hidden" name="listType" id="listType" value="" />
                        <input type="hidden" id="listName" value="shipped_begin_list" />
                        <input type="hidden" name="keyType" id="keyType" value="om_no" />
                        <input type="hidden" name="queryString" id="queryString"
                            value="rows=20&amp;searchSorting=order_desc&amp;eResponseInfo=&amp;isBusanCall=&amp;isChinaCall=&amp;orderCallnum=&amp;cticall=&amp;realclick=&amp;tabclick=&amp;searchStatusType=&amp;MSK=&amp;MSV=&amp;orderStatusPayment=all&amp;date_type=order_date&amp;btnDate=7&amp;product_search_type=&amp;find_option=&amp;order_product_name=&amp;order_product_code=&amp;order_product_no=&amp;order_product_text=&amp;order_set_product_no=&amp;layer_order_product_code=&amp;layer_order_product_opt_id=&amp;popup_item_code=&amp;popup_product_code=&amp;payed=&amp;payed_sql_version=1&amp;bank_info=&amp;memberType=1&amp;group_no=&amp;isMemAuth=&amp;isBlackList=&amp;isFirstOrder=&amp;isPointfyUsedMember=&amp;shipment_type=all&amp;bunch=&amp;shippedAgain=&amp;shipmentMessage=&amp;delivSeperated=&amp;isReservedOrder=&amp;isSubscriptionOrder=&amp;paystandard=choice&amp;product_total_price1=&amp;product_total_price2=&amp;item_count_start=&amp;item_count_end=&amp;orderPathType=A&amp;search_SaleOpenMarket=&amp;mkSaleType=M&amp;mkSaleTypeChg=&amp;inflowPathType=A&amp;inflowPath=&amp;inflowPathGroup=&amp;inflowPathDetail=&amp;paymethodType=A&amp;paymentMethod=&amp;pgListType=A&amp;pgList=&amp;paymentInfo=&amp;discountMethod=&amp;discountCode=&amp;shop_no_order=1&amp;delvReady=&amp;delvCancel=&amp;orderStatusNotPayCancel=&amp;orderStatusCancel=&amp;orderSearchCancelStatus=&amp;orderStatusExchange=&amp;orderSearchExchangeStatus=&amp;orderStatusReturn=&amp;orderStatusRefund=&amp;orderSearchRefundStatus=&amp;orderSearchShipStatus=&amp;orderStatus[]=all&amp;RefundType=all&amp;RefundSubType=all&amp;sc_id=all&amp;second_shipping_company_id=all&amp;ShipCompanyId=all&amp;SecondShipCompanyId=all&amp;HopeShipCompanyId=all&amp;post_express_flag=all&amp;tabStatus=all&amp;rejectedUndoneStatus=&amp;paymethod_total_count=&amp;search_invoice_print_flag=all&amp;search_is_escrow_shipping_registered=all&amp;search_print_second_invoice=all&amp;incoming=&amp;is_purchased=all&amp;order_fail_code=&amp;isBlackOrder=&amp;start_date=2024-06-25&amp;year1=2024&amp;month1=06&amp;day1=25&amp;start_time=00:00:00&amp;end_date=2024-07-02&amp;year2=2024&amp;month2=07&amp;day2=02&amp;end_time=23:59:59&amp;realclick=T" />
                        <input type="hidden" name="isOpenMarketCancled" id="isOpenMarketCancled" value="" />
                        <input type="hidden" id="pageName" value="shipped_begin_list" />
                        <input type="hidden" name="bPrdPrepareUse" value="" />
                        <input type="hidden" name="bExpressFlag" value="" />
                        <input type="hidden" id="cur_page" value="1" />
                        <input type="hidden" name="excel_private_auth" id="excel_private_auth" value="T" />
                        <input type="hidden" name="excel_public_auth" id="excel_public_auth" value="T" />
                        <input type="hidden" name="navi_hide" value="" />
                        <input type="hidden" name="mallId" value="sist001" />
                        <input type="hidden" name="shopNo" value="1" />

                        <script id="check_down"></script>
                        <!-- 참고 : Frame 구분 시 컨텐츠 시작 -->
                        <div class="headingArea">
                            <div class="mTitle">
                                <h1>배송중 관리</h1>
                            </div>
                            <div class="mBreadcrumb">
                                <ol>
                                    <li class="home">홈</li>
                                    <li class="" ="867"="">주문</li>
                                    <li title="현재 위치"><strong>배송 준비중 관리</strong></li>
                                </ol>
                            </div>
                        </div>

                        <div class="optionArea " id="QA_deposit1">
                            <div class="mOption">
                                <table border="1" summary="">
                                    <caption>주문 검색</caption>
                                    <colgroup>
                                        <col style="width:170px;" />
                                        <col style="width:auto;" />
                                        <col style="width:170px;" />
                                        <col style="width:auto;" />
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row">조회 구분</th>
                                            <td>
                                                <select class="fSelect category eCategory" id="search_by" name="search_by">
                                                    <option value="">- 구분 선택 -</option>
                                                    <option value="1">배송준비중 관리 </option>
                                                    <option value="2">배송중 관리 </option>
                                                    <option value="3">배송완료 관리 </option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr id="search_date">
								            <th scope="row">기간</th>
								            <td colspan="3">
								                <div class="duet-date-picker-grid sun  duet-date-theme-ec-new ">
													<input type="date" name="start_date" id="start_date"/>				                    
													~
													<input type="date" name="end_date" id="end_date"/>		
								                </div>
								            </td>
								        </tr>
                                        <tr>
                                            <th scope="row">검색어</th>
                                            <td colspan="3">
                                                <div id="mainSearch">
                                                    <div class="keywordSearchSelect">
                                                        <select class="fSelect" name="search_type" style="width:163px;">
                                                            <option value="choice">-검색항목선택-</option>
                                                            <option id="order_key" value="order_key" selected="">주문번호</option>
                                                            <option id="receiver" value="receiver">주문자명</option>
                                                        </select>
                                                        <input name="search_text" type="text" class="fText sBaseSearchBox eSearchText"
                                                            name="MSV[]" id="sBaseSearchBox" style="width:400px;" />
                                                        <a href="#none" class="btnNormal productSearchBtn"
                                                            style="display:none;"><span>상품찾기 <em class="icoLink"></em></span></a>
                                                        <input type="hidden" name="order_product_no[]" id="eOrderProductNo"
                                                            value="" />
                                                        <input type="hidden" name="find_option[]" value="product_no" />
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
                        <div class="section" id="QA_prepareNumber2">
                            <div class="mTab typeTab">
                                <ul>
                                    <li class="selected"><a href="#none" id="QA_orderNumTab">주문번호별</a></li>
                                    <!-- 참고 : 상품준비중 사용 할 경우 삭제 -->
                                </ul>
                            </div>
                            <div class="mCtrl typeSetting setting">
                                <div class="gLeft">
                                </div>
                                <div class="gRight">
                                    <a href="#eNaverCheckoutOrderStatus" data-status="eShipStartBtn" id="eShipStartBtn"class="btnCtrl"><span>배송 완료 처리</span></a>
                                </div>
                                <div class="gSetting">
                                </div>
                            </div>
                            <div id="shipedReadyList" class="mBoard typeOrder gScroll gCellSingle typeList">
                                <table border="1" summary="" class="thead">
                                    <caption>배송준비중 관리 목록</caption>
                                    <thead>
                                        <tr>
					                        <th scope="col" class="w35"><input type="checkbox" id="allChk"></th>
					                        <th scope="col" class="w120" style="">주문번호</th>
					                        <th scope="col" class="w65" style="">주문일</th>
					                        <th scope="col" class="w80" style="">주문자 <div class="cTip eSmartMode" code="OD.OF.DD.200"></div></th>
					                        <th scope="col" class="w220" style="">상품명/옵션</th>
					                        <th scope="col" class="w30" style="width:px;">수량</th>
					                        <th scope="col" class="w100" style="">결제금액</th>
                                        </tr>
                                    </thead>
                                    <tbody class="empty">
                                        <tr>
                                            <td colspan="13">검색된 주문내역이 없습니다.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="mPaginate">
                            </div>
                        </div>
                        <iframe border="0" frameborder="0" height="0" name="print_orders" src="" width="0"></iframe>
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
let today = new Date();
let sevenDaysAgo = new Date();
sevenDaysAgo.setDate(today.getDate() - 7);
document.getElementById('end_date').value = today.toISOString().substring(0, 10);
document.getElementById('start_date').value = sevenDaysAgo.toISOString().substring(0, 10);

$(function(){
	$("a.btnDate").click(function(){
		let end_date = new Date($("#end_date").val());
		let minus_date = $(this).data("days");
		let tmp = new Date();
		tmp.setDate(end_date.getDate() - minus_date);
		let start_date = tmp.toISOString().substring(0, 10);
		$("#start_date").val(start_date);
		
		$("a.btnDate").removeClass("selected");
		$(this).addClass("selected");
	});

	$(".btnSearch").click(function(){
	    let frm = $("form").serialize();
	    console.log("frm:" + frm);
	    $.ajax({
	        url: "/shop/admin/order/deliIO.jsp",
	        type: "POST",
	        data: frm,
	        success: function (data) {
	        	$("#shipedReadyList").html($(data).find("#shipedReadyList").html());
                $(".mPaginate").html($(data).find(".mPaginate").html());
                console.log("success")
	        }
	    });
	});
	
	$("#search_by").change(function(){
        let titleMap = {
            "1": "배송준비중 관리",
            "2": "배송중 관리",
            "3": "배송완료 관리"
        };
        let selectedValue = $(this).val();
        let newTitle = titleMap[selectedValue] || "배송중 관리";
        $(".mTitle h1").text(newTitle);
    });


    $("#search_by").trigger("change");
});

/* function getList(cPage){
	if ($("#search_by").val() == null || $("#search_by").val() == ''){
		alert("조회 구분을 선택하세요");
		return;
	}
	
	var frm = $("form").serialize();
	$.ajax({
		type:"post",
		url: "/shop/admin/statistic/productanalyzeIO.jsp?cPage="+cPage,
		data: frm,
	}).done(function(data){
		$("div#QA_product3").html(data);
		$("div#QA_product3").css('display', '');
	});
} */
</script>
</body>
</html>
