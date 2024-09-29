<%@page import="java.io.File"%>
<%@page import="vo.ProductVO"%>
<%@page import="vo.CategoryVO"%>
<%@page import="vo.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- PG크로스브라우징필수내용 -->
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<!-- // PG크로스브라우징필수내용 -->

<link rel="stylesheet" href="/shop/layout/css/common.css"/>
   <!-- <link rel="stylesheet" href="/shop/layout/css/layout.css"/> 사용안함 -->
<!-- <link rel="stylesheet" href="/shop/layout/css/xeicon.css"/> -->
<link rel="stylesheet" href="/shop/layout/css/ec-base-ui.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-tooltip.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-help.css"/><!-- 
<link rel="stylesheet" href="/shop/layout/css/ec-base-product.css"/> -->
<link rel="stylesheet" href="/shop/layout/css/ec-base-paginate.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-tab.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-button.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-box.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-table.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-desc.css"/>

<jsp:include page="/layout/base.jsp"/>

<!-- 좌측 디자인(메인) -->
<!--@css(/_wg/css/left_main.css)-->
<link rel="stylesheet" href="/shop/layout/left_main/css/left_main.css"/>

<!--@css(/_wg/css/menupackage.css)-->
<link rel="stylesheet" href="/shop/product/css/menupackage.css"/>


    <!--@css(/_wg/css/detail.css)-->
    <!--@css(/_wg/css/additional.css)-->
<link rel="stylesheet" href="/shop/product/css/detail.css"/>
<link rel="stylesheet" href="/shop/product/css/additional.css"/>

</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String product_key = request.getParameter("product");
	String prevPage = "Controller?type=detail&product="+product_key;
	session.setAttribute("prevPage", prevPage);
