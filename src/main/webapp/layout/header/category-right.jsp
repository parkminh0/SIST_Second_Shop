<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 수정전 반드시 백업을 하시고 수정하시기 바랍니다!!!!! -->
<!-- 추가메뉴3 -->
<ul class="nav categorySub m03">
    
    <!-- 타임세일 -->
	<li class="">
        <a href="Controller?type=orderList">링크</a>
        <i class="xi-receipt"></i>
        <div class="-caption"><p>주문조회</p></div>
<%--         <p class="sale_ico -spring_y">SALE</p> --%>
    </li>
    
    <!-- 브랜드 -->
    <li class="brand">
        <a href="Controller?type=myshopmileage">링크</a>
        <i class="xi-piggy-bank"></i>
        <div class="-caption"><p>적립금</p></div>
    </li>
    
    <!-- 포토리뷰 -->
    <li class="photoReview">
        <a href="Controller?type=mycoupon">링크</a>
        <i class="xi-coupon"></i>
        <div class="-caption"><p>쿠폰</p></div>
    </li>
    
</ul>