<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--@layout(/layout/basic/layout.html)-->
<jsp:include page="/layout/base.jsp"/>
<link rel="stylesheet" href="/shop/user/account/css/privacy.css"/>

<div class="titleArea">
    <h2>개인정보처리방침</h2>
</div>

<div module="mall_privacy">
    <!--@css(/css/module/mall/privacy.css)-->
    <div class="ec-base-box typeThinBg">
        <strong class="date {$displayEnforce|display}">{$enforce_date}</strong>
        <div class="agree">
            {$privacy_agreement}
        </div>
    </div>
    <div class="ec-base-button {$displayBeforeEnforce|display}">
        <span class="gRight">
        	<a href="{$before_enforce_link}" class="btnLink" target="_blank">{$before_enforce_date}</a>
        </span>
    </div>
</div>