%>
<input type="hidden" id="u_idx" value="${sessionScope.user_vo.u_idx}"/>
<div id="wrap">
    <!-- 상단 디자인 -->
    <!--@import(/_wg/import/header.html)-->
    <jsp:include page="/layout/header/header.jsp"/>

	<div id="container" class="left">
	    <!-- 왼쪽 사이드 디자인 -->
		<jsp:include page="/layout/left_main/left_main.jsp"/>
	    <div id="contents" class="left">
	    	<!--  여기부터 콘텐츠 -->
	    	<!--@layout(/layout/basic/layout.html)-->
			<!--
			    $category_page = /product/list.html
			    $project_page = /product/project.html
			    $jointbuy_page = /product/jointbuy.html
			-->
			<div class="path">
			    <span>현재 위치</span>
			    <ol>
			        <li><a href="Controller?type=index">홈</a></li>
			        <li><a href="Controller?type=product&category=${requestScope.cate1.category_key}&depth=1">${requestScope.cate1.category_name}</a></li>
			        <li><a href="Controller?type=product&category=${requestScope.cate2.category_key}&depth=2">${requestScope.cate2.category_name}</a></li>
			        <li><a href="Controller?type=product&category=${requestScope.cate3.category_key}&depth=3">${requestScope.cate3.category_name}</a></li>
		        </ol>
			</div>
			<div class="xans-element- xans-product xans-product-detail">
			    <!--@js(/_wg/js/detail.js)-->
    			<div class="detailArea">
			        <!-- 이미지영역 -->
			        <div class="xans-element- xans-product xans-product-image imgArea">
            		<!--@js(/js/module/product/product_image.js)-->
			            <div class="keyImg item">
		                	<!-- 상품이미지 -->
		        			<div id="big_img_box">
		        				<img src="${requestScope.product_vo.img_url}" style="width: 100%;height: 100%;"/>
		        			</div>
            			</div>
					</div><!--//.imgArea -->
        			<div class="buy-wrapper">
						<!-- 토글 열기버튼 -->
						<div class="btn-buy-open">구매하기</div>
			            <!-- 토글 닫기버튼 -->
			            <div class="btn-down-wrapper">닫기</div>
			            <!-- 옵션박스 시작 -->
			            <div class="buy-scroll-box">
							<h2 class="item_name">${requestScope.product_vo.prod_name}</h2><!-- 상품명 -->
                			<div class="infoArea DB_rate" data-price="{$product_custom}^{$product_price}"><!-- 할인율 -->
                    			<div class="xans-element- xans-product xans-product-detaildesign">
                        			<table border="1" summary="">
                           				<caption>{$name} 기본 정보</caption>
			                            <tbody>
			                                <tr class="price xans-record-">
			                                    <th scope="row">판매가</th>
			                                    <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.product_vo.cell_price}" />원</td>
			                                </tr>
			                                <tr class=" xans-record-">
			                                    <th scope="row">제조사</th>
			                                    <td>${requestScope.product_vo.factory}</td>
			                                </tr>
			                                <tr class=" xans-record-">
			                                    <th scope="row">재질</th>
			                                    <td>${requestScope.product_vo.material}</td>
			                                </tr>
			                            </tbody>
                        			</table>
                   				</div>
                    			<table border="1" summary="" class="xans-element- xans-product xans-product-option xans-record-">
			                        <!--
			                        $use_per_add_option = yes
			                        -->
			                        <caption>>상품 옵션</caption>
			                        <tbody class="xans-element- xans-product xans-product-option xans-record-">
			                            <tr>
			                                <th scope="row">옵션</th>
			                                <td>
			                                	<select name="poption" id="product_option" class="ProductOption0">
			                                		<option value="*" selected>- [필수] 옵션을 선택해 주세요 -</option>
			                                		<c:forEach var="option" items="${requestScope.product_vo.option_list}">
			                                			<option value="${option.option_key}" value2="${option.size}" value3="${option.color}" value4="${option.prod_stock}" value5="${requestScope.product_vo.cell_price}">사이즈:${option.size}  -  ${option.color} (수량:${option.prod_stock})</option>
			                                		</c:forEach>
			                                	</select>
			                                	<p class="value"></p>
			                                </td>
			                            </tr>
			                        </tbody>
                    			</table>
			                    <div class="guideArea">
			                        <p class="info">(최소주문수량 1개 이상)</p>
		                        </div>
		                        <div id="totalProducts" class="{$total.total_display|display}">
		                        	<p class="ec-base-help txtWarn txt11 mTxt {$several_item_display|display}"> 위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.</p>
			                        <table border="1" summary="">
			                            <caption>상품 목록</caption>
			                            <colgroup>
			                                <col>
			                                <col>
			                                <col>
			                            </colgroup>
			                            <thead>
			                                <tr>
			                                    <th scope="col">상품명</th>
			                                    <th scope="col">상품수</th>
			                                    <th scope="col">가격</th>
			                                </tr>
			                            </thead>
			                            <!-- 옵션선택 또는 세트상품 선택시 상품이 추가되는 영역입니다. 쇼핑몰 화면에는 아래와 같은 마크업구조로 표시됩니다. 삭제시 기능이 정상동작 하지 않습니다. -->
			                            <tbody class="option_products">
			                            </tbody>
			                        </table>
			                    </div>
							</div>
			            </div><!--// .buy-scroll-box -->
            			<!-- 구매박스 -->
			            <div class="buy-box">
			                <div id="totalPrice" class="totalPrice">
			                    <strong>총상품금액</strong> 
			                    <span class="total">
			                    	<strong class="price">
			                    		<em>0원</em>
		                    		</strong>
	                    		</span>
			                </div>
			                <div class="xans-element- xans-product xans-product-action">
			                    <div class="ec-base-button">
			                        <c:if test="${requestScope.product_vo.stock > 0}">
				                        <a href="#none" class="{$buy_display|display}" onclick="sendOrder()">
				                            <span id="{$btn_buy_id}" class="-btn -block -xl -black">바로 구매하기</span>
				                        </a>
       			                        <a href="#" class="{$basket_display|display} -btn -block -xl -lgrey" onclick="addBasket()">장바구니 담기</a>
			                        </c:if>
			                        <!-- 재고없을 시 SOLD OUT -->
			                        <c:if test="${requestScope.product_vo.stock <= 0}">
			                        	<a href="#" class="{$soldout_display|display} -btn -xl -lgrey">SOLD OUT</a>
			                        </c:if>
			                        <!-- 관심상품 등록 -->
			                        <c:if test="${sessionScope.user_vo eq null}">
                   						<a id="interest_atag" href="#none" class=" -btn -block -xl -lgrey">관심상품등록</a>
			                        </c:if>
		                        	<c:if test="${sessionScope.user_vo ne null}">
					            		<c:set var="chk_interest" value="0"/>
					            		<c:forEach var="interest" items="${sessionScope.user_vo.interest_list}">
											<c:if test="${interest.product_key eq requestScope.product_vo.product_key}">
												<c:set var="chk_interest" value="1"/>
											</c:if>						           		
					           			</c:forEach>
					           			<c:if test="${chk_interest eq 0}">
					           				<a id="interest_atag" href="#none" class=" -btn -block -xl -lgrey">관심상품등록</a>
					           			</c:if>
					           			<c:if test="${chk_interest eq 1}">
				                        	<a id="interest_atag" href="#none" class=" -btn -block -xl -lgrey">관심상품해제</a>
					           			</c:if>
			                        </c:if>
			                    </div>
			                </div>
			            </div><!--// .buy-box -->
			            <div class="xans-element- xans-myshop xans-myshop-asyncbenefit member_benefit">
			            </div>
					</div><!--// .buy-wrapper -->
				</div><!--// .detailArea -->
			</div>
			<div class="xans-element- xans-product xans-product-additional">
			    <!-- 상품상세정보 -->
			    <div id="tab01"></div>
			    <div id="prdDetail">
			        <div class="tabMenu">
			            <ul>
			                <li class="on"><a href="#tab01">상세정보</a></li>
			                <li><a href="#tab02">구매안내</a></li>
			                <li><a href="#tab03">상품후기<span>0</span></a></li>
			                <li><a href="#tab04">상품문의<span>0</span></a></li>
			            </ul>
			        </div>
			        <!-- 상품기본정보 -->
			        <div class="cont">
			        <%
				        ProductVO pvo = (ProductVO)request.getAttribute("product_vo");
			        	String path = pvo.getImg_url().substring(5, pvo.getImg_url().lastIndexOf("/"));
			        	String realPath = application.getRealPath(path);
			        	
				        File file = new File(realPath);
			        	List<File> list = new ArrayList<File>();
				        File[] fileList = file.listFiles();
				        for (File f : fileList){
				        	list.add(f);
				        }
				        
				        for (File f:list){
				    %>
				    	<img src="/shop/<%=path%>/<%=f.getName()%>"/>
				    <%
				        }
			        %>
			        </div>
			    </div>
			    <div class="divClear"></div>
			    <!-- 구매정보 -->
			    <div id="tab02"></div>
			    <div class="tabMenu">
			        <ul>
			            <li><a href="#tab01">상세정보</a></li>
			            <li class="on"><a href="#tab02">구매안내</a></li>
			            <li><a href="#tab03">상품후기 <span>0</span></a></li>
			            <li><a href="#tab04">상품문의 <span>0</span></a></li>
			        </ul>
			    </div>
			    <!-- 상품결제정보 -->
			    <div class="prd_info -section">
			        <div class="titleArea2">
			            <h4>상품결제정보</h4>
			        </div>
			        <p class="info_text">
			            고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등
			      정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.
			      		<br/>
			      		<br/>   
			      		무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.  
			        	<br/>
			        	주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지
			      않은 주문은 자동취소 됩니다. 
			      		<br/>
			        </p>
			    </div>
			    <!-- 배송정보 -->
			    <div class="prd_info -section">
			        <div class="titleArea2">
			            <h4>배송정보</h4>
			        </div>
			        <p class="info_text">
			            배송 방법 : 택배<br>
			            배송 지역 : 전국지역<br>
			            배송 비용 : 3,000원<br>
			            배송 기간 : 3일 ~ 7일<br>
			            배송 안내 : - 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br/>
			            고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.
			        </p>
			    </div>
			    <!-- 교환 및 반품정보 -->
			    <div class="prd_info -section">
			        <div class="titleArea2">
			            <h4>교환 및 반품정보</h4>
			        </div>
			        <p class="info_text">
			        	<strong>교환 및 반품 주소</strong>
						<br>&nbsp;- 
						<br>&nbsp;
						<br><strong>교환 및 반품이 가능한 경우</strong>
						<br>&nbsp;-&nbsp;계약내용에 관한 서면을 받은 날부터&nbsp;7일.&nbsp;단,&nbsp;그 서면을 받은 때보다 재화등의 공급이 늦게 이루어진 경우에는 재화등을 공급받거나 재화등의 공급이 시작된 날부터&nbsp;7일 이내
						<br>&nbsp; -&nbsp;공급받으신 상품 및 용역의 내용이 표시.광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날 부터&nbsp;3월이내,&nbsp;그사실을 알게 된 날 또는 알 수 있었던 날부터&nbsp;30일이내
						<br>&nbsp;
						<br><strong>교환 및 반품이 불가능한 경우</strong>
						<br>&nbsp;-&nbsp;이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만,&nbsp;재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
						<br>&nbsp; -&nbsp;이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
						<br>&nbsp; -&nbsp;시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
						<br>&nbsp; -&nbsp;복제가 가능한 재화등의 포장을 훼손한 경우
						<br>&nbsp; -&nbsp;개별 주문 생산되는 재화 등 청약철회시 판매자에게 회복할 수 없는 피해가 예상되어 소비자의 사전 동의를 얻은 경우
						<br>&nbsp; -&nbsp;디지털 콘텐츠의 제공이 개시된 경우, (다만,&nbsp;가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우 제공이 개시되지 아니한 부분은 청약철회를 할 수 있습니다.)
						<br>&nbsp;
						<br>※ 고객님의 마음이 바뀌어 교환,&nbsp;반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.
						<br>&nbsp;(색상 교환,&nbsp;사이즈 교환 등 포함)
						<br>
			        </p>
			    </div>
			    <!-- 상품사용후기 -->
			    <div id="tab03"></div>
			    <a name="use_review"></a>
			    <div id="prdReview" class="{$review_display|display}">
			        <div class="tabMenu">
			            <ul>
			                <li><a href="#tab01">상세정보</a></li>
			                <li><a href="#tab02">구매안내</a></li>
			                <li class="on"><a href="#tab03">상품후기<span>0</span></a></li>
			                <li><a href="#tab04">상품문의<span>0</span></a></li>
			            </ul>
			        </div>
			        <div class="board">
			            <div>
			                <!--@js(/js/module/product/review.js)-->
			                <p class="noAccess {$deny_display|display}">글읽기 권한이 없습니다.</p>
			                <div class="ec-base-table typeList">
			                    <table border="1" summary="" class="{$list_display|display}">
			                        <caption>상품사용후기</caption>
			                        <colgroup>
			                            <col style="width:70px;" />
			                            <col style="width:auto" />
			                            <col style="width:100px;" />
			                            <col style="width:100px;" />
			                            <col style="width:80px;" />
			                            <col style="width:80px;" class="{$use_point_display|display}" />
			                        </colgroup>
			                        <thead>
			                            <tr>
			                                <th scope="col">번호</th>
			                                <th scope="col">제목</th>
			                                <th scope="col">작성자</th>
			                                <th scope="col">작성일</th>
			                                <th scope="col">조회</th>
			                                <th scope="col" class="{$use_point_display|display}">평점</th>
			                            </tr>
			                        </thead>
			                        <tbody class="center">
			                            <tr>
			                                <td>{$no}</td>
			                                <td class="subject left txtBreak">{$icon_re}{$icon_lock} <a href="{$link_board_detail}{$param_read}">{$subject}</a> {$icon_new}{$icon_hit}{$icon_file}<span class="txtWarn">{$comment_count}</span></td>
			                                <td>{$member_icon} {$writer}</td>
			                                <td class="txtInfo txt11">{$write_date|date:Y-m-d}</td>
			                                <td class="txtInfo txt11">{$hit_count}</td>
			                                <td class="{$use_point_display|display}"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point{$point_count}.gif" alt="{$point_count}점"></td>
			                            </tr>
			                            <tr>
			                                <td>{$no}</td>
			                                <td class="subject left txtBreak">{$icon_re}{$icon_lock} <a href="{$link_board_detail}{$param_read}">{$subject}</a> {$icon_new}{$icon_hit}{$icon_file}<span class="txtWarn">{$comment_count}</span></td>
			                                <td>{$member_icon} {$writer}</td>
			                                <td class="txtInfo txt11">{$write_date|date:Y-m-d}</td>
			                                <td class="txtInfo txt11">{$hit_count}</td>
			                                <td class="{$use_point_display|display}"><img src="//img.echosting.cafe24.com/skin/base/board/ico_point{$point_count}.gif" alt="{$point_count}점"></td>
			                            </tr>
			                        </tbody>
			                    </table>
			                </div>
			            </div>
			            <p class="ec-base-button typeBorder">
			                <span class="gRight">
			                    <a href="{$review_write}" class="-btn -sm -black">후기작성하기</a>
			                    <a href="{$review_list}" class="-btn -sm -white">모두보기</a>
			                </span>
			            </p>
			            <div class="ec-base-paginate typeSub">
			                <a href="{$param_first}" class="first"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_first2.gif" alt="첫 페이지" /></a>
			                <a href="{$param_before}"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev2.gif" alt="이전 페이지" /></a>
			                <ol>
			                    <li><a href="{$param}"class="{$param_class}">{$no}</a></li>
			                    <li><a href="{$param}"class="{$param_class}">{$no}</a></li>
			                    <li><a href="{$param}"class="{$param_class}">{$no}</a></li>
			                    <li><a href="{$param}"class="{$param_class}">{$no}</a></li>
			                    <li><a href="{$param}"class="{$param_class}">{$no}</a></li>
			                </ol>
			                <a href="{$param_next}"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_next2.gif" alt="다음 페이지" /></a>
			                <a href="{$param_last}" class="last"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_last2.gif" alt="마지막 페이지" /></a>
			            </div>
			        </div>
			    </div>
			    <!-- 상품 Q&A -->
			    <div id="tab04"></div>
    			<a name="use_qna"></a>
			    <div id="prdQnA" class="{$qna_display|display}">
			        <div class="tabMenu">
			            <ul>
			                <li><a href="#tab01">상품상세정보</a></li>
			                <li><a href="#tab02">상품구매안내</a></li>
			                <li><a href="#tab03">상품후기 <span>0</span></a></li>
			                <li class="on"><a href="#tab04">상품문의 <span>0</span></a></li>
			            </ul>
			        </div>
			        <div class="board">
			            <div module="product_qna">
			                <!--@js(/js/module/product/qna.js)-->
			                <p class="noAccess {$deny_display|display}">글읽기 권한이 없습니다.</p>
							<div class="ec-base-table typeList">
			                    <table border="1" summary="" class="{$list_display|display}">
			                        <caption>상품 Q&amp;A</caption>
			                        <colgroup>
			                            <col style="width:70px;" />
			                            <col style="width:134px;" />
			                            <col style="width:auto" />
			                            <col style="width:80px;" />
			                            <col style="width:100px;" />
			                            <col style="width:55px;" />
			                        </colgroup>
			                        <thead>
			                            <tr>
			                                <th scope="col">번호</th>
			                                <th scope="col">카테고리</th>
			                                <th scope="col">제목</th>
			                                <th scope="col">작성자</th>
			                                <th scope="col">작성일</th>
			                                <th scope="col">조회</th>
			                            </tr>
			                        </thead>
			                        <tbody>
			                            <tr>
			                                <td>{$no}</td>
			                                <td>{$category_name}</td>
			                                <td class="subject left txtBreak">{$icon_re}{$icon_lock} <a href="{$link_board_detail}{$param_read}">{$subject}</a> {$icon_new}{$icon_hit}{$icon_file}<span class="txtWarn">{$comment_count}</span></td>
			                                <td>{$member_icon} {$writer}</td>
			                                <td class="txtInfo txt11">{$write_date|date:Y-m-d}</td>
			                                <td class="txtInfo txt11">{$hit_count}</td>
			                            </tr>
			                            <tr>
			                                <td>{$no}</td>
			                                <td>{$category_name}</td>
			                                <td class="subject left txtBreak">{$icon_re}{$icon_lock} <a href="{$link_board_detail}{$param_read}">{$subject}</a> {$icon_new}{$icon_hit}{$icon_file}<span class="txtWarn">{$comment_count}</span></td>
			                                <td>{$member_icon} {$writer}</td>
			                                <td class="txtInfo txt11">{$write_date|date:Y-m-d}</td>
			                                <td class="txtInfo txt11">{$hit_count}</td>
			                            </tr>
			                        </tbody>
			                    </table>
			                </div>
			            </div>
			
			            <p class="ec-base-button typeBorder">
			                <span class="gRight">
			                    <a href="{$qna_write}" class="-btn -sm -black">상품문의하기</a>
			                    <a href="{$qna_list}" class="-btn -sm -white">모두보기</a>
			                </span>
			            </p>
			
			            <div class="ec-base-paginate typeSub">
			                <a href="{$param_first}" class="first"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_first2.gif" alt="첫 페이지" /></a>
			                <a href="{$param_before}"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_prev2.gif" alt="이전 페이지" /></a>
			                <ol>
			                    <li><a href="{$param}" class="{$param_class}">{$no}</a></li>
			                    <li><a href="{$param}" class="{$param_class}">{$no}</a></li>
			                    <li><a href="{$param}" class="{$param_class}">{$no}</a></li>
			                    <li><a href="{$param}" class="{$param_class}">{$no}</a></li>
			                    <li><a href="{$param}" class="{$param_class}">{$no}</a></li>
			                </ol>
			                <a href="{$param_next}"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_next2.gif" alt="다음 페이지" /></a>
			                <a href="{$param_last}" class="last"><img src="//img.echosting.cafe24.com/skin/base/common/btn_page_last2.gif" alt="마지막 페이지" /></a>
			            </div>
			        </div>
			    </div>		
