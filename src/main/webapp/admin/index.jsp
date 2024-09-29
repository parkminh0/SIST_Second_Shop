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
</head>
<style>
.logo{
	margin : 20% 0%;
}
.MuiTypography-root.MuiTypography-base.subTitle1B {
    font-size: 30px; /* Adjust the size as needed */
  }
</style>
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
			<div class="snbArea ">
				<div id="menuList" class="eCustomScrollbar">
					<ul class="menu">
                    	<li class=" selected ">
                			<a id="QA_Lnb_Menu10258" href="Controller?type=adindex" class="link home" name="홈">홈</a>
            			</li>
                        <li class="hasChild ">
                			<a id="QA_Lnb_Menu1681" href="Controller?type=adorder" class="link order" name="주문">주문</a>
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
        <hr class="layout" />
        <div id="content">
        	<!-- 컨텐츠 시작 -->
			<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 css-he9kdn">
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
				<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 css-he9kdn" style="margin-top:50px;">
					<div class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation1 MuiCard-root css-1lp2lxj">
						<div class="MuiCardContent-root css-1wm5j31">
							<div class="MuiStack-root css-3mgmko">
								<div class="MuiTabs-root hasSpacing css-1a8hjjr">
									<div class="MuiTabs-scroller MuiTabs-fixed css-18jpbi7" style="overflow: hidden; margin-bottom: 0px;">
										<div class="MuiTabs-flexContainer css-7sga7m">
											<button class="MuiButtonBase-root MuiTab-root MuiTab-textColorPrimary MuiTab-fullWidth Mui-selected css-1klvew2" tabindex="0" data-tab="0" type="button">일별 매출 현황</button>
										</div>
									</div>
								</div>
								<hr class="MuiDivider-root MuiDivider-fullWidth lowest css-gdc707" color="baseLowTransparent"/>
							</div>
							<!-- 콘텐츠 -->
							<div class="MuiStack-root css-19t4a4d">
								<!-- 일별 매출 현황 -->
								<div class="MuiGrid-root MuiGrid-container css-336oa0">
									<div class="MuiGrid-root MuiGrid-container MuiGrid-item MuiGrid-grid-xs-6.5 css-1e4n2pt" data-testid="DailySales_Grid_4"><div class="MuiTableContainer-root css-9pnnhu">
										<table class="MuiTable-root highlight highlight-list-low fixed css-94knn5">
											<thead class="MuiTableHead-root css-1wbz3t9">
												<tr class="MuiTableRow-root MuiTableRow-head css-1u6a08m">
													<th class="MuiTableCell-root MuiTableCell-head MuiTableCell-alignLeft MuiTableCell-paddingNone MuiTableCell-sizeSmall css-1xcxvll" scope="col" color="#f78555" >
														<div class="MuiStack-root css-zrbz0u" >
															<span class="MuiTypography-root MuiTypography-base.subTitle3M css-ak829n" data-testid="TableHead_Typography">기간별 매출</span>
														</div>
													</th>
													<th class="MuiTableCell-root MuiTableCell-head MuiTableCell-alignLeft MuiTableCell-paddingNone MuiTableCell-sizeSmall css-1a98he0" scope="col" color="#f78555" data-testid="TableHead_TableCell">
														<div class="MuiStack-root css-1jxfipj" data-testid="TableHead_Stack">
													    	<span class="MuiTypography-root MuiTypography-base.subTitle3M css-ak829n" data-testid="TableHead_Typography">주문</span>
														</div>
													</th>
													<th class="MuiTableCell-root MuiTableCell-head MuiTableCell-alignLeft MuiTableCell-paddingNone MuiTableCell-sizeSmall css-1a98he0" scope="col" color="#f78555" data-testid="TableHead_TableCell">
														<div class="MuiStack-root css-1jxfipj" data-testid="TableHead_Stack">
															<span class="MuiTypography-root MuiTypography-base.subTitle3M css-ak829n" data-testid="TableHead_Typography">결제</span>
														</div>
													</th>
	  												<th class="MuiTableCell-root MuiTableCell-head MuiTableCell-alignLeft MuiTableCell-paddingNone MuiTableCell-sizeSmall css-1a98he0" scope="col" color="#f78555" data-testid="TableHead_TableCell">
	  													<div class="MuiStack-root css-1jxfipj" data-testid="TableHead_Stack">
															<span class="MuiTypography-root MuiTypography-base.subTitle3M css-ak829n" data-testid="TableHead_Typography">환불</span>
														</div>
													</th>
	  											</tr>
											</thead>
											<tbody class="MuiTableBody-root css-1xnox0e" data-testid="TableBody_MuiTableBody">
												<c:set var="order_qty_7" value="0"/>
												<c:set var="order_price_7" value="0"/>
												<c:set var="changed_qty_7" value="0"/>
												<c:set var="changed_price_7" value="0"/>
												<c:set var="cancel_qty_7" value="0"/>
												<c:set var="cancel_price_7" value="0"/>
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
												<c:if test="${idx.index < 7}">
													<c:set var="order_qty_7" value="${order_qty_7 + cell.getOrder_qty()}"/>
													<c:set var="order_price_7" value="${order_price_7 + cell.getOrder_price()}"/>
													<c:set var="changed_qty_7" value="${changed_qty_7 + cell.getChanged_qty()}"/>
													<c:set var="changed_price_7" value="${changed_price_7 + cell.getChanged_price()}"/>
													<c:set var="cancel_qty_7" value="${cancel_qty_7 + cell.getCancel_qty()}"/>
													<c:set var="cancel_price_7" value="${cancel_price_7 + cell.getCancel_price()}"/>
												</c:if>
												<c:if test="${idx.index < 3}">
													<c:if test="${idx.index eq 0}">
														<tr class="MuiTableRow-root css-ig9cz0">												
													</c:if>
													<c:if test="${idx.index ne 0}">
														<tr class="MuiTableRow-root css-1cxpyww" >
													</c:if>
														<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y">
														<c:if test="${idx.index eq 0 }">
															<hr class="MuiDivider-root MuiDivider-fullWidth MuiDivider-vertical lowest css-1orjhxc" color="info" data-testid="TableBodyCell_Divider"/>
															<div class="MuiStack-root css-lmzl00">
																<span class="MuiTypography-root MuiTypography-custom.subTitle3BH css-112v5qi">${cell.getOrder_dtm()}</span>
																<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorInfo MuiChip-filledInfo css-91c089">
																	<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd">오늘</span>
														</c:if>
														<c:if test="${idx.index ne 0 }">
															<div class="MuiStack-root css-r6kl0b">
																<div class="MuiStack-root css-yacjjn">
																	<span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-1q3reqo">${cell.getOrder_dtm()}</span>
														</c:if>
																</div>
															</div>
														</td>
														<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y">
															<div class="MuiStack-root css-s3sz5j" >
																<div class="MuiStack-root css-1tlqmrq" >
																	<div class="MuiStack-root css-1biq3zq" >
																		<span class="MuiTypography-root MuiTypography-base.body2 css-mr3nge"><fmt:formatNumber value="${cell.getOrder_price() }" type="number"/></span>
																		<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce">원</span>
																	</div>
																	<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoGrayLowBaseHigh MuiChip-filledDecoGrayLowBaseHigh css-1o8x7id">
																		<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${cell.getOrder_qty() }" type="number"/>건</span>
																	</div>
																</div>
															</div>
														</td>
														<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y">
															<div class="MuiStack-root css-s3sz5j" >
															<div class="MuiStack-root css-1tlqmrq" >
															<div class="MuiStack-root css-1biq3zq" >
															<span class="MuiTypography-root MuiTypography-base.body2 css-mr3nge"><fmt:formatNumber value="${cell.getChanged_price() }" type="number"/></span>
															<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce" data-testid="TableBodyCell_Typography_3">원</span>
															</div>
															<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoGrayLowBaseHigh MuiChip-filledDecoGrayLowBaseHigh css-1o8x7id" data-testid="TableBodyCell_Chip_1">
															<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${cell.getChanged_qty() }" type="number"/>건</span></div>
															</div>
															</div>
														</td>
															<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell_1"><div class="MuiStack-root css-s3sz5j" data-testid="TableBodyCell_Stack_1">
																<div class="MuiStack-root css-1tlqmrq" data-testid="TableBodyCell_Stack_2">
																<div class="MuiStack-root css-1biq3zq" data-testid="TableBodyCell_Stack_3">
																<span class="MuiTypography-root MuiTypography-base.body2 css-mr3nge" data-testid="TableBodyCell_Typography_2"><fmt:formatNumber value="${cell.getCancel_price() }" type="number"/></span>
																<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce" data-testid="TableBodyCell_Typography_3">원</span>
																</div>
																<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoGrayLowBaseHigh MuiChip-filledDecoGrayLowBaseHigh css-1o8x7id" data-testid="TableBodyCell_Chip_1">
																<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${cell.getCancel_qty() }" type="number"/>건</span>
																</div></div></div></td>
														</tr>
												</c:if>
												</c:forEach>
												<tr class="MuiTableRow-root css-jhd6ko">
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y">
														<div class="MuiStack-root css-lmzl00">
															<span class="MuiTypography-root MuiTypography-custom.subTitle3BH css-112v5qi">최근 7일 평균</span>
														</div>
													</td>
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y">
														<div class="MuiStack-root css-s3sz5j">
															<div class="MuiStack-root css-1tlqmrq" data-testid="TableBodyCell_Stack_2">
																<div class="MuiStack-root css-1biq3zq" data-testid="TableBodyCell_Stack_3">
																	<span class="MuiTypography-root MuiTypography-base.body2 css-1uxqc2" data-testid="TableBodyCell_Typography_2"><fmt:formatNumber value="${order_price_7 / 7 }" pattern="#,###.00"/></span>
																	<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce" data-testid="TableBodyCell_Typography_3">원</span>
																</div>
																<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoBluePurpleLowBaseHigh MuiChip-filledDecoBluePurpleLowBaseHigh css-pm13i0" data-testid="TableBodyCell_Chip_1">
																	<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${order_qty_7 / 7 }" pattern="#,###.00"/>건</span>
																</div>
															</div>
														</div>
													</td>
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell_1">
														<div class="MuiStack-root css-s3sz5j" data-testid="TableBodyCell_Stack_1">
															<div class="MuiStack-root css-1tlqmrq" data-testid="TableBodyCell_Stack_2">
																<div class="MuiStack-root css-1biq3zq" data-testid="TableBodyCell_Stack_3">
																	<span class="MuiTypography-root MuiTypography-base.body2 css-1uxqc2" data-testid="TableBodyCell_Typography_2"><fmt:formatNumber value="${changed_price_7 / 7 }" pattern="#,###.00"/></span>
																	<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce" data-testid="TableBodyCell_Typography_3">원</span>
																</div>
																<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoBluePurpleLowBaseHigh MuiChip-filledDecoBluePurpleLowBaseHigh css-pm13i0">
																	<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${changed_qty_7 / 7 }" pattern="#,###.00"/>건</span>
																</div>
															</div>
														</div>
													</td>
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell_1">
														<div class="MuiStack-root css-s3sz5j" data-testid="TableBodyCell_Stack_1">
															<div class="MuiStack-root css-1tlqmrq" data-testid="TableBodyCell_Stack_2">
																<div class="MuiStack-root css-1biq3zq" data-testid="TableBodyCell_Stack_3">
																	<span class="MuiTypography-root MuiTypography-base.body2 css-1uxqc2" data-testid="TableBodyCell_Typography_2"><fmt:formatNumber value="${cancel_price_7 / 7 }" pattern="#,###.00"/></span>
																	<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce" data-testid="TableBodyCell_Typography_3">원</span>
																</div>
																<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoBluePurpleLowBaseHigh MuiChip-filledDecoBluePurpleLowBaseHigh css-pm13i0">
																	<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${cancel_qty_7 / 7 }" pattern="#,###.00"/>건</span>
																</div>
															</div>
														</div>
													</td>
												</tr>
												<tr class="MuiTableRow-root css-1cxpyww" data-testid="TableBody_TableRow">
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell_1">
														<div class="MuiStack-root css-r6kl0b" data-testid="TableBodyCell_Stack_1">
															<div class="MuiStack-root css-yacjjn" data-testid="TableBodyCell_Stack_4">
																<span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-1q3reqo" data-testid="TableBodyCell_Typography_5">최근 7일 합계</span>
															</div>
														</div>
													</td>
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell_1">
														<div class="MuiStack-root css-s3sz5j" data-testid="TableBodyCell_Stack_1">
															<div class="MuiStack-root css-1tlqmrq" data-testid="TableBodyCell_Stack_2">
																<div class="MuiStack-root css-1biq3zq" data-testid="TableBodyCell_Stack_3">
																	<span class="MuiTypography-root MuiTypography-base.body2 css-mr3nge" data-testid="TableBodyCell_Typography_2"><fmt:formatNumber value="${order_price_7 }" pattern="#,###.00"/></span>
																	<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce" data-testid="TableBodyCell_Typography_3">원</span>
																</div>
																<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoGrayLowBaseHigh MuiChip-filledDecoGrayLowBaseHigh css-1o8x7id" data-testid="TableBodyCell_Chip_1">
																	<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${order_qty_7}" pattern="#,###.00"/>건</span>
																</div>
															</div>
														</div>
													</td>
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell_1">
														<div class="MuiStack-root css-s3sz5j" data-testid="TableBodyCell_Stack_1">
															<div class="MuiStack-root css-1tlqmrq" data-testid="TableBodyCell_Stack_2">
																<div class="MuiStack-root css-1biq3zq" data-testid="TableBodyCell_Stack_3">
																	<span class="MuiTypography-root MuiTypography-base.body2 css-mr3nge" data-testid="TableBodyCell_Typography_2"><fmt:formatNumber value="${changed_price_7 }" pattern="#,###.00"/></span>
																	<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce" data-testid="TableBodyCell_Typography_3">원</span>
																</div>
																<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoGrayLowBaseHigh MuiChip-filledDecoGrayLowBaseHigh css-1o8x7id" data-testid="TableBodyCell_Chip_1">
																	<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${changed_qty_7 }" pattern="#,###.00"/>건</span>
																</div>
															</div>
														</div>
													</td>
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell_1">
														<div class="MuiStack-root css-s3sz5j" data-testid="TableBodyCell_Stack_1">
															<div class="MuiStack-root css-1tlqmrq" data-testid="TableBodyCell_Stack_2">
																<div class="MuiStack-root css-1biq3zq" data-testid="TableBodyCell_Stack_3">
																	<span class="MuiTypography-root MuiTypography-base.body2 css-mr3nge" data-testid="TableBodyCell_Typography_2"><fmt:formatNumber value="${cancel_price_7}" pattern="#,###.00"/></span>
																	<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce" data-testid="TableBodyCell_Typography_3">원</span>
																</div>
																<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoGrayLowBaseHigh MuiChip-filledDecoGrayLowBaseHigh css-1o8x7id" data-testid="TableBodyCell_Chip_1">
																	<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${cancel_qty_7}" pattern="#,###.00"/>건</span>
																</div>
															</div>
														</div>
													</td>
												</tr>
												<tr class="MuiTableRow-root css-1cxpyww" data-testid="TableBody_TableRow">
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell_1">
														<div class="MuiStack-root css-r6kl0b" data-testid="TableBodyCell_Stack_1">
															<div class="MuiStack-root css-yacjjn" data-testid="TableBodyCell_Stack_4">
																<span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-1q3reqo" data-testid="TableBodyCell_Typography_5">최근 30일 평균</span>
															</div>
														</div>
													</td>
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell_1">
														<div class="MuiStack-root css-s3sz5j" data-testid="TableBodyCell_Stack_1">
															<div class="MuiStack-root css-1tlqmrq" data-testid="TableBodyCell_Stack_2">
																<div class="MuiStack-root css-1biq3zq" data-testid="TableBodyCell_Stack_3">
																	<span class="MuiTypography-root MuiTypography-base.body2 css-mr3nge" data-testid="TableBodyCell_Typography_2"><fmt:formatNumber value="${order_price_30 / 30}" pattern="#,###.00"/></span>
																	<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce" data-testid="TableBodyCell_Typography_3">원</span>
																</div>
																<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoGrayLowBaseHigh MuiChip-filledDecoGrayLowBaseHigh css-1o8x7id" data-testid="TableBodyCell_Chip_1">
																	<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${order_qty_30 / 30}" pattern="#,###.00"/>건</span>
																</div>
															</div>
														</div>
													</td>
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell_1">
														<div class="MuiStack-root css-s3sz5j" data-testid="TableBodyCell_Stack_1">
															<div class="MuiStack-root css-1tlqmrq" data-testid="TableBodyCell_Stack_2">
																<div class="MuiStack-root css-1biq3zq" data-testid="TableBodyCell_Stack_3">
																	<span class="MuiTypography-root MuiTypography-base.body2 css-mr3nge" data-testid="TableBodyCell_Typography_2"><fmt:formatNumber value="${changed_price_30 / 30}" pattern="#,###.00"/></span>
																	<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce" data-testid="TableBodyCell_Typography_3">원</span>
																</div>
																<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoGrayLowBaseHigh MuiChip-filledDecoGrayLowBaseHigh css-1o8x7id" >
																	<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${changed_qty_30 / 30}" pattern="#,###.00"/>건</span>
																</div>
															</div>
														</div>
													</td>
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell_1">
														<div class="MuiStack-root css-s3sz5j" data-testid="TableBodyCell_Stack_1">
															<div class="MuiStack-root css-1tlqmrq" data-testid="TableBodyCell_Stack_2">
																<div class="MuiStack-root css-1biq3zq" data-testid="TableBodyCell_Stack_3">
																	<span class="MuiTypography-root MuiTypography-base.body2 css-mr3nge" data-testid="TableBodyCell_Typography_2"><fmt:formatNumber value="${cancel_price_30 / 30}" pattern="#,###.00"/></span>
																	<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce" data-testid="TableBodyCell_Typography_3">원</span>
																</div>
																<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoGrayLowBaseHigh MuiChip-filledDecoGrayLowBaseHigh css-1o8x7id">
																	<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${cancel_qty_30 / 30}" pattern="#,###.00"/>건</span>
																</div>
															</div>
														</div>
													</td>
												</tr>
												<tr class="MuiTableRow-root css-jhd6ko" data-testid="TableBody_TableRow">
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell">
														<div class="MuiStack-root css-lmzl00" data-testid="TableBodyCell_Stack">
															<span class="MuiTypography-root MuiTypography-custom.subTitle3BH css-112v5qi" data-testid="TableBodyCell_Typography">최근 30일 합계</span>
														</div>
													</td>
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell_1">
														<div class="MuiStack-root css-s3sz5j" data-testid="TableBodyCell_Stack_1">
															<div class="MuiStack-root css-1tlqmrq" data-testid="TableBodyCell_Stack_2">
																<div class="MuiStack-root css-1biq3zq" data-testid="TableBodyCell_Stack_3">
																	<span class="MuiTypography-root MuiTypography-base.body2 css-1uxqc2" data-testid="TableBodyCell_Typography_2"><fmt:formatNumber value="${order_price_30}" pattern="#,###.00"/></span>
																	<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce" data-testid="TableBodyCell_Typography_3">원</span>
																</div>
																<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoBluePurpleLowBaseHigh MuiChip-filledDecoBluePurpleLowBaseHigh css-pm13i0">
																	<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${order_qty_30}" pattern="#,###.00"/>건</span>
																</div>
															</div>
														</div>
													</td>
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell_1">
														<div class="MuiStack-root css-s3sz5j" data-testid="TableBodyCell_Stack_1">
															<div class="MuiStack-root css-1tlqmrq" data-testid="TableBodyCell_Stack_2">
																<div class="MuiStack-root css-1biq3zq" data-testid="TableBodyCell_Stack_3">
																	<span class="MuiTypography-root MuiTypography-base.body2 css-1uxqc2" data-testid="TableBodyCell_Typography_2"><fmt:formatNumber value="${changed_price_30}" pattern="#,###.00"/></span>
																	<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce" data-testid="TableBodyCell_Typography_3">원</span>
																</div>
																<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoBluePurpleLowBaseHigh MuiChip-filledDecoBluePurpleLowBaseHigh css-pm13i0">
																	<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${changed_qty_30}" pattern="#,###.00"/>건</span>
																</div>
															</div>
														</div>
													</td>
													<td class="MuiTableCell-root MuiTableCell-body MuiTableCell-sizeSmall css-wfvj3y" data-testid="TableBodyCell_TableCell_1">
														<div class="MuiStack-root css-s3sz5j" data-testid="TableBodyCell_Stack_1">
															<div class="MuiStack-root css-1tlqmrq" data-testid="TableBodyCell_Stack_2">
																<div class="MuiStack-root css-1biq3zq" data-testid="TableBodyCell_Stack_3">
																	<span class="MuiTypography-root MuiTypography-base.body2 css-1uxqc2" data-testid="TableBodyCell_Typography_2"><fmt:formatNumber value="${cancel_price_30}" pattern="#,###.00"/></span>
																	<span class="MuiTypography-root MuiTypography-base.body2 unit css-1m3dqce" data-testid="TableBodyCell_Typography_3">원</span>
																</div>
																<div class="MuiChip-root MuiChip-filled MuiChip-sizeX4Small MuiChip-colorDecoBluePurpleLowBaseHigh MuiChip-filledDecoBluePurpleLowBaseHigh css-pm13i0">
																	<span class="MuiChip-label MuiChip-labelX4Small css-v1l1sd"><fmt:formatNumber value="${cancel_qty_30}" pattern="#,###.00"/>건</span>
																</div>
															</div>
														</div>
													</td>
												</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		<!-- 여기까지 content -->
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
</script>	
</body>
</html>