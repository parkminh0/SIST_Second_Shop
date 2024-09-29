<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--

	### 상품이미지 노출방식 변경 ###

	1. 기본이미지 - 등록된 이미지중 목록이미지만 대표로 노출됩니다.
	2. 추가이미지 - 대표로 보이는건 목록이미지이고, 추가이미지가 등록되면 하단에 버튼이 생성되어 상품이미지를 더 볼 수 있습니다. (대표로 설정되어있습니다.)
	3. 롤오버이미지 - 대표로 보이는건 목록이미지이고, 첫번재 추가이미지가 마우스 오버시 노출되겠습니다.
	4. 확대이미지 - 대표로 보이는건 목록이미지이고, 마우스 오버시 목록이미지가 살짝 확대되어 보입니다.

	해당 페이지 html소스중 추가이미지로 되어 있는 주석부분을 아래의 4개중 원하시는 소스로 변경해주시면 되겠습니다.


			---------------------------------------------------------------------------------------------------------------------------------------


            1. 기본 이미지
			<div class="normal_thumb">
                <img src="{$image_medium}" id="{$image_medium_id}" alt="{$seo_alt_tag}" />
            </div>


			---------------------------------------------------------------------------------------------------------------------------------------
            

            2. 추가이미지 ( 대표로 설정되어 있습니다. )
            <div class="add_thumb">
                <img src="{$image_medium}" id="{$image_medium_id}" class="off" alt="{$seo_alt_tag}" />
                <div class="d_thumb">
                    <ul class="img">
                        <li><img src="{$image_medium}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src1}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src2}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src3}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src4}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src5}" alt="{$seo_alt_tag}" /></li>
                    </ul>
                    <ul class="btn"></ul>
                    <span class="arrow prev">이전</span>
                    <span class="arrow next">다음</span>
                </div>
            </div>


			---------------------------------------------------------------------------------------------------------------------------------------
            

            3. 롤오버 이미지 
			<div class="roll_thumb">
                <img src="{$image_medium}" id="{$image_medium_id}" alt="{$seo_alt_tag}" />
                <img src="{$add_image_src1}" id="{$image_medium_id}" class="on -mov" alt="{$seo_alt_tag}" />
            </div>
            

			---------------------------------------------------------------------------------------------------------------------------------------


            4. 확대 이미지
			<div class="big_thumb">
                <img src="{$image_medium}" id="{$image_medium_id}" alt="{$seo_alt_tag}" />
            </div>


			---------------------------------------------------------------------------------------------------------------------------------------
-->
<li class="item DB_rate" id="anchorBoxId_{$product_no}" data-price="{$product_custom}^{$product_price}">
    <div class="thumbnail">
        <span class="chk"><input type="checkbox" class="{$product_compare_class} {$product_compare_display|display}" /></span><!-- 체크박스 -->
        <div class="dc_rate md sColor -mov"><span class="sale">{$prd_price_sale}</span><div class="per"></div></div><!-- 할인률 -->
        <div class="-likeButton {$disp_likeprd_class} -mov"><button type="button" class="-mov">{$disp_likeprd_icon}<strong>{$disp_likeprd_count}</strong></button></div><!-- 좋아요 -->
        <div class="list_button -mov">
            <span class="zoom"><a href="/product/detail.html{$param}" target="_blank"><img src="/_wg/img/_btn/list_blank.png"></a></span><!-- 새창보기 -->
            <span class="basket">{$basket_icon}</span><!-- 장바구니 -->
            <span class="option">{$option_preview_icon}</span><!-- 옵션보기 -->
            <span class="wish">{$list_wish_icon}</span><!-- 관심상품 -->
        </div>
        <a href="/product/detail.html{$param}" name="anchorBoxName_{$product_no}">
            <span module="product_Imagestyle"><span class="prdIcon {$icon_class_name}" style="background-image:url('{$icon_url}');"></span></span><!-- 꾸미기 아이콘 -->

            <!-- 추가이미지 -->
            <div class="add_thumb">
                <img src="{$image_medium}" id="{$image_medium_id}" class="off" alt="{$seo_alt_tag}" />
                <div class="d_thumb">
                    <ul class="img">
                        <li><img src="{$image_medium}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src1}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src2}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src3}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src4}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src5}" alt="{$seo_alt_tag}" /></li>
                    </ul>
                    <ul class="btn"></ul>
                    <span class="arrow prev">이전</span>
                    <span class="arrow next">다음</span>
                </div>
            </div><!-- //추가이미지 -->
            
        </a>
    </div>
    <div class="description">
        <!-- 컬러칩 -->
        <p class="color {$colorchip_display|display}">
            <div module="product_Colorchip" class="colorChip">
                <span class="chips" style="background-color:{$color}"></span>
                <span class="chips" style="background-color:{$color}"></span>
            </div>
        </p>
        <p class="name">
            <a href="/product/detail.html{$param}" class="{$product_name_display|display}"><span class="title {$product_name_title_display|display}">{$product_name_title} :</span> {$product_name}</a>
            <div class="line -mov"></div>
        </p>
        <ul module="product_ListItem" class="spec">
            <li class="{$item_display|display}"><strong class="title {$item_title_display|display}">{$item_title} :</strong> {$item_content}</li>
            <li class="{$item_display|display}"><strong class="title {$item_title_display|display}">{$item_title} :</strong> {$item_content}</li>
        </ul>
        <div class="status">
            <div class="icon">{$soldout_icon} {$stock_icon} {$recommend_icon} {$new_icon} {$product_icons} {$pickup_icon} {$benefit_icons}</div><!-- 아이콘 -->
        </div>
    </div>
