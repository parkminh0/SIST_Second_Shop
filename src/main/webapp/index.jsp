<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!--@layout(/layout/basic/main.html)-->
 <%-- <%@ include file="/layout/main.jsp" %> --%>
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

    <title>쌍용마켙</title>
	<link rel="stylesheet" href="/shop/layout/css/common.css"/>
    <!-- <link rel="stylesheet" href="/shop/layout/css/layout.css"/>
	<link rel="stylesheet" href="/shop/layout/css/xeicon.css"/> -->
	<link rel="stylesheet" href="/shop/layout/css/ec-base-ui.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-tooltip.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-help.css"/>
	<!-- <link rel="stylesheet" href="/shop/layout/css/ec-base-product.css"/> -->
	<link rel="stylesheet" href="/shop/layout/css/ec-base-paginate.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-tab.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-button.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-box.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-table.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-desc.css"/>
    
    <!--@import(/_wg/base.html)--><!-- 베이스 -->
    <jsp:include page="/layout/base.jsp"/>
     <!-- 좌측 디자인(메인) -->
     <!--@css(/_wg/css/left_main.css)-->
	 <link rel="stylesheet" href="/shop/layout/left_main/css/left_main.css"/>
	 <link rel="stylesheet" href="/shop/product/css/menupackage.css"/>
	 
	 <link rel="stylesheet" href="/shop/layout/css/index.css"/>
	<style>
		#video-container {
		    width: 100%;
		    max-width: 840px;
		    margin: 0 auto;
		    text-align: center;
		}
		
		
	</style>
</head>
<body id="main">
<%
	session.setAttribute("prevPage", "Controller?type=index");
%>
<input type="hidden" id="u_idx" value="${sessionScope.user_vo.getU_idx() }" />
<div id="wrap">
    <!-- 상단 디자인 -->
    <!--@import(/_wg/import/header.html)-->
    <jsp:include page="/layout/header/header.jsp"/>
    
    <div id="container">
	     <!--@import(/_wg/import/left_main.html)-->
	     <jsp:include page="/layout/left_main/left_main.jsp"/>  
        <div id="contents_main">
            <!--@contents-->
        </div>
    </div><hr class="layout" />
    
    <!-- 동영상 재생 영역 추가 -->
    <div id="video-container">
        <video id="myVideo" width="100%" preload autoplay muted loop>
            <source src="/shop/video/mainpage_vid.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
    </div>
    
	<%! String listType = ""; %>
			<div module="product_listmain_1" class="ec-base-product move-page indWrapper">
			   
			    <h2 class="indH2">
			        <div class="titImg move-tit"><img src="/shop/layout/img/newRecProd.png" alt="신상+추천" />신상과 추천</div>
			    </h2>
			    <ul class="prdList grid4 horiScroll">
			    	<%listType = "newRec"; %>
			        <%@include file="/index_prodList.jsp" %>
			    </ul>
			</div>

			<div module="product_listmain_2" class="ec-base-product move-page indWrapper">
			    <h2 class="indH2">
			        <div class="titImg move-tit"><img src="/shop/layout/img/newProd.png" alt="신상" />신상</div>
			    </h2>
			    <ul class="prdList grid4 horiScroll">
			    	<%listType = "new"; %>
			        <%@include file="/index_prodList.jsp" %>
			    </ul>
			</div>

			<div module="product_listmain_3" class="ec-base-product move-page indWrapper">
			    
			    <h2 class="indH2">
			        <div class="titImg move-tit"><img src="/shop/layout/img/recProd.png" alt="추천" />추천</div>
			    </h2>
			    <ul class="prdList grid4 horiScroll">
			    	<%listType = "rec"; %>
			        <%@include file="/index_prodList.jsp" %>
			    </ul>
			</div>
		<%if(session.getAttribute("user_vo") != null){ %>
			<%if(((UserVO)session.getAttribute("user_vo")).getBasket_list() != null && ((UserVO)session.getAttribute("user_vo")).getBasket_list().size() > 0 ){ %>
			<div module="product_listmain_4" class="ec-base-product move-page indWrapper">
			    <h2 class="indH2">
			        <div class="titImg move-tit"><img src="/shop/layout/img/basket.png" alt="장바구니" />장바구니</div>
			    </h2>
			    <ul class="prdList grid4 horiScroll">
			    	<%listType = "basket"; %>
			        <%@include file="/index_prodList.jsp" %>
			    </ul>
			</div>
			<%} %>
			<%if(((UserVO)session.getAttribute("user_vo")).getInterest_list() != null && ((UserVO)session.getAttribute("user_vo")).getInterest_list().size() > 0 ){ %>
			<div module="product_listmain_5" class="ec-base-product move-page indWrapper">
			    <h2 class="indH2">
			        <div class="titImg move-tit"><img src="/shop/layout/img/interest.png" alt="관심상품" />관심상품</div>
			    </h2>
			    <ul class="prdList grid4 horiScroll">
			    	<%listType = "interest"; %>
			        <%@include file="/index_prodList.jsp" %>
			    </ul>
			</div>
			<%} %>
		<%} %>

        </div>
    </div><hr class="layout" />
    
    <!-- 하단 디자인 -->
    <!--@import(/_wg/import/footer.html)-->
    <jsp:include page="/layout/footer/footer.jsp"/>

    <!-- 우측 디자인 -->
    <!--@import(/_wg/_cPack/cp550/dom.html)-->
    <jsp:include page="/layout/side/side.jsp"/>
    
    <!-- cp701(인트로팝업) -->
    <!--@import(/_wg/_cPack/cp701/dom.html)-->
    
    <!-- cp703(스마트팝업) -->
    <!--@import(/_wg/_cPack/cp703/dom.html)-->

</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script type="text/javascript">
	$(function(){
		$('img[name=interest_img]').click(function(){
			if ($("#u_idx").val() == null || $("#u_idx").val().trim() == ''){
				alert("로그인 후 이용하세요.");
				return;
			}
			
			/* 관심상품 취소할 경우 */
			if ($(this).attr("src") == "/shop/product/img/after_interest.png"){
				$(this).attr("src", "/shop/product/img/before_interest.png");
				$.ajax({
					url:"/shop/product/interestIO.jsp",
					type:"post",
					data: {
						"product_key": encodeURIComponent($(this).attr("alt")),
						"mode": "off",
					},
				}).done(function(data) {
				});
			}
			/* 관심상품 등록할 경우 */
			else {
				$(this).attr("src", "/shop/product/img/after_interest.png");
				$.ajax({
					url:"/shop/product/interestIO.jsp",
					type:"post",
					data: {
						"product_key": encodeURIComponent($(this).attr("alt")),
						"mode": "on",
					},
				}).done(function(data) {
				});
			}
		})
		
		$('select[name=selArray]').change(function(){
		    var orderby = $(this).val();
		    location.href = orderby;
		});
	});
</script>
</body>
</html>
