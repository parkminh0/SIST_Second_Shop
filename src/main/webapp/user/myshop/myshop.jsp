<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/shop/user/account/Login.css"/> 
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- PG크로스브라우징필수내용 -->
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="Pragma" content="no-cache" />
    <!-- // PG크로스브라우징필수내용 -->

    <title>마이쇼핑</title>
	<link rel="stylesheet" href="/shop/layout/css/common.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-ui.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-tooltip.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-help.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-paginate.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-tab.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-button.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-box.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-desc.css"/>
	<link rel="stylesheet" href="/shop/user/myshop/css/ec-base-layer.css"/>
	<link rel="stylesheet" href="/shop/user/myshop/css/basketPackage.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-table.css"/>
	<link rel="stylesheet" href="/shop/user/myshop/css/mileageHistoryPackage.css"/>
	<link rel="stylesheet" href="/shop/bbs/css/style.css"/>
	
    <jsp:include page="/layout/base.jsp"/>
</head>
<body>
	<div id="wrap">
	    <jsp:include page="/layout/header/header.jsp"/>
		<div id="container" class="left">
		    <!-- 왼쪽 사이드 디자인 -->
			<jsp:include page="/layout/login_side/login_side.jsp"/>
		    <div id="contents" class="left">
		    	<c:if test="${param.type == 'basket' }">
					<%@include file="/user/myshop/basket/basket.jsp" %>
				</c:if>
		    	<c:if test="${param.type == 'myshopmileage' }">
					<%@include file="/user/myshop/mileage/historyList.jsp" %>
				</c:if>
		    	<c:if test="${param.type == 'mycoupon' }">
					<%@include file="/user/myshop/coupon/mycoupon.jsp" %>
				</c:if>
		    	<c:if test="${param.type == 'mypage' }">
					<%@include file="/user/myshop/mypage.jsp" %>
				</c:if>
		    	<c:if test="${param.type == 'orderList' }">
					<%@include file="/user/myshop/orderList/orderList.jsp" %>
				</c:if>
	    	</div>
		</div>
		<jsp:include page="/layout/side/side.jsp"/>
	    <jsp:include page="/layout/footer/footer.jsp"/>
    </div>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
</body>
</html>