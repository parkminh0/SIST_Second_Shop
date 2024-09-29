<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" type="text/css" href="/shop/admin/css/productCate.css" media="all" charset="utf-8" />
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
		                        <li class="hasChild show">
		                			<a id="QA_Lnb_Menu2056" href="Controller?type=adproduct" class="link product" name="상품">상품</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu6" href="Controller?type=aduser" class="link member" name="고객">고객</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu7" href="Controller?type=adbbs" class="link board" name="게시판">게시판</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu1250" href="Controller?type=adcoupon" class="link promotion" name="프로모션">쿠폰</a>
		            			</li>
		                       	<li class="hasChild ">
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
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=adproduct" class="link ">
				                            <span class="ellips">상품목록</span>
				                        </a>
                    				</li>
                                    <li class="">
				                        <a id="QA_Lnb_Menu2031" href="Controller?type=adproductcrud" class="link">
				                            <span class="ellips">상품등록 | 수정</span>
				                        </a>
                    				</li>
                                    <li class="selected">
				                        <a id="QA_Lnb_Menu10477" href="Controller?type=adproductcate" class="link ">
				                            <span class="ellips">분류 관리</span>
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
        <div id="content">
       	<!-- 컨텐츠 시작 -->
		    <div class="headingArea">
		        <div class="mTitle">
		            <h1>상품분류 관리</h1>
		        </div>
			</div>
   			<div class="categorySetArea">
		        <div class="gFlow">
		            <div class="section" id="QA_setting1">
		                <div class="mTitle">
		                    <h2>상품분류 설정</h2>
		                </div>
		                <form id="eSubmitNode">
		                    <div class="mCtrl typeHeader">
		                        <div class="gLeft">
		                            <a href="#none" onclick="addCategory();" class="btnNormal eAddLargeCategoryBtn">
		                                <span>분류추가</span>
		                            </a>
                        		</div>
                    		</div>
		                    <div class="mCategorySet">
		                    	<p class="notice">수정할 분류를 선택하세요.</p>
		                    	<p class="notice" style="color:red;">더블클릭 하셔야 인식됩니다.</p>
		                    	<ul class="dynatree-container">
		                    		<c:forEach var="cate1" items="${applicationScope.category_list}">
		                    			<c:if test="${cate1.category_name eq '미분류'}">
									        <li id="category-${cate1.category_key}" style="pointer-events: none; opacity: 0.5;" class="">
					                    		<span class="cate1 dynatree-node dynatree-folder dynatree-has-children dynatree-exp-c dynatree-ico-cf">
						                    		<span class="dynatree-expander cate1_expander"></span>
						                    		<span class="dynatree-contents" data-upcate="0" data-nowcate="${cate1.category_key}" data-cate1="${cate1.category_key}">
						                    			<input type="hidden" name="cate1_text" value="${cate1.category_name}"/>
						                    			<a href="#">${cate1.category_name}</a>
					                    			</span>
				                    			</span>
			                    			</li>
                                      	</c:if>
                                      	<c:if test="${cate1.category_name ne '미분류' }">
			                    			<li id="category-${cate1.category_key}" class="">
					                    		<span class="cate1 dynatree-node dynatree-folder dynatree-has-children dynatree-exp-c dynatree-ico-cf">
						                    		<span class="dynatree-expander cate1_expander"></span>
						                    		<span class="dynatree-contents" data-upcate="0" data-nowcate="${cate1.category_key}" data-cate1="${cate1.category_key}">
						                    			<input type="hidden" name="cate1_text" value="${cate1.category_name}"/>
						                    			<a href="#">${cate1.category_name}</a>
					                    			</span>
				                    			</span>
				                    			<ul style="display: none;" class="cate2">
			                    				<c:forEach var="cate2" items="${cate1.category_list}">
				                    				<li id="category-${cate2.category_key}" class="dynatree-lastsib">
				                    					<span class="cate2 dynatree-node dynatree-folder dynatree-has-children dynatree-lastsib dynatree-exp-cl dynatree-ico-cf">
				                    						<span class="dynatree-expander cate2_expander"></span>
				                    						<span class="dynatree-contents" data-upcate="${cate1.category_key}" data-nowcate="${cate2.category_key}" data-cate1="${cate1.category_key}" data-cate2="${cate2.category_key}">
				                    							<input type="hidden" name="cate2_text" value="${cate1.category_name} >  ${cate2.category_name}"/>
				                    							<a href="#none">${cate2.category_name}</a>
			                    							</span>
		                    							</span>
		                    							<ul style="display: none;" class="cate3">
		                    							<c:forEach var="cate3" items="${cate2.category_list}">
						                    				<li id="category-${cate3.category_key}" class="dynatree-lastsib">
						                    					<span class="cate3 dynatree-node dynatree-folder dynatree-has-children dynatree-lastsib dynatree-exp-cl dynatree-ico-cf">
						                    						<span class="dynatree-connector" ></span>
						                    						<span class="dynatree-contents" data-upcate="${cate2.category_key}" data-nowcate="${cate3.category_key}" data-cate1="${cate1.category_key}" data-cate2="${cate2.category_key}" data-cate3="${cate3.category_key}">
						                    							<input type="hidden" name="cate3_text" value="${cate1.category_name} >  ${cate2.category_name} >  ${cate3.category_name}"></input>
						                    							<a href="#none">${cate3.category_name}</a>
					                    							</span>
				                    							</span>
			                    							</li>
					                    				</c:forEach>
					                    				</ul>
	                    							</li>
			                    				</c:forEach>
	                   							</ul>
			                    			</li>
		                    			</c:if>
		                    		</c:forEach>
                   				</ul>
           					</div>
		                    <div class="mCtrl typeFooter">
		                        <div class="gLeft">
		                            <a href="#" onclick="addCategory();" class="btnNormal eAddLargeCategoryBtn">
		                                <span>분류추가</span>
		                            </a>
		                        </div>
		                    </div>
		                    <div class="ctrlHeight ui-draggable" id="eContorlHeightCategoryExplorerBtn">
		                        <span>상품분류 설정 높이 영역 조절</span>
		                    </div>
                		</form>
		            </div>
		        </div>
		        <div class="gReverse">
		            <form name="CategoryInfoForm" action="/" method="post" id="eCategoryInfoForm">
			            <div class="mTitle">
			                <h2>분류정보</h2>
			            </div>
		                <div class="mBoard gSmall">
			                <table border="1" summary="">
			                    <caption>분류정보</caption>
			                    <tbody>
				                    <tr>
				                        <th scope="row">현재분류</th>
				                        <td>
				                            <span id="eCurrentCategoryDisplay"></span>
				                        </td>
				                    </tr>
				                    <tr>
				                        <th scope="row">현재분류번호</th>
				                        <td>
				                            <span id="eCurrentCategoryKeyDisplay"></span>
				                        </td>
				                    </tr>
			                        <tr>
			                            <th scope="row">분류명
			                                <strong class="icoRequired">필수</strong>
	                                    </th>
			                            <td>
			                                <div class="gIcoShop">
			                                    <input type="text" id="eCategoryTitle" required="required" placeholder="예시) 티셔츠" name="category_name" class="fText" style="width:200px;"/>
			                                </div>
			                            </td>
			                        </tr>
								</tbody>
		                    </table>
		                </div>
		                <div id="section" id="QA_setting3">
			    			<div class="mTitle">
						        <h2>분류 위치 설정</h2>
						    </div>
						    <div class="mBoard gSmall" >
						    	<table border="1" summary="" class="gDivision">
							        <colgroup>
							            <col class="product"/>
							            <col style="width:auto"/>
							        </colgroup>
							        <tbody>
										<tr>
					                		<th scope="row">상품분류 선택</th>
				              				<td>
				              					<input type="hidden" name="crud_category_key" value=""/>
					               				<div class="mSearchSelect typeCategory theme1" id="selectCategoryTable">
					                       			<div class="state">
						                                <strong class="txtEm" id="eSelectedCategory">대분류 &gt;</strong>
						                                <span> 태그 아래에 존재합니다.</span>
					                            	</div>
						                            <table border="1" summary="">
							                            <caption>분류</caption>
							                            <colgroup>
							                                <col style="width:auto" span="3"/>
							                            </colgroup>
							                            <tbody id="eCategoryTbody">
							                                <tr>
							                                	<td class="td_cate_depth">
							                                        <div class="list">
							                                            <ul class="eExposureCategory cate_depth">
								                                            <li class="li_cate selected">대분류<span class="right"> &gt;</span></li>
							                                            </ul>
						                                            </div>
							                                    </td>
							                                    <td class="td_cate_depth1">
							                                        <div class="list">
							                                            <ul class="eExposureCategory cate_depth1">
							                                            <c:forEach var="cate1" items="${applicationScope.category_list}">
							                                            	<c:if test="${cate1.category_name eq '미분류'}">
									                                            <li id="disablebtn" class="li_cate1" style="pointer-events: none; opacity: 0.5;" data-key="${cate1.category_key}">${cate1.category_name}<span class="right"> &gt;</span></li>
							                                            	</c:if>
							                                            	<c:if test="${cate1.category_name ne '미분류' }">
									                                            <li class="li_cate1" data-key="${cate1.category_key}">${cate1.category_name}<span class="right"> &gt;</span></li>
							                                            	</c:if>
						                                            	</c:forEach>
							                                            </ul>
						                                            </div>
							                                    </td>
						                                    	<td class="td_cate_depth2 displaynone">
								                                    <div class="list">
							                                            <ul class="eExposureCategory cate_depth2">
							                                            </ul>
							                                        </div>
							                                    </td>
						                                    	<td class="td_cate_depth3 displaynone">
								                                    <div class="list">
							                                            <ul class="eExposureCategory cate_depth3">
							                                            </ul>
							                                        </div>
							                                    </td>
							                                </tr>
							                            </tbody>
						                            </table>
					                        	</div>
			                				</td>
					            		</tr>
					        		</tbody>
					        	</table>
						    </div>
			    		</div>
           			</form>
                    <div class="mButton gCenter">
		                <a href="#" onclick="saveCategory();" class="btnSubmit" id="eSubmitBtn">
		                    <span>확인</span>
		                </a>
		                <a href="#" onclick="deleteCategory();" class="btnEm btnPreview" id="eProductPreview">
		                	<span>삭제</span>
	                	</a>
		            </div>
           		</div>
    		</div>
		<!-- 여기까지 content -->
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script>
	let upcate;
	$(function(){
		$("span.dynatree-expander.cate1_expander").click(function(){
			if ($(this).closest('li').find('span.cate1').hasClass('dynatree-exp-c')){
				$(this).closest('li').find('ul.cate2').css('display', '');
				$(this).closest('li').find('span.cate1').addClass('dynatree-expanded');
				$(this).closest('li').find('span.cate1').removeClass('dynatree-exp-c');
				$(this).closest('li').find('span.cate1').addClass('dynatree-exp-e');
			} else {
				$(this).closest('li').find('ul.cate2').css('display', 'none');
				$(this).closest('li').find('span.cate1').removeClass('dynatree-expanded');
				$(this).closest('li').find('span.cate1').addClass('dynatree-exp-c');
				$(this).closest('li').find('span.cate1').removeClass('dynatree-exp-e');
			}
		})
		
		$("span.dynatree-expander.cate2_expander").click(function(){
			if ($(this).closest('li').find('span.cate2').hasClass('dynatree-exp-cl')){
				$(this).closest('li').find('ul.cate3').css('display', '');
				$(this).closest('li').find('span.cate2').addClass('dynatree-expanded');
				$(this).closest('li').find('span.cate2').removeClass('dynatree-exp-cl');
				$(this).closest('li').find('span.cate2').addClass('dynatree-exp-el');
			} else {
				$(this).closest('li').find('ul.cate3').css('display', 'none');
				$(this).closest('li').find('span.cate2').removeClass('dynatree-expanded');
				$(this).closest('li').find('span.cate2').addClass('dynatree-exp-cl');
				$(this).closest('li').find('span.cate2').removeClass('dynatree-exp-el');
			}
		})
		
		$("span.dynatree-contents").click(function(){
			$("ul.dynatree-container span").removeClass("dynatree-active");
			$(this).closest('li').find('span').first().addClass("dynatree-active");
			
			$("#eCurrentCategoryKeyDisplay").text($(this).data('nowcate'));
			$("#eCurrentCategoryDisplay").text($(this).find('input').val());
			$("#eCategoryTitle").val($(this).find("a").text());
			
			let cate1 = $(this).data('cate1');
			let cate2 = $(this).data('cate2');
			let cate3 = $(this).data('cate3');
			if (cate3 != null && cate3 != "0"){
				$('[data-key="' + cate1 + '"]').click();
				$('[data-key="' + cate2 + '"]').click();
			} else if (cate2 != null && cate2 != "0"){
				$('[data-key="' + cate1 + '"]').click();
			} else if (cate1 != null && cate1 != "0"){
				$('li.li_cate').click();
			}
		});
				
		let category_text1 = "";
		let category_text2 = "";
		let category_text3 = "";
		$("li.li_cate").click(function(){
			$("li.li_cate1").removeClass('selected');
			$("li.li_cate2").removeClass('selected');
			$("li.li_cate3").removeClass('selected');
			
			$("#eSelectedCategory").html("대분류 > ");
			category_text1 = "";
			category_text2 = "";
			category_text3 = "";
			
			$("td.td_cate_depth2").addClass('displaynone');
			$("td.td_cate_depth3").addClass('displaynone');
			
			upcate = 0;
		});
		
		$("li.li_cate1").click(function(){
			$("li.li_cate1").removeClass('selected');
			$("li.li_cate2").removeClass('selected');
			$("li.li_cate3").removeClass('selected');
			$(this).addClass('selected');
			
			$("#eSelectedCategory").html("대분류 > " + $(this).text());
			category_text1 = $("#eSelectedCategory").html();
			category_text2 = "";
			category_text3 = "";
			var category_key = $(this).data("key");
		    $.ajax({
		    	type: "post",
		    	url: "/shop/admin/product/crudProductIO.jsp",
		    	data: {
		    		"cate1":"yes",
		    		"category_key":category_key,
		    	}
		    }).done(function(data){
		        $("ul.cate_depth2").html(data);
		        $("td.td_cate_depth2").removeClass('displaynone');
		        $("td.td_cate_depth3").addClass('displaynone');
		    })
		    
			$("input[name=crud_category_key]").val(category_key);
		    
		    upcate = category_key;
		});
		
		$("ul.cate_depth2").on('click', 'li.li_cate2', function(){
			$("li.li_cate2").removeClass('selected');
			$("li.li_cate3").removeClass('selected');
			$(this).addClass('selected');
			
			category_text2 = category_text1 + $(this).text();
			$("#eSelectedCategory").html(category_text2);
			var category_key = $(this).data("key");
		    $.ajax({
		    	type: "post",
		    	url: "/shop/admin/product/crudProductIO.jsp",
		    	data: {
		    		"cate2":"yes",
		    		"category_key":category_key,
		    	}
		    }).done(function(data){
		        $("ul.cate_depth3").html(data);
		        $("td.td_cate_depth3").removeClass('displaynone');
		    })
		    
		    $("input[name=crud_category_key]").val(category_key);
		    upcate = category_key;
		});
	})
	
	// 저장
	function saveCategory(){
		if ($("#eCurrentCategoryDisplay").text() == null || $("#eCurrentCategoryDisplay").text() == ''){
			alert("추가 버튼을 눌러 분류를 추가하거나, 수정할 분류를 선택해 주세요.")
			return;
		}
		
		var tmp = $("#eCategoryTitle").val();
		var tmp_up = upcate;
		console.log(upcate);
		let mode = 0;
		if($("ul.dynatree-container span").hasClass("dynatree-active")){
			mode = 1;
		}
		
		let chk;
		if (mode == 0){
			chk = confirm("현재 분류 위치를 다시 한번 확인해주세요. 정말 추가하시겠습니까?");
		} else {
			chk = confirm("현재 분류 위치를 다시 한번 확인해주세요. 정말 수정하시겠습니까?");
		}
		
		if (!chk)
			return;
		
		$.ajax({
			type:"post",
			url: "/shop/admin/product/productCateIO.jsp",
			data:{
				"category_key": encodeURIComponent($("#eCurrentCategoryKeyDisplay").text()),
				"category_name": encodeURIComponent(tmp),
				"up_category_key": encodeURIComponent(tmp_up),
				"mode": encodeURIComponent(mode),
			},
		}).done(function(data){
			alert("저장되었습니다.");
			location.href = "Controller?type=adproductcate";
		}).fail(function(data){
			alert("오류가 발생하였습니다. 다시 시도해주세요.");
		});
	}
	
	// 카테고리 추가
	function addCategory(){
		$('li.li_cate').click();
		$("ul.dynatree-container span").removeClass("dynatree-active");
		
		$("#eCurrentCategoryDisplay").text("신규 분류");
		$("#eCurrentCategoryKeyDisplay").text("자동 생성");
		$("#eCategoryTitle").val("");
	}
	
	// 카테고리 삭제
	function deleteCategory(){
		if ($("#eCurrentCategoryDisplay").text() == null || $("#eCurrentCategoryDisplay").text() == ''){
			alert("신규 생성하는 분류는 삭제할 수 없습니다.");			
			return;
		}
		
		let chk = confirm("해당 분류 삭제 시 하위 상품들이 모두 미분류로 전환됩니다. 정말 삭제하시겠습니까?");
		if (!chk)
			return;
		
		$.ajax({
			type:"post",
			url: "/shop/admin/product/productCateIO.jsp",
			data:{
				"category_key": encodeURIComponent($("#eCurrentCategoryKeyDisplay").text()),
				"mode": encodeURIComponent(2),
			},
		}).done(function(data){
			alert("삭제되었습니다.");
			location.href = "Controller?type=adproductcate";
		}).fail(function(data){
			alert("오류가 발생하였습니다. 다시 시도해주세요.");
		});
	}
</script>
</body>
</html>
