<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="skipNavigation">
    <p><a href="#category">전체상품목록 바로가기</a></p>
    <p><a href="#contents">본문 바로가기</a></p>
</div>

<link rel = "stylesheet" href = "/shop/layout/header/css/header.css">
<div id="header">
    <div class="part_01">
    	<div class="inner">
            <!-- SNS 아이콘 -->
            <jsp:include page="/layout/header/header-top-left.jsp"/>
            
            <!-- 상단 우측 메뉴 -->
            <!--@import(/_wg/import/JS_topMenu.html)-->
            <jsp:include page="/layout/header/header-top-right.jsp"/>
        </div><!--//.inner-->
    </div><!--//.part_01-->

    <div class="part_02">
        <div class="p0201">
            <div class="inner">
                <!-- 로고 -->
                <!--@import(/_wg/import/logo.html)-->
            <jsp:include page="/layout/header/logo.jsp"/>
                <div class="right_section">
                    <!-- 검색창 -->
                    <!--@import(/_wg/import/header_search.html)-->
            		<jsp:include page="/layout/header/header_search.jsp"/>

                    <!-- 상단 아이콘 -->
                    <!--@import(/_wg/import/header_icon.html)-->
            		<jsp:include page="/layout/header/header_search-right.jsp"/>
                </div>
			</div><!--//.inner-->
        </div><!--//.p0201-->
        
        <div class="p0202">
            <div class="inner menu_start">
                <!-- 카테고리 전체보기 -->
            		<jsp:include page="/layout/header/category-left.jsp"/>
                
                <div id="category_scroll"><!-- 모바일에서 스크롤생성 -->
                    <div class="wrap_category_scroll">
                    	<jsp:include page="/layout/header/category-mid.jsp"/>
						<!--@import(/_wg/import/lineMenu.html)-->
                    </div>
                </div>
                <jsp:include page="/layout/header/category-right.jsp"/>
			</div><!--//.inner-->
        </div><!--//.p0202-->
    </div><!--//.part_02-->
</div><div class="divClear"></div>