<input type="hidden" id="total_price_test"/>
</div>

<div class="bg-buy-wrapper"></div><!-- 라이트박스 배경 -->

<!--@define(cmc_log)-->
			<!-- 여기까지 -->
        </div>
    </div>
	<!-- 오른쪽 사이드 -->
	<jsp:include page="/layout/side/side.jsp"/>
	<!-- 하단 디자인 -->
    <!--@import(/_wg/import/footer.html)-->
    <jsp:include page="/layout/footer/footer.jsp"/>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script type="text/javascript">
	$(function(){
		$("#interest_atag").click(function(){
			if ($("#u_idx").val() == null || $("#u_idx").val().trim() == ''){
				alert("로그인 후 이용하세요.");
				return;
			}
			
			/* 관심상품 취소할 경우 */
			if ($(this).text() == "관심상품해제"){
				$(this).text("관심상품등록");
				$.ajax({
					url:"/shop/product/interestIO.jsp",
					type:"post",
					data: {
						"product_key": encodeURIComponent(${product_vo.product_key}),
						"mode": "off",
					},
				}).done(function(data) {
				});
			}
			/* 관심상품 등록할 경우 */
			else {
				$(this).text("관심상품해제");
				$.ajax({
					url:"/shop/product/interestIO.jsp",
					type:"post",
					data: {
						"product_key": encodeURIComponent(${product_vo.product_key}),
						"mode": "on",
					},
				}).done(function(data) {
				});
			}
		});
		
		let total = 0;
		let chk = [];
		$('select[name=poption]').change(function(){
		    var option_key = $(this).val();
		    var size = $('select[name=poption] > option:selected').attr("value2");
		    var color = $('select[name=poption] > option:selected').attr("value3");
		    var prod_stock = $('select[name=poption] > option:selected').attr("value4");
		    var cell_price = $('select[name=poption] > option:selected').attr("value5");
		    
		    if (chk.includes(parseInt(option_key))){
		    	alert("아래 리스트에서 이미 선택되었습니다.\r\n수량을 조절해주세요.");
		    	return;
		    }
		    chk.push(parseInt(option_key));
		    var item_list = $('#totalProducts tbody').children('tr');
	        $(".option_products").append("<tr class='option_product'><input type='hidden' class='option_box_id' id='option_box1_id' value='"+option_key+"' name='item_code[]'/><input type='hidden' class='item_stock' id='option_box2_id' value='"+prod_stock+"' name='item_stock'/><input type='hidden' class='item_cell_price' id='option_box3_id' value='"+cell_price+"' name='item_cell_price'/><td><p class='product'>사이즈 - <span>"+size+"</span><br/>색상 - <span>"+color+"</span></p></td><td><span class='quantity' style='width:65px;'><input type='text' readonly id='option_box1_quantity' name='quantity_opt[]' class='quantity_opt eProductQuantityClass' value='1' min='1'/><a href='#' class='up eProductQuantityUpClass' name='upqty'><img src='//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif' alt='수량증가' id='option_box1_up' class='option_box_up'/></a><a href='#' class='down eProductQuantityDownClass'><img src='//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif' alt='수량감소' id='option_box1_down' class='option_box_down'/></a></span><a href='#none' class='delete'><img src='//img.echosting.cafe24.com/design/skin/default/product/btn_price_delete.gif' alt='삭제' class='option_box_del' /></a></td><td class='right'><span id='option_box1_price'><span class='ec-front-product-item-price'>"+cell_price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"</span></span></td></tr>");
		    
	        total += parseInt(cell_price);
			$("#total_price_test").val(total);
			totalPrice();
		});
		
		// 수량증가 + limit 재고
		$('#totalProducts tbody').on('click', '.up', function() {
			var cnt = $(this).closest('span').find('input');
			var stock = $(this).closest('tr').find('.item_stock').val();
			if (cnt.val() == stock) {
				alert("최대 구매가능 수량입니다.");
				return;
			}
			
			var cell_price = $(this).closest('tr').find('.item_cell_price').val();
			var price = $(this).closest('tr').find('.ec-front-product-item-price');
			cnt.val(parseInt(cnt.val())+1);
			price.text((parseInt(cell_price)*cnt.val()).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ','));

	        total += parseInt(cell_price);
			$("#total_price_test").val(total);
			totalPrice();
		});
		
		// 수량감소 + limit 1
		$('#totalProducts tbody').on('click', '.down', function() {
			var cnt = $(this).closest('span').find('input');
			if (cnt.val() == 1)
				return;
			
			var cell_price = $(this).closest('tr').find('.item_cell_price').val();
			var price = $(this).closest('tr').find('.ec-front-product-item-price');
			cnt.val(parseInt(cnt.val())-1);
			price.text(parseInt(cell_price)*cnt.val());
			
			total -= parseInt(cell_price);
			$("#total_price_test").val(total);
			totalPrice();
		});
		
		// 삭제
		$('#totalProducts tbody').on('click', '.delete', function() {
			var option_key = $(this).closest('tr').find('.option_box_id').val();
			var price = $(this).closest('tr').find('.ec-front-product-item-price').text();
			total -= parseInt(price.replace(/,/g, ''), 10);
			$("#total_price_test").val(total);

			let index = chk.indexOf(option_key);
			$(this).closest('tr').remove();
			chk.splice(index, 1);
			totalPrice();
		});
	})
	
	//전체가격
	function totalPrice(){
		$('#totalPrice span em').text($("#total_price_test").val().toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+"원");
	}
	
	// 장바구니 담기
	function addBasket(){
		// 로그인 확인
		if ($("#u_idx").val() == null || $("#u_idx").val().trim() == ''){
			alert("로그인 후 이용하세요.");
			return;
		}
		
		// 장바구니 목록 확인
		var items = $('#totalProducts tbody').children('tr');
		if (items.length < 1){
			alert("필수 옵션을 선택해주세요.");
			return;
		}
		
		for (i = 0; i < items.length; i++){
			$.ajax({
				url:"/shop/product/basketIO.jsp",
				type:"post",
				data: {
					"u_idx": encodeURIComponent($("#u_idx").val()),
					"option_key": encodeURIComponent($(items[i]).find('.option_box_id').val()),
					"b_qty": encodeURIComponent($(items[i]).find('.quantity_opt').val()),
				},
			}).done(function(data) {
			})
		}
		alert("장바구니에 추가되었습니다.");
		$('#totalProducts tbody').empty();
		total = 0;
		$("#total_price_test").val(total);
		totalPrice();
	}
	
	function sendOrder() {
		let optionKeys = [];
	    let b_qtys = [];
		var items = $('#totalProducts tbody').children('tr');
		
		if(items.length == 0){
			alert("옵션을 선택해주세요.");
			return;
		}
		
		u_idx = $("#u_idx").val();
			for (i = 0; i < items.length; i++){
				let optionKey = $(items[i]).find('.option_box_id').val();
				let b_qty = $(items[i]).find('.quantity_opt').val();
				
				optionKeys.push(optionKey);
		        b_qtys.push(b_qty);
			}
		let newUrl = 'Controller?type=orderpage&u_idx='+u_idx+'&option_keys='+optionKeys.join(",")+'&b_qtys='+b_qtys.join(",");
		location.replace(newUrl);

	}
</script>	
</body>
</html>