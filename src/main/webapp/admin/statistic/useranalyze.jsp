<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!--@layout(/layout/basic/main.html)-->
 <%-- <%@ include file="/layout/main.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" >
<meta http-equiv="Pragma" content="no-cache" >
<meta http-equiv="Expires" content="-1" >
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/layout_beta.css?vs=2406261322" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/reset_front.css?vs=2406261322" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/suio.css?vs=2406261322" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/dashboard_v3.css?vs=2406261322" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/dashboard_v4.css?vs=2406261322" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/plugin/jquery.mCustomScrollbar.min.css" media="all" charset="utf-8" />

<link rel="stylesheet" type="text/css" href="/shop/admin/css/index.css" media="all" charset="utf-8" />
<link rel="stylesheet" type="text/css" href="/shop/admin/css/statistic.css" media="all" charset="utf-8" />
<style>
.logo{
	margin : 20% 0%;
}
</style>
</head>
<body>
<div id="wrap" class=" beta">
    <hr class="layout" />
    <div id="container">
        <div id="sidebar">
			<div class="logo">
			    <h1>
			        <a href="Controller?type=adindex">
                    	<img src="/shop/layout/header/img/logo_off_new.png" alt="" class="off -mov" width="200"/>
	                </a>
			    </h1>
			</div>
			<div class="snbArea simple">
				<div id="menuList" class="eCustomScrollbar">
					<div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside">
						<div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;">
							<ul class="menu">
		                    	<li class="">
		                			<a id="QA_Lnb_Menu10258" href="Controller?type=adindex" class="link home" name="홈">홈</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu1681" href="Controller?type=adorder" class="link order" name="주문">주문</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu2056" href="Controller?type=adproduct" class="link product" name="상품">상품</a>
		            			</li>
		                        <li class="hasChild">
		                			<a id="QA_Lnb_Menu6" href="Controller?type=aduser" class="link member" name="고객">고객</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu7" href="Controller?type=adbbs" class="link board" name="게시판">게시판</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu1250" href="Controller?type=adcoupon" class="link promotion" name="프로모션">쿠폰</a>
		            			</li>
		                       	<li class="hasChild show">
		                			<a id="QA_Lnb_Menu2060" href="Controller?type=adstatistic" class="link calculate" name="통계">통계</a>
		            			</li>
	            			</ul>
                        </div>
					</div>
				</div>
				<div class="subMenu eClone eCustomScrollbar mCustomScrollbar _mCS_3 mCS-autoHide mCS_no_scrollbar">
					<div id="mCSB_3" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 1016px;">
						<div id="mCSB_3_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
            				<div class="depthList">
                				<ul class="depth2">
                                	<li class=" ">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=adstatistic" class="link ">
				                            <span class="ellips">통계 대시보드</span>
				                        </a>
                    				</li>                                                                     
                                	<li class="">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=adsalesanalyze" class="link ">
				                            <span class="ellips">매출분석</span>
				                        </a>
                    				</li>                                                                     
                                	<li class="">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=adproductanalyze" class="link ">
				                            <span class="ellips">상품분석</span>
				                        </a>
                    				</li>                                                                     
                                	<li class="selected">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=aduseranalyze" class="link ">
				                            <span class="ellips">고객분석</span>
				                        </a>
                    				</li>                                                                     
                 				</ul>
           					</div>
        				</div>
       				</div>
   				</div>
			</div>
        </div>
        <hr class="layout" />
       	<!-- 컨텐츠 시작 -->
       	<div id="content">

            <div class="headingArea">
                <div class="mTitle">
                    <h1>고객 분석 </h1>
                </div>
            </div>
            <form id="searchForm" action="ProductPrdchart" method="get">
                <div class="section" id="QA_product1">
					<div class="mBoard gSmall">
				    <table border="1" summary="">
				        <caption>고객 분석 </caption>
				        <tbody>
				        <tr>
				            <th scope="row">조회 구분</th>
				            <td>
				                <select class="fSelect category eCategory" id="search_by" name="search_by"> 
			                    	<option value="">- 구분 선택 -</option>
		                    		<option value="1">요일별 활동 분석 </option>
		                    		<option value="2">회원 등급별 분석 </option>
		                    		<option value="3">적립금 분석 </option>
		                    	</select>
				            </td>
				        </tr>
				        <tr id="search_date">
				            <th scope="row">기간</th>
				            <td style="position: relative;">
				                <a href="#none" class="btnDate" data-days="0"><span>오늘</span></a>
				                <a href="#none" class="btnDate" data-days="1"><span>어제</span></a>
				                <a href="#none" class="btnDate" data-days="3"><span>3일</span></a>
				                <a href="#none" class="btnDate selected" data-days="7"><span>7일</span></a>
				                <a href="#none" class="btnDate" data-days="30"><span>1개월</span></a>
				                <a href="#none" class="btnDate" data-days="90"><span>3개월</span></a>
				                <a href="#none" class="btnDate" data-days="180"><span>6개월</span></a>
				                <div class="duet-date-picker-grid sun  duet-date-theme-ec-new ">
									<input type="date" name="start_date" id="start_date"/>				                    
									~
									<input type="date" name="end_date" id="end_date"/>		
				                </div>
				            </td>
				        </tr>
				        </tbody>
				    </table>
					</div>
					<div class="mButton gCenter">
					    <a href="#" onclick="getList(0);" id="search_button" class="btnSearch"><span>검색</span></a>
					</div>                                    
				</div>
			</form>
            <div class="section" id="QA_product3" style="display:none;">
       		</div>
       	</div>
		<!-- 여기까지 content -->
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script>
	let today = new Date();
	let sevenDaysAgo = new Date();
	sevenDaysAgo.setDate(today.getDate() - 7);
	
	document.getElementById('end_date').value = today.toISOString().substring(0, 10);
	document.getElementById('start_date').value = sevenDaysAgo.toISOString().substring(0, 10);

	$(function(){
		$("a.btnDate").click(function(){
			let end_date = new Date($("#end_date").val());
			let minus_date = $(this).data("days");
			let tmp = new Date();
			tmp.setDate(end_date.getDate() - minus_date);
			let start_date = tmp.toISOString().substring(0, 10);
			$("#start_date").val(start_date);
			
			$("a.btnDate").removeClass("selected");
			$(this).addClass("selected");
		});
	});
	
	function getList(cPage){
		if ($("#search_by").val() == null || $("#search_by").val() == ''){
			alert("조회 구분을 선택하세요");
			return;
		}
		
		var frm = $("form").serialize();
		$.ajax({
			type:"post",
			url: "/shop/admin/statistic/useranalyzeIO.jsp?cPage="+cPage,
			data: frm,
		}).done(function(data){
			$("div#QA_product3").html(data);
			$("div#QA_product3").css('display', '');
		});
	}
</script>
</body>
</html>