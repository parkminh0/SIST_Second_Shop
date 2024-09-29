<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" type="text/css" href="/shop/admin/css/statistic.css" media="all" charset="utf-8" />
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
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu1681" href="Controller?type=adorder" class="link order" name="주문">주문</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu2056" href="Controller?type=adproduct" class="link product" name="상품">상품</a>
		            			</li>
		                        <li class="hasChild">
		                			<a id="QA_Lnb_Menu6" href="Controller?type=aduser" class="link member" name="고객">고객</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu7" href="Controller?type=adbbs" class="link board" name="게시판">게시판</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu1250" href="Controller?type=adcoupon" class="link promotion" name="프로모션">쿠폰</a>
		            			</li>
		                       	<li class="hasChild show">
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
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=adstatistic" class="link ">
				                            <span class="ellips">통계 대시보드</span>
				                        </a>
                    				</li>                                                                     
                                	<li class="">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=adsalesanalyze" class="link ">
				                            <span class="ellips">매출분석</span>
				                        </a>
                    				</li>                                                                     
                                	<li class="">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=adproductanalyze" class="link ">
				                            <span class="ellips">상품분석</span>
				                        </a>
                    				</li>          
                    				<li class="">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=aduseranalyze" class="link ">
				                            <span class="ellips">고객분석</span>
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
       	<!-- 컨텐츠 시작 -->
        <div id="content">
            <span id="admngDebug"><script id="admngEffectScript" type="text/javascript" charset="utf-8" src="https://ad.cafe24.com/adManager/util/javascript/adMngEffect.js?ver=1.0.0"></script><script id="cookieScript" type="text/javascript" charset="utf-8" src="https://ad.cafe24.com/adManager/util/javascript/adMngCookie.js?ver=1.0.0"></script><script id="admngLayerScript" type="text/javascript" charset="utf-8" src="https://ad.cafe24.com/adManager/util/javascript/adMngLayer.js?ver=1.0.0"></script><link id="admngCSS" type="text/css" rel="stylesheet" href="https://ad.cafe24.com/adManager/util/javascript/admngCSS.css?ver=1.0.0"><script id="admngURLLog" type="text/javascript" src="https://ad.cafe24.com/adManager/controller/ConclusionURLAD.php?siteType=normal&amp;url=https%3A%2F%2Fbrother2703t.cafe24.com%2Fdisp%2Fadmin%2Fshop1%2Freport%2FToday"></script><script type="text/javascript" src="https://ad.cafe24.com/adManager/controller/ConclusionAD.php?siteType_ADParam=normal&amp;userID_ADParam=&amp;ckStr=&amp;ckAllStr=&amp;ckByMulti=false&amp;ssl=true&amp;admngAreaView=false&amp;charset=utf-8&amp;admngValue=0&amp;dummy=1720150568628&amp;groupIdx_ADParam=168"></script><script type="text/javascript" src="https://ad.cafe24.com/adManager/controller/ConclusionAD.php?siteType_ADParam=normal&amp;userID_ADParam=&amp;ckStr=&amp;ckAllStr=&amp;ckByMulti=false&amp;ssl=true&amp;admngAreaView=false&amp;charset=utf-8&amp;admngValue=0&amp;dummy=1720150568629&amp;groupIdx_ADParam=4992"></script><script type="text/javascript" src="https://ad.cafe24.com/adManager/controller/ConclusionAD.php?siteType_ADParam=malladmin&amp;userID_ADParam=&amp;ckStr=&amp;ckAllStr=&amp;ckByMulti=false&amp;ssl=true&amp;admngAreaView=false&amp;charset=utf-8&amp;admngValue=0&amp;dummy=1720150568629&amp;groupIdx_ADParam=5028"></script><script type="text/javascript" src="https://ad.cafe24.com/adManager/controller/ConclusionAD.php?siteType_ADParam=normal&amp;userID_ADParam=&amp;ckStr=&amp;ckAllStr=&amp;ckByMulti=false&amp;ssl=true&amp;admngAreaView=false&amp;charset=utf-8&amp;admngValue=0&amp;dummy=1720150568630&amp;groupIdx_ADParam=4964"></script><script type="text/javascript" src="https://ad.cafe24.com/adManager/controller/ConclusionAD.php?siteType_ADParam=normal&amp;userID_ADParam=&amp;ckStr=&amp;ckAllStr=&amp;ckByMulti=false&amp;ssl=true&amp;admngAreaView=false&amp;charset=utf-8&amp;admngValue=0&amp;dummy=1720150568630&amp;groupIdx_ADParam=4970"></script><script type="text/javascript" src="https://ad.cafe24.com/adManager/controller/ConclusionAD.php?siteType_ADParam=malladmin&amp;userID_ADParam=&amp;ckStr=&amp;ckAllStr=&amp;ckByMulti=false&amp;ssl=true&amp;admngAreaView=false&amp;charset=utf-8&amp;admngValue=0&amp;dummy=1720150568630&amp;groupIdx_ADParam=5003"></script><script type="text/javascript" src="https://ad.cafe24.com/adManager/controller/ConclusionAD.php?siteType_ADParam=malladmin&amp;userID_ADParam=&amp;ckStr=&amp;ckAllStr=&amp;ckByMulti=false&amp;ssl=true&amp;admngAreaView=false&amp;charset=utf-8&amp;admngValue=0&amp;dummy=1720150568631&amp;groupIdx_ADParam=5004"></script></span><span id="admngSide_9"></span><script id="admng" type="text/javascript" src="//ad.cafe24.com/adManager/logic/WebAnalysis.js?siteType=normal&amp;userID=&amp;groupIdx=168"></script>
            <span id="admngDebug"></span><span id="admngSide_19"></span><script id="admng" type="text/javascript" src="//ad.cafe24.com/adManager/logic/WebAnalysis.js?siteType=normal&amp;userID=&amp;groupIdx=4992"></script>
            <div class="headingArea gSubmain">
                <div class="mTitle">
                    <h1>Today 리포트</h1> 
                </div>
            </div>
            <div class="dashMain">
                <div class="mDashGrid">
                    <div class="grid">
                        <div class="mDashPannel">
                            <div class="header">
                                <div class="title">
                                	<h2>오늘의 순매출 현황</h2>
                                </div>
                                <span class="more" id="title_today">2024-07-05 금요일 </span>
                            </div>
                            <div class="total">
                                <strong class="price">
                                    <span class="number">
                                    	<fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.svo.changed_price}" />
                                    </span>
