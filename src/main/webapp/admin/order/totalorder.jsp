<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>
.logo{
	margin : 20% 0%;
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
                                	<li class=" ">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=adorder" class="link ">
				                            <span class="ellips">주문 대시보드</span>
				                        </a>
                    				</li>                                                                     
                                	<li class="selected ">
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
                                	<li class=" ">
		                                <a data-gtm="LNB_75" id="QA_Lnb_Menu75" href="Controller?type=otherorder_cancel" menuno="75" treeno="290" class="link " targetframe="F">
		                                    <span class="ellips">취소/교환/반품/환불 관리</span>
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

            <form name="frm" method="post">
                <div class="headingArea">
                    <div class="mTitle">
                    	<h1>전체 주문조회</h1>
                    </div>
		        </div>
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
                    	<tr id="search_date">
				            <th scope="row">기간</th>
				            <td style="position: relative;" colspan="3">
				                <a href="#none" class="btnDate" data-days="0"><span>오늘</span></a>
				                <a href="#none" class="btnDate" data-days="1"><span>어제</span></a>
				                <a href="#none" class="btnDate" data-days="3"><span>3일</span></a>
				                <a href="#none" class="btnDate selected" data-days="7"><span>7일</span></a>
				                <a href="#none" class="btnDate" data-days="30"><span>1개월</span></a>
				                <a href="#none" class="btnDate" data-days="90"><span>3개월</span></a>
				                <a href="#none" class="btnDate" data-days="180"><span>6개월</span></a>
				                <div class="duet-date-picker-grid sun  duet-date-theme-ec-new ">
									<input type="date" name="start_date" id="start_date"/>				                    
									~
									<input type="date" name="end_date" id="end_date"/>		
				                </div>
				            </td>
				        </tr>
                        <tr>
		                    <th scope="row">
		                        검색어
                            </th>
		                    <td colspan="3">
		                        <div id="mainSearch">
                                	<div class="keywordSearchSelect">
	                                    <select class="fSelect" name="search_by" id="search_by" style="width:163px;">
	                                    		<option value="" selected>=====전체=====</option>
	                                            <option value="order_key" >주문번호</option>
	                                            <option value="od_waybill">운송장번호</option>
	                                            <option value="">-----------------</option>
	                                            <option value="name">주문자명</option>
	                                            <option value="id">주문자 아이디</option>
	                                            <option value="receiver">수령자명</option>
	                                    </select>
	                                    <input type="text" class="fText sBaseSearchBox eSearchText" name="search_text" id="search_text" style="width:400px;"/>
                                	</div>
                                </div>
		                    </td>
		                </tr>
	                </tbody>
	            </table>
       		</div>
			<div class="mButton gCenter">
                <a id="search_button" onclick="getList(0);" class="btnSearch"><span>검색</span></a>
    		</div>
		</div>
		<div class="section" id="QA_inquiry2">
			<div id="tabNumber" class="tabCont">
	       		<div class="mState typeHeader">
	       			<div class="gLeft">
	               		<div class="total">검색결과 :
	                   		<strong>1</strong>건
	                  	</div>
	               </div>
	           </div>
                <div id="searchResultList" class="mBoard typeOrder typeList gScroll gCellSingle">
                    <table border="1" summary="" class="thead">
                        <caption>전체주문 조회 목록</caption>
                        <tbody>
                        <tr>
                            <th scope="col" class="w120" style="">주문일</th>
                            <th scope="col" class="w120" style="">주문번호</th>
                            <th scope="col" class="w95" style="">주문자</th>
                            <th scope="col" class="w105" style="">총 상품구매금액</th>
                            <th scope="col" class="w105" style="">총 실결제금액</th>
                            <th scope="col" class="w60" style="">결제수단</th>
                            <th scope="col" class="w55" style="">결제상태</th>
                            <th scope="col" class="w45" style="">미배송</th>
                            <th scope="col" class="w45" style="">배송중</th>
                            <th scope="col" class="w50" style="">배송완료</th>
                            <th scope="col" class="w45" style="">취소</th>
                            <th scope="col" class="w45" style="">교환</th>
                            <th scope="col" class="w45" style="">반품</th>
                        </tr>
                        </tbody>
                    </table>
                    <div id="QA_product3">
	                    <table border="1" summary="">
	                        <caption>전체주문 조회 목록</caption>
	                        <tbody class="empty">
		                      <tr>
		                          <td colspan="14">검색된 주문내역이 없습니다.</td>
		                      </tr>
	                     	</tbody>
	                    </table>       
                    </div>    
                </div>
                
           	</div>
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
});

function getList(cPage){
	
	var frm = $("form").serialize();
	$.ajax({
		type:"post",
		url: "/shop/admin/statistic/useranalyzeIO.jsp?cPage="+cPage,
		data: frm,
	}).done(function(data){
		$("div#QA_product3").html(data);
		$("div#QA_product3").css('display', '');
	});
}
</script>
</body>
</html>