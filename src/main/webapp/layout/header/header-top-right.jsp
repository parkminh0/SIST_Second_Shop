<%@page import="dao.BbsDAO"%>
<%@page import="vo.BoardCategoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<ul class="JS_topMenu menuOver">
<%
	BoardCategoryVO[] ar2 = null;
	ar2 = BbsDAO.bbscategorysearch();
	
	request.setAttribute("ar", ar2);
%>
<c:set var="ar" value="${requestScope.ar}"/>
    <!-- 로그인전 -->
    <c:if test="${sessionScope.user_vo eq null}">
   		<li><a href="Controller?type=login" class="log">로그인</a></li>
		<li>
	        <a href="Controller?type=signup">회원가입
	        <p class="point_ico"><strong class="mColor -spring_x"><i class="xi-piggy-bank"></i>3000</strong></p><!-- 아이콘 -->
	        </a>
	    </li>
    </c:if>
    <!-- 로그인후 -->
	<c:if test="${sessionScope.user_vo ne null}">
		<c:if test="${sessionScope.user_vo.getAdmin() eq 1}">
			<li><a href="Controller?type=adindex">관리자페이지</a></li>
		</c:if>
		<li><a href="Controller?type=logout">로그아웃</a></li>
		<li><a href="Controller?type=modify">정보수정</a></li>
	</c:if>
	<li class="arrow" id="js_topmenu_li1"><a href="Controller?type=mypage">마이쇼핑</a>
		<ul>
            <li><a href="Controller?type=basket&user_id=${sessionScope.user_vo.id}">장바구니</a></li>
            <li><a href="Controller?type=interest" >관심상품</a></li>
            <li><a href="Controller?type=orderList&user_id=${sessionScope.user_vo.id}">주문조회</a></li>
            <li><a href="Controller?type=myshopmileage&user_id=${sessionScope.user_vo.id}">적립금</a></li>
            <li><a href="Controller?type=mycoupon&u_idx=${sessionScope.user_vo.u_idx}">쿠폰</a></li>
            <li><a href="Controller?type=userbbs&bc_key=5">내게시물</a></li>
		</ul>
	</li>
	<li class="arrow" id="js_topmenu_li2"><a href="Controller?type=fulllist">커뮤니티</a>
		<ul>
			<c:forEach var="bvo" items="${ar}" varStatus="status">
            	<li><a href="Controller?type=bbs&bc_key=${status.index+1}">${bvo.getBc_option1() }</a></li>
            </c:forEach>
		</ul>
	</li>
</ul>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script>
	$(function(){
		$(".JS_topMenu > #js_topmenu_li1").hover(function(){
			$(".JS_topMenu > #js_topmenu_li1").addClass('on');
			$(".JS_topMenu > #js_topmenu_li1 > ul").css('display', 'block');
		}, function(){
			$(".JS_topMenu > #js_topmenu_li1").removeClass('on');
			$(".JS_topMenu > #js_topmenu_li1 > ul").css('display', 'none');
		})
		
		$(".JS_topMenu > #js_topmenu_li2").hover(function(){
			$(".JS_topMenu > #js_topmenu_li2").addClass('on');
			$(".JS_topMenu > #js_topmenu_li2 > ul").css('display', 'block');
		}, function(){
			$(".JS_topMenu > #js_topmenu_li2").removeClass('on');
			$(".JS_topMenu > #js_topmenu_li2 > ul").css('display', 'none');
		})
	})
	
	
</script>