<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="/user/myshop/css/mypagecss.jsp" %>
<style>
	.xans-myshop-orderstate .order li {
		width: 33%;
	}

	.xans-myshop-orderstate .cs li {
		width: 33%;
	}
</style>

<c:set var="uvo" value="${sessionScope.user_vo}" />

<div id="titleArea">
    <h2>마이페이지</h2>
    <span class="xans-element- xans-layout xans-layout-mobileaction ">
    	<a href="#none" onclick="history.go(-1);return false;">
    		<img src="/shop/user/myshop/img/btn_historyGo.png" width="33" alt="뒤로가기"></a>
	</span>
</div>



<div class="myshopMain">
        
    <!-- // PC 디자인 추가 /////////////////////////////////////////////////////////////////////////////////////////////// -->
    <div class="xans-element- xans-myshop xans-myshop-asyncbankbook"><div class="title">
            <h3>나의 쇼핑정보</h3>
        </div>
		<ul>
            <li>
                <strong>총주문</strong>
                <span class="count">
                <span id="xans_myshop_bankbook_order_price">
                ${uvo.getTotal_spend() }
                </span>원<br/>
                (<span id="xans_myshop_bankbook_order_count">
                ${uvo.getOrder_list().size() }
                </span>회)
                </span>
            </li>
            <li class="">
                <strong class="title">총적립금</strong>
                <span class="count">
	                <span id="xans_myshop_bankbook_total_mileage">
                   		${uvo.getTotal_mile() }&nbsp;&nbsp;원
	                </span>
                </span>
            </li>
			<li class=" ">
                <a href="Controller?type=myshopmileage">
                    <strong>가용적립금</strong>
                    <span class="count">
                    	<span id="xans_myshop_bankbook_avail_mileage">
                    		${uvo.getAvail_mile() }&nbsp;&nbsp;원
                    	</span>
                    </span>
                </a>
            </li>
            <li class="">
                <strong class="title">미가용적립금</strong>
                <span class="count">
               		<span id="xans_myshop_bankbook_used_mileage">
                   		${uvo.getUnavail_mile() }&nbsp;&nbsp;원
               		</span>
                </span>
            </li>              
            <li class="">
                <strong class="title">사용적립금</strong>
                <span class="count">
               		<span id="xans_myshop_bankbook_used_mileage">
                   		${uvo.getUsed_mile() }&nbsp;&nbsp;원
               		</span>
                </span>
            </li>
            <li class="">
				<a href="Controller?type=mycoupon">
					<strong>쿠폰</strong>
					<span class="count">
						<span id="xans_myshop_bankbook_coupon_cnt">
							${uvo.getCoupon_list().size() }
						</span>개
					</span>
				</a>
            </li>
        </ul>
</div>
<!-- // PC 디자인 추가 -->

    <div class="xans-element- xans-myshop xans-myshop-orderstate "><div class="title">
            <h3>나의 주문처리 현황 <span class="desc"></span>
</h3>
        </div>
