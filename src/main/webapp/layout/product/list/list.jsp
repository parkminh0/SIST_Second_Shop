<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--@layout(/layout/basic/layout.html)-->
<jsp:include page="/layout/main.jsp"/>
<div module="Product_menupackage" class="product_menupackage">
    <!--@css(/_wg/css/menupackage.css)-->
<link rel = "sheetstyle" href ="../css/menupackage.css"/>
    <div class="path" module="product_headcategory">
        <span>현재 위치</span>
        <ol>
            <li><a href="/">홈</a></li>
            <li class="{$disp_cate_1|display}"><a href="{$link_product_list_1}">{$name_1}</a></li>
            <li class="{$disp_cate_2|display}"><a href="{$link_product_list_2}">{$name_2}</a></li>
            <li class="{$disp_cate_3|display}"><a href="{$link_product_list_3}">{$name_3}</a></li>
            <li class="{$disp_cate_4|display}"><strong><a href="{$link_product_list_4}">{$name_4}</a></strong></li>
        </ol>
    </div>

    <div class="titleArea" module="product_headcategory">
        <div class="top_banner">{$top_image1_tag}{$top_image2_tag}{$top_image3_tag}</div>
        <h2>{$title_text}</h2>
    </div>

    <ul class="menuCategory p0202">
        <li module="product_displaycategory" style="display:{$display};" class="{$selected} dm2 li">
            <a href="{$link_product_list_sub}">{$category_name} <span class="count {$product_count_display|display}">({$product_count})</span></a>
            <ul module="product_children" class="dm3-wrap">
                <li class="{$selected} dm3 li">
                    <a href="{$link_product_list_sub}">{$category_name} <span class="{$product_count_display|display}">({$product_count})</span></a>                   
                    <ul module="product_children" class="subCategory dm4-wrap">
                        <li class="{$selected} dm4"><a href="{$link_product_list_sub}">{$category_name} <span class="{$product_count_display|display}">({$product_count})</span></a></li>
                        <li class="{$selected} dm4"><a href="{$link_product_list_sub}">{$category_name} <span class="{$product_count_display|display}">({$product_count})</span></a></li>
                    </ul>
                </li>
                <li class="{$selected} dm3 li">
                    <a href="{$link_product_list_sub}">{$category_name} <span class="{$product_count_display|display}">({$product_count})</span></a>                   
                    <ul module="product_children" class="subCategory dm4-wrap">
                        <li class="{$selected} dm4"><a href="{$link_product_list_sub}">{$category_name} <span class="{$product_count_display|display}">({$product_count})</span></a></li>
                        <li class="{$selected} dm4"><a href="{$link_product_list_sub}">{$category_name} <span class="{$product_count_display|display}">({$product_count})</span></a></li>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
</div><div class="divClear"></div>

<!-- 추천상품-->
<div module="product_listrecommend" class="ec-base-product normal">
    <!--
        $count = 4
        $basket_result = /product/add_basket.html
        $basket_option = /product/basket_option.html
    -->
    <h2>
        BEST ITEMS
        <div class="line"></div>
    </h2>
    <ul class="prdList grid4">
        <!--@import(/_wg/import/prdList.html)-->
        
    </ul>
</div>

<!-- 신상품 (New arrivals) -->
<div module="product_listnew" class="ec-base-product normal">
    <!--
        $count = 4
        $basket_result = /product/add_basket.html
        $basket_option = /product/basket_option.html
    -->
    <h2>
        NEW ITEMS
        <div class="line"></div>
    </h2>
    <ul class="prdList grid4">
        <!--@import(/_wg/import/prdList.html)-->
        <jsp:include page="./prdList.jsp"/>
    </ul>
</div>

<!-- 일반상품 -->
<div module="product_normalpackage">
    <!--@css(/_wg/css/listnormal.css)-->
    <div id="Product_ListMenu" class="anchor"></div><!-- 앵커변경 -->
    <div module="product_normalmenu" id="{$listmenu_position}">
        <!--
            $compare_page = /product/compare.html
        -->
        <div class="function">
            <p class="prdCount"><strong>{$total_count}</strong> ITEMS</p>
            <select id="selArray" name="selArray" module="product_Orderby">
                <option value="{$param}">{$sort_name}</option>
                <option value="{$param}">{$sort_name}</option>
            </select>
            <span class="compare {$product_compare_display|display}"><a href="#none" onclick="{$product_compare_action}">상품비교</a></span>
        </div>

        <fieldset class="condition {$select_search_display|display}">
            <legend>조건별 검색</legend>
            <p>
                <!--@js(/js/module/product/product_selectsearch.js)-->
                <select class="FirstSelect" module="product_FirstSelect">
                    <option value="">-조건선택-</option>
                    <option value="{$value}" {$selected}>{$title}</option>
                    <option value="{$value}" {$selected}>{$title}</option>
                </select>
                <select class="SecondSelect" module="product_SecondSelect">
                    <option value="">-조건선택-</option>
                    <option value="{$value}" {$selected}>{$title}</option>
                    <option value="{$value}" {$selected}>{$title}</option>
                </select>
                <a href="#SelectSearch" class="btnSubmit">검색</a>
            </p>
        </fieldset>
    </div>

    <div module="product_listnormal" class="ec-base-product normal">
        <!--
            $count = 20
            $basket_result = /product/add_basket.html
            $basket_option = /product/basket_option.html
        -->
        <ul class="prdList grid4">
            <!--@import(/_wg/import/prdList.html)-->
        </ul>
    </div>
</div>

<div module="product_normalpaging" class="ec-base-paginate">
    <a href="{$param_first}" class="first"><img src="/_wg/img/_btn/btn_page_first.png" alt="첫 페이지" /></a>
    <a href="{$param_before}"><img src="/_wg/img/_btn/btn_page_prev.png" alt="이전 페이지" /></a>
    <ol>
        <li><a href="{$param}" class="{$param_class}">{$no}</a></li>
        <li><a href="{$param}" class="{$param_class}">{$no}</a></li>
        <li><a href="{$param}" class="{$param_class}">{$no}</a></li>
    </ol>
    <a href="{$param_next}"><img src="/_wg/img/_btn/btn_page_next.png" alt="다음 페이지" /></a>
    <a href="{$param_last}" class="last"><img src="/_wg/img/_btn/btn_page_last.png" alt="마지막 페이지" /></a>
</div>