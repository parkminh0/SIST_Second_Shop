<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <c:if test="${param.tab == 'company' }">
    	<title>회사소개</title>
	</c:if>
   	<c:if test="${param.tab == 'shop' }">
    	<title>쇼핑몰 이용안내</title>
	</c:if>
   	<c:if test="${param.tab == 'privacy' }">
    	<title>개인정보처리방침</title>
	</c:if>
   	<c:if test="${param.tab == 'term' }">
    	<title>이용약관</title>
	</c:if>
    
</head>
<body>
	<div id="wrap">
	    <jsp:include page="/layout/header/header.jsp"/>
		<div id="container" class="left">
		    <!-- 왼쪽 사이드 디자인 -->
			<jsp:include page="/layout/login_side/login_side.jsp"/>
		    <div id="contents" class="left">
		    	<c:if test="${param.tab == 'company' }">
					<%@include file="/layout/footer/footers/links/company_info.jsp" %>
				</c:if>
		    	<c:if test="${param.tab == 'shop' }">
					<%@include file="/layout/footer/footers/links/shop_info.jsp" %>
				</c:if>
		    	<c:if test="${param.tab == 'privacy' }">
					<%@include file="/layout/footer/footers/links/privacy.jsp" %>
				</c:if>
		    	<c:if test="${param.tab == 'term' }">
					<%@include file="/layout/footer/footers/links/term_service.jsp" %>
				</c:if>
	    	</div>
		</div>
		<jsp:include page="/layout/side/side.jsp"/>
	    <jsp:include page="/layout/footer/footer.jsp"/>
    </div>
		<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
</body>
</html>