<div class="state">
            <ul class="order">
                <li>
                    <a href="Controller?type=orderList&listType=1&delivery_key=2">
                        <strong>배송준비중</strong>
                        <c:set var="count" value="0" />
                        <c:forEach var="ovo" items="${uvo.getOrder_list() }" >
                        	<c:forEach var="odvo" items="${ovo.getOd_list()}" >
                       		<c:if test="${odvo.getDelivery_key() == 2}">
                        		<c:set var="count" value="${count + 1 }" />
                       		</c:if>
                       		</c:forEach>
                        </c:forEach>
                        <span class="count"><span id="xans_myshop_orderstate_shppied_standby_count">${count }</span>건</span>
                    </a>
                </li>
                <li>
                    <a href="Controller?type=orderList&listType=1&delivery_key=3">
                        <strong>배송중</strong>
                        <c:set var="count" value="0" />
                        <c:forEach var="ovo" items="${uvo.getOrder_list() }" >
                        	<c:forEach var="odvo" items="${ovo.getOd_list()}" >
                       		<c:if test="${odvo.getDelivery_key() == 3}">
                        		<c:set var="count" value="${count + 1 }" />
                       		</c:if>
                       		</c:forEach>
                        </c:forEach>
                        <span class="count"><span id="xans_myshop_orderstate_shppied_begin_count">${count }</span>건</span>
                    </a>
                </li>
                <li>
                    <a href="Controller?type=orderList&listType=1&delivery_key=4">
                        <strong>배송완료</strong>
                        <c:set var="count" value="0" />
                        <c:forEach var="ovo" items="${uvo.getOrder_list() }" >
                        	<c:forEach var="odvo" items="${ovo.getOd_list()}" >
                       		<c:if test="${odvo.getDelivery_key() == 4}">
                        		<c:set var="count" value="${count + 1 }" />
                       		</c:if>
                       		</c:forEach>
                        </c:forEach>
                        <span class="count"><span id="xans_myshop_orderstate_shppied_complate_count">${count }</span>건</span>
                    </a>
                </li>
            </ul>
			<ul class="cs">
			<li>
                    <a href="Controller?type=orderList&listType=2&os_option=1">
                        <span class="icoDot"></span>
                        <strong>취소 : </strong>
                        <c:set var="count" value="0" />
                        <c:forEach var="ovo" items="${uvo.getOrder_list() }" >
                        	<c:forEach var="odvo" items="${ovo.getOd_list()}" >
                        	<c:if test="${odvo.getCancel_qty() > 0 }">
	                       		<c:set var="count" value="${count + 1 }" />
                        	</c:if>
                        	</c:forEach>
                        </c:forEach>
                        <span class="count"><span id="xans_myshop_orderstate_order_cancel_count">${count }</span>건</span>
                    </a>
                </li>
                <li>
                    <a href="Controller?type=orderList&listType=2&os_option=2">
                        <span class="icoDot"></span>
                        <strong>반품 : </strong>
                        <c:set var="count" value="0" />
                        <c:forEach var="ovo" items="${uvo.getOrder_list() }" >
                        	<c:forEach var="odvo" items="${ovo.getOd_list()}" >
                        	<c:if test="${odvo.getRefund_qty() ne 0 }">
	                       		<c:set var="count" value="${count + 1 }" />
                        	</c:if>
                        	</c:forEach>
                        </c:forEach>
                        <span class="count"><span id="xans_myshop_orderstate_order_return_count">${count }</span>건</span>
                    </a>
                </li>
                <li>
                    <a href="Controller?type=orderList&listType=2&os_option=3">
                        <span class="icoDot"></span>
                        <strong>교환 : </strong>
                        <c:set var="count" value="0" />
                        <c:forEach var="ovo" items="${uvo.getOrder_list() }" >
                        	<c:forEach var="odvo" items="${ovo.getOd_list()}" >
                        	<c:if test="${odvo.getIsexchanged() ne 0 }">
	                       		<c:set var="count" value="${count + 1 }" />
                        	</c:if>
                        	</c:forEach>
                        </c:forEach>
                        <span class="count"><span id="xans_myshop_orderstate_order_exchange_count">${count }</span>건</span>
                    </a>
                </li>
            </ul>
</div>
</div>
    <div class="xans-element- xans-myshop xans-myshop-main ">
    	<ul>
			<li class="order"><a href="Controller?type=orderList">주문조회</a></li>
            <li class="modify"><a href="Controller?type=modify">회원정보수정</a></li>
            <li class="wishlist"><a href="Controller?type=interest">관심상품 <span class="count displaynone">(<span class="xans_myshop_main_interest_prd_cnt">0</span>)</span></a></li>
            <li class="mileage"><a href="Controller?type=myshopmileage">적립금</a></li>
            <li class="coupon "><a href="Controller?type=mycoupon">쿠폰 <span class="count displaynone">(<span class="xans_myshop_main_coupon_cnt">0</span>)</span></a></li>
            <li class="board "><a href="Controller?type=bbs&bc_key=5">게시물관리</a></li>
		
		
		<%--
            <li class="likeit "><a href="/skin-skin5/myshop/likeit/product.html">좋아요</a></li>
            <li class="deposits displaynone"><a href="/skin-skin5/myshop/deposits/historyList.html">예치금</a></li>
            <li class="consult displaynone"><a href="/skin-skin5/board/consult/list.html">1:1 맞춤상담</a></li>
			<li class="inquiry" module="Myshop_InquiryDash"><a href="/skin-skin5/board/inquiry/list.html">대량구매 문의 관리</a></li>
            <li class="address"><a href="/skin-skin5/myshop/addr/list.html">배송 주소록 관리</a></li>
            <li class="regularDelivery "><a href="/skin-skin5/myshop/regular_delivery.html">정기배송 관리</a></li>
		--%>
        </ul>
	</div>
</div>