<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="//www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- PG크로스브라우징필수내용 -->
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="Pragma" content="no-cache" />
    <!-- // PG크로스브라우징필수내용 -->

    <title>기본 레이아웃</title>
    <!--@css(/layout/basic/css/common.css)--><!-- 해당 CSS는 쇼핑몰 전체 페이지에 영향을 줍니다. 삭제와 수정에 주의해주세요. -->
    <!--@css(/layout/basic/css/layout.css) 사용안함 -->
    <!--@css(/layout/basic/css/ec-base-ui.css)-->
    <!--@css(/layout/basic/css/ec-base-tooltip.css)-->
    <!--@css(/layout/basic/css/ec-base-help.css)-->
    <!--@css(/layout/basic/css/ec-base-product.css) 사용안함 -->
    <!--@css(/layout/basic/css/ec-base-paginate.css)-->
    <!--@css(/layout/basic/css/ec-base-tab.css)-->
    <!--@css(/layout/basic/css/ec-base-button.css)-->
    <!--@css(/layout/basic/css/ec-base-box.css)-->
    <!--@css(/layout/basic/css/ec-base-table.css)-->
    <!--@css(/layout/basic/css/ec-base-desc.css)-->

    <!-- 스마트디자인에서는 JQuery 1.4.4 버전이 내장되어있습니다. 추가로 호출하면 충돌이 생길 수 있습니다. -->
    <!--@js(/layout/basic/js/basic.js)-->
    <!--@js(/js/common.js)-->
    <!--@js(/js/module/layout/quick_view.js)-->
    
    <!--@import(/_wg/base.html)--><!-- 베이스 -->
</head>
<body>
<div id="wrap">
    <!-- 상단 디자인 -->
    <!--@import(/_wg/import/header.html)-->
    
    <div id="container">
        <!-- 좌측 디자인(서브) -->
        <!--@css(/_wg/css/left_main.css)-->
        <!--@import(/_wg/import/left_sub.html)-->
        
        <!-- 좌측 디자인(고객센터) -->
        <!--@import(/_wg/import/left.html)-->

        <div id="contents">
            <!--@contents-->
        </div>
    </div><hr class="layout" />
    
    <!-- 하단 디자인 -->
    <!--@import(/_wg/import/footer.html)-->

    <!-- 우측 디자인 -->
    <!--@import(/_wg/_cPack/cp550/dom.html)-->

	<!-- 최근본상품 -->
    <!--@import(/_wg/import/productRecent.html)-->
</div>
</body>
</html>