</span> 원                       </strong>
                            </div>
                            <div class="board gCell">
                                <table border="1" summary="">
                                    <caption>매출정보</caption>
                                    <colgroup>
                                        <col style="width:20%;"/>
                                        <col style="width:25%;"/>
                                        <col style="width:35%;"/>
                                        <col style="width:20%;"/>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th scope="row"><div class="title"><span class="icoDot"></span> 결제금액</div></th>
                                        <td class="right">
	                                        <strong class="txtEm">
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.svo.total_price}" />
											</strong>
										</td>
                                        <th scope="row"><div class="title"><span class="icoDot"></span> 환불금액</div></th>
                                        <td class="right"><strong class="txtEm">
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.svo.cancel_price}" />
										</strong></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><div class="title"><span class="icoDot"></span> 결제건수</div></th>
                                        <td class="right"><strong class="txtEm">
                                        	<fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.svo.od_qty}" />
                                        </strong></td>
                                        <th scope="row"><div class="title"><span class="icoDot"></span> 취소/교환/반품 수</div></th>
                                        <td class="right"><strong class="txtEm"><fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.svo.od_changed_qty}" /></strong></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><div class="title"><span class="icoDot"></span> 배송처리</div></th>
                                        <td class="right"><strong class="txtEm"><fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.svo.od_delivery_start}" /></strong></td>
                                        <th scope="row"><div class="title"><span class="icoDot"></span> 배송완료</div></th>
                                        <td class="right"><strong class="txtEm"><fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.svo.od_delivery_end}" /></strong></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="mDashGrid">
                    <div class="grid">
                        <div class="mTitle">
                            <h2>오늘 상품 판매량 순위 TOP 10</h2>
                            <a href="Controller?type=adproductanalyze" class="btnNormal gRight" data-gtm="DATA_today_product_sales_top10_more">
                            	<span>더보기 </span>
                           	</a>
                        </div>
                        <div class="mBoard">
                            <table border="1" summary="">
                                <caption>오늘 상품 판매량 순위 TOP 10</caption>
                                <colgroup>
                                    <col style="width:40px; *width:20px;"/>
                                    <col style="width:auto"/>
                                    <col style="width:130px; *width:110px;"/>
                                    <col style="width:60px; *width:40px;"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">상품명</th>
                                    <th scope="col">옵션</th>
                                    <th scope="col">개수</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="product" items="${requestScope.product_list}" varStatus="idx">
                                	<c:if test="${product.rnum < 3 }">
                               			<tr class="best">
                                	</c:if>
                                	<c:if test="${product.rnum > 3 }">
                               			<tr class="">
                                	</c:if>
	                                		<td class="no center">${product.rnum}</td>
			                                <td class="name">${product.prod_name }</td>
			                                <td><ul class="etc"><li>색상 : ${product.color }</li><li>사이즈 : ${product.size }</li></ul></td>
			                                <td class="right">${product.qty}</td>
                                		</tr>
                                </c:forEach>
                                </tbody>
                           	</table>
                            <c:if test="${requestScope.product_list eq null or f:length(requestScope.product_list) <= 0 }">
                            	<p class="empty">데이터가 없습니다.</p>
                            </c:if>
                    	</div>
                    </div>
                    <div class="grid">
                        <div class="mTitle">
                        	<h2>장바구니 담긴 순위 TOP10</h2>
                            <a href="Controller?type=adproductanalyze" class="btnNormal gRight" data-gtm="DATA_in_cart_top10_more">
                            	<span>더보기 </span>
                           	</a>
                        </div>
                        <div class="mBoard">
                            <table border="1" summary="">
                                <caption>장바구니 담긴 순위 TOP 10</caption>
                                <colgroup>
                                    <col style="width:40px; *width:20px;"/>
                                    <col style="width:auto"/>
                                    <col style="width:130px; *width:110px;"/>
                                    <col style="width:60px; *width:40px;"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">No.</th>
                                    <th scope="col">상품명</th>
                                    <th scope="col">옵션</th>
                                    <th scope="col">개수</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="basket" items="${requestScope.basket_list}" varStatus="idx">
                                	<c:if test="${basket.rnum < 3 }">
                               			<tr class="best">
                                	</c:if>
                                	<c:if test="${basket.rnum > 3 }">
                               			<tr class="">
                                	</c:if>
	                                		<td class="no center">${basket.rnum}</td>
			                                <td class="name">${basket.prod_name }</td>
			                                <td><ul class="etc"><li>색상 : ${basket.color }</li><li>사이즈 : ${basket.size }</li></ul></td>
			                                <td class="right">${basket.b_qty}</td>
                                		</tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <c:if test="${requestScope.basket_list eq null or f:length(requestScope.basket_list) <= 0 }">
                            	<p class="empty">데이터가 없습니다.</p>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
    	</div>
		<!-- 여기까지 content -->
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script>
	let today = new Date();
	$('#title_today').text(today.toISOString().substring(0, 10));
	
</script>
</body>
</html>