<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!--------------
		CSS
	--------------->
	<link rel="stylesheet" href="/shop/layout/css/fix_cafe.css"/>
	<link rel="stylesheet" href="/shop/layout/css/wg.css"/>
	<link rel="stylesheet" href="/shop/layout/css/owl.carousel.min.css"/>
	<link rel="stylesheet" href="/shop/layout/css/jquery.mCustomScrollbar.min.css"/>
	<link rel="stylesheet" href="/shop/layout/css/on_off.css"/>
    <!--@css(/_wg/css/fix_cafe.css)-->
    <!--@css(/_wg/css/wg.css)-->
	<!--@css(/_wg/css/owl.carousel.min.css)-->
	<!--@css(/_wg/css/jquery.mCustomScrollbar.min.css)-->
    <!--@css(/_wg/css/on_off.css)-->

	<!-- 폰트 -->
    <link href="//fonts.googleapis.com/css?family=Nanum+Gothic:400,700&display=swap&subset=korean" type="text/css" rel="stylesheet">
	<!--@css(/_wg/css/xeicon.css)-->
	<link rel="stylesheet" href="/shop/layout/css/xeicon.css"/>
	




    <!--------------
		JS
	--------------->
    <!-- 
        jQuqery(1.12.4.min.js) 
        /_wg/js/jquery-1.12.4.min.js 에 (OwlCarousel2, scrollbar) 원본코드 포함
        OwlCarousel2, scrollbar, fancyBox,
        $jq로 사용가능
    -->
    <script src="/_wg/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        window.$jq = jQuery.noConflict(true);
        window.$newAt = window.$jq; 
        function tl_isMobile(){
            var UserAgent = navigator.userAgent;
            if (UserAgent.match(/iPhone|iPod|iPad|Android|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
                return true;
            }else{
                return false;
            }
        }
    </script>
	<!--@js(/_wg/js/jq.easing.1.3.js)-->
    <!--@js(/_wg/js/jquery.easing.min.js)-->
	<!--@js(/_wg/js/jquery.owlOneItemExt.js)-->
	<!--@js(/_wg/js/jquery.owlTimer.js)-->
    <!--@js(/_wg/js/prefixfree.min.js)-->
    <!--@js(/_wg/js/jquery.cookie.js)-->
    <!--@js(/_wg/js/lazyload.min.js)-->
	<!--@js(/_wg/js/jquery.bpopup_t.js)-->
    <!--@js(/_wg/js/jquery.DB.min.js)-->
    <!--@js(/_wg/js/wg.js)-->
    <!--@js(/_wg/js/set.js)-->

	<!-- 모바일 전용 -->
    <!--@js(/_wg/js/common.js)-->