</li>
<li class="item DB_rate" id="anchorBoxId_{$product_no}" data-price="{$product_custom}^{$product_price}">
    <div class="thumbnail">
        <span class="chk"><input type="checkbox" class="{$product_compare_class} {$product_compare_display|display}" /></span><!-- 체크박스 -->
        <div class="dc_rate md sColor -mov"><span class="sale">{$prd_price_sale}</span><div class="per"></div></div><!-- 할인률 -->
        <div class="-likeButton {$disp_likeprd_class} -mov"><button type="button" class="-mov">{$disp_likeprd_icon}<strong>{$disp_likeprd_count}</strong></button></div><!-- 좋아요 -->
        <div class="list_button -mov">
            <span class="zoom"><a href="/product/detail.html{$param}" target="_blank"><img src="/_wg/img/_btn/list_blank.png"></a></span><!-- 새창보기 -->
            <span class="basket">{$basket_icon}</span><!-- 장바구니 -->
            <span class="option">{$option_preview_icon}</span><!-- 옵션보기 -->
            <span class="wish">{$list_wish_icon}</span><!-- 관심상품 -->
        </div>
        <a href="/product/detail.html{$param}" name="anchorBoxName_{$product_no}">
            <span module="product_Imagestyle"><span class="prdIcon {$icon_class_name}" style="background-image:url('{$icon_url}');"></span></span><!-- 꾸미기 아이콘 -->

            <!-- 추가이미지 -->
            <div class="add_thumb">
                <img src="{$image_medium}" id="{$image_medium_id}" class="off" alt="{$seo_alt_tag}" />
                <div class="d_thumb">
                    <ul class="img">
                        <li><img src="{$image_medium}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src1}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src2}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src3}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src4}" alt="{$seo_alt_tag}" /></li>
                        <li><img class="lazy" data-src="{$add_image_src5}" alt="{$seo_alt_tag}" /></li>
                    </ul>
                    <ul class="btn"></ul>
                    <span class="arrow prev">이전</span>
                    <span class="arrow next">다음</span>
                </div>
            </div><!-- //추가이미지 -->
            
        </a>
    </div>
    <div class="description">
        <!-- 컬러칩 -->
        <p class="color {$colorchip_display|display}">
            <div module="product_Colorchip" class="colorChip">
                <span class="chips" style="background-color:{$color}"></span>
                <span class="chips" style="background-color:{$color}"></span>
            </div>
        </p>
        <p class="name">
            <a href="/product/detail.html{$param}" class="{$product_name_display|display}"><span class="title {$product_name_title_display|display}">{$product_name_title} :</span> {$product_name}</a>
            <div class="line -mov"></div>
        </p>
        <ul module="product_ListItem" class="spec">
            <li class="{$item_display|display}"><strong class="title {$item_title_display|display}">{$item_title} :</strong> {$item_content}</li>
            <li class="{$item_display|display}"><strong class="title {$item_title_display|display}">{$item_title} :</strong> {$item_content}</li>
        </ul>
        <div class="status">
            <div class="icon">{$soldout_icon} {$stock_icon} {$recommend_icon} {$new_icon} {$product_icons} {$pickup_icon} {$benefit_icons}</div><!-- 아이콘 -->
        </div>
    </div>
</li></html>