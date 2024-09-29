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
<link rel="stylesheet" type="text/css" href="/shop/admin/css/product.css" media="all" charset="utf-8" />
<style>
.logo{
	margin : 20% 0%;
}
</style>
</head>
<body>
<c:set var="pcvo" value="${requestScope.pcvo}"/>
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
                                	<li class="selected ">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=adproduct" class="link ">
				                            <span class="ellips">상품목록</span>
				                        </a>
                    				</li>
                                    <li class="">
				                        <a id="QA_Lnb_Menu2031" href="Controller?type=adproductcrud" class="link">
				                            <span class="ellips">상품등록 | 수정</span>
				                        </a>
                    				</li>
                                    <li class="">
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
			<div class="MuiStack-root css-tfkmr0">
				<div class="MuiGrid-root MuiGrid-container css-v3z1wi">
					<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-md-6 css-196gsvj">
						<div class="MuiStack-root css-1x4jos1">
							<div class="MuiStack-root css-lmzl00">
								<span class="MuiTypography-root MuiTypography-base.h5B css-avyusg">상품 목록</span>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 1 START -->
			<div class="MuiGrid-root MuiGrid-container MuiGrid-spacing-xs-16 css-isbt42">
				<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 css-he9kdn">
					<div class="MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation1 MuiCard-root css-w0qttw">
						<div class="MuiCardHeader-root css-1cg1x61">
							<div class="MuiCardHeader-content css-11qjisw">
								<span class="MuiTypography-root MuiTypography-h5 MuiCardHeader-title css-ol1ja4">
									<div class="MuiStack-root css-zl49q4">
										<span class="MuiTypography-root MuiTypography-base.subTitle1B css-1iqlcnz">상품 현황</span>
									</div>
								</span>
							</div>
						</div>
						<div class="MuiCardContent-root css-1apxsmm">
							<div class="MuiGrid-root MuiGrid-container css-ci1ms7">
								<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-true css-r3xjrv">
									<div class="MuiStack-root css-1itc13n">
										<div class="MuiStack-root css-1bew4d0">
											<span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-1y2y1ny">전체 등록 상품</span>
										</div>
										<div class="MuiStack-root css-1h3carr">
											<a class="MuiTypography-root MuiTypography-custom.h6BH MuiLink-root MuiLink-underlineAlways css-sdodfs">${pcvo.cntAll}</a>
											<span class="MuiTypography-root MuiTypography-custom.body1H css-grko2a">개</span>
										</div>
									</div>
								</div>
								<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-true css-r3xjrv">
									<div class="MuiStack-root css-1ima9n7">
										<div class="MuiStack-root css-1bew4d0">
											<span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-1y2y1ny">판매 중인 상품</span>
										</div>
										<div class="MuiStack-root css-1h3carr">
											<a class="MuiTypography-root MuiTypography-custom.h6BH MuiLink-root MuiLink-underlineAlways css-sdodfs">${pcvo.cntCelling}</a>
											<span class="MuiTypography-root MuiTypography-custom.body1H css-grko2a">개</span>
										</div>
									</div>
								</div>
								<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-true css-r3xjrv">
									<div class="MuiStack-root css-1ima9n7">
										<div class="MuiStack-root css-1bew4d0">
											<span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-1y2y1ny">품절 상품</span>
										</div>
										<div class="MuiStack-root css-1h3carr">
											<a class="MuiTypography-root MuiTypography-custom.h6BH MuiLink-root MuiLink-underlineAlways css-13xs5pa">${pcvo.cntNostock}</a>
											<span class="MuiTypography-root MuiTypography-custom.body1H css-grko2a">개</span>
										</div>
									</div>
								</div>
								<div class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-true css-r3xjrv">
									<div class="MuiStack-root css-1ima9n7">
										<div class="MuiStack-root css-1bew4d0">
											<span class="MuiTypography-root MuiTypography-custom.subTitle3MH css-1y2y1ny">판매 안하는 상품</span>
										</div>
										<div class="MuiStack-root css-1h3carr">
											<a class="MuiTypography-root MuiTypography-custom.h6BH MuiLink-root MuiLink-underlineAlways css-13xs5pa">${pcvo.cntNocelling}</a>
											<span class="MuiTypography-root MuiTypography-custom.body1H css-grko2a">개</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 1 END -->
			<!-- 2 START -->
			<form id="frmSearch">
				<div class="optionArea" id="QA_list1" style="margin-top: 30px;">
					<div class="mOption" id="submitSearchBox">
					    <table border="1" summary="">
						    <caption>상품 검색</caption>
						    <colgroup>
						        <col style="width:154px;"/>
						        <col style="width:auto;"/>
						        <col style="width:154px;"/>
						        <col style="width:auto;"/>
						    </colgroup>
						    <tbody>
						        <tr>
						            <th scope="row">검색분류</th>
						            <td colspan="3">
	                            	<ul class="mForm typeVer" id="eSearchFormGeneral">
	                                	<li>
	                        				<select class="fSelect eSearch" name="search1">
		                                        <option value="prod_name">상품명</option>
		                                        <option value="product_key">상품번호</option>
		                                        <option value="factory">제조사</option>
		                                    </select>
	                        				<input id="search1_text" type="text" class="fText eSearchText" style="width:500px;" value="" name="search1_text"/>
										</li>
	                                </ul>
						           	</td>
						       	</tr>
				                <tr>
						            <th scope="row">상품분류</th>
						            <td colspan="3">
		                            	<div class="gSingle">
						                    <select class="fSelect category eCategory" id="eCategory1" name="search2_1"> 
						                    	<option value="">- 대분류 전체 -</option>
						                    	<c:forEach var="category" items="${applicationScope.category_list}">
						                    		<option value="${category.category_key}">${category.category_name}</option>
						                    	</c:forEach>
					                    	</select> 
					                    	<select class="fSelect category eCategory" id="eCategory2" name="search2_2"> 
					                    		<option value="">- 중분류 전체 -</option> 
				                    		</select> 
					                    	<select class="fSelect category eCategory" id="eCategory3" name="search2_3"> 
					                    		<option value="">- 소분류 전체 -</option> 
				                    		</select> 
						                </div>
						            </td>
						        </tr>
						        <tr>
						            <th scope="row">상품등록일</th>
						            <td colspan="3">
										<input type="date" id="pr_start_date" name="start_date" class="fText gDate" value="" style="width:100px;"/>  
										<span class="ec-mode-common-period-area">~</span>
										<input type="date" id="pr_end_date" name="end_date" class="fText gDate" value="" style="width:100px;"/>
						            </td>
						        </tr>
		                		<tr>
						            <th scope="row">판매상태</th>
						            <td colspan="3">
						                <label class="gSingleLabel"><input type="radio" class="fChk eDisplayStatus" name="selling" value="2" checked="checked"/> 전체</label>
						                <label class="gSingleLabel"><input type="radio" class="fChk eDisplayStatus" name="selling" value="0"/> 판매함</label>
						                <label class="gSingleLabel"><input type="radio" class="fChk eDisplayStatus" name="selling" value="1"/> 판매안함</label>
						            </td>
						        </tr>
							    <tr>
						            <th scope="row">재고수량</th>
						            <td colspan="3">
						                <ul class="mForm typeVer" id="eSearchFormStock">
		                                	<li>
						                        <input type="text" class="fText right eSearchText" style="width:60px;" value="" name="stock_min"/> 개 ~
						                        <input type="text" class="fText right eSearchText" style="width:60px;" value="" name="stock_max"/> 개
						                    </li>
		                                </ul>
						            </td>
						        </tr>
				                <tr>
						            <th scope="row">품절상태</th>
						            <td colspan="3">
		                                <label class="gLabel"><input type="radio" class="fChk" name="soldout_status" value="2" checked="checked"/> 전체</label>
		                                <label class="gLabel"><input type="radio" class="fChk" name="soldout_status" value="1"/> 품절</label>
		                                <label class="gLabel"><input type="radio" class="fChk" name="soldout_status" value="0"/> 품절아님</label>
		                            </td>
						        </tr>
						        <tr>
						            <th scope="row">상품가격</th>
						            <td colspan="3">
						                <ul class="mForm typeVer" id="eSearchFormPrice">
						                    <li>
						                        <select class="fSelect" name="price">
						                            <option value="product">판매가</option>
						                            <option value="buy">원가</option>
						                        </select>
						                        <input type="text" class="fText right eSearchText" style="width:60px;" value="" name="price_min"/> <span class="txtCode">KRW</span> ~
						                        <input type="text" class="fText right eSearchText" style="width:60px;" value="" name="price_max"/> <span class="txtCode">KRW</span>
						                    </li>
					                    </ul>
						            </td>
						        </tr>
					       </tbody>
					    </table>
					</div>
					<div class="mButton gCenter">
					    <a href="#" onclick="searchProduct(0)" class="btnSearch" id="eBtnSearch"><span>검색</span></a>
					    <a href="#" onclick="clearAll()" class="btnSearch reset" id="eSearchFormInit"><span>초기화</span></a>
					</div>
					<input type="hidden" name="page"/>
				</div>
			</form>
		<!-- 2 END -->
		<!-- 3 START -->
		<div class="section" id="QA_list2">
		    <div class="mTitle">
		        <h2>상품 목록</h2>
		    </div>
		    <div class="mState">
		        <div class="gLeft">
		            <p class="total">[총 <strong>0</strong>개]</p>
		        </div>
		    </div>
		    <div class="mCtrl typeHeader setting">
		        <div class="gTop">
                    <a href="#" onclick="delete_choice(0)" class="btnNormal _manage_state"><span>판매함</span></a>
	           		<a href="#" onclick="delete_choice(1)" class="btnNormal _manage_state"><span>판매안함</span></a>
	                <a href="#" onclick="delete_choice(2)" class="btnNormal _manage_delete"><span><em class="icoDel"></em> 삭제</span></a>
	                <a href="#" class="btnNormal _manage_category"><span>분류수정<em class="icoLink"></em></span></a>
                    <a href="#" class="btnNormal _manage_main_display"><span>메인진열수정<em class="icoLink"></em></span></a>
		        </div>
		    </div>
		    <div id="searchResult">
			    <div class="mBoard typeList gScroll gCell">
			        <table border="1" summary="" class="eChkColor">
			        	<caption>상품 목록</caption>
				        <colgroup>
							     <col class="chk"/>
						         <col style="width:50px"/>
						         <col style="width:250px"/>
						         <col style="width:100px"/>
						         <col style="width:100px"/>
						         <col style="width:100px"/>
						         <col style="width:100px"/>
						         <col style="width:100px"/>
						         <col style="date"/>
						         <col style="width:50px"/>
					   		</colgroup>
						 <thead id="product-list-header">
						     <tr>
						         <th scope="col"><input type="checkbox" id="allChk" class="allChk"/></th>
						         <th scope="col">No</th>
						         <th scope="col">상품명</th>
					             <th scope="col">원가</th>
					             <th scope="col">판매가</th>
					             <th scope="col">분류</th>
					             <th scope="col">제조사</th>
					             <th scope="col">재고</th>
					             <th scope="col">상품등록일</th>            
					             <th scope="col">조회수</th>            
					     	</tr>
						 </thead>
		                <tbody class="center" id="product-list">
		                	
					    </tbody>
					</table>
					<p class="empty" style="display:block;">검색된 상품 내역이 없습니다.</p>
				</div>
				<div class="mCtrl typeFooter">
					<div class="gTop">
		            	<a href="#none" onclick="delete_choice(0)" class="btnNormal _manage_state"><span>판매함</span></a>
		           		<a href="#none" onclick="delete_choice(1)" class="btnNormal _manage_state"><span>판매안함</span></a>
		                <a href="#none" onclick="delete_choice(2)" class="btnNormal _manage_delete"><span><em class="icoDel"></em> 삭제</span></a>
		                <a href="#none" target="_blank" title="새창 열림" class="btnNormal _manage_category"><span>분류수정<em class="icoLink"></em></span></a>
		                <a href="#none" target="_blank" title="새창 열림" class="btnNormal _manage_main_display"><span>메인진열수정<em class="icoLink"></em></span></a>
		       		</div>
			        <div class="gBottom">
			            <a href="Controller?type=adproductcrud" class="btnCtrl eRegProduct"><span>상품등록</span></a>
			        </div>
				</div>
		    	<div class="mPaginate">
			        <ol>
			            <li><strong title="현재페이지">1</strong></li>
			        </ol>
			    </div>    
		    </div>
	    </div>
		<!-- 3 END -->
		<!-- 여기까지 content -->
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script>
	// 사이드바 하위요소 보여주기
	$(function(){
		$(".depth2 > li.hasChild").click(function(){
			if ($(this).hasClass('show')){
				$(this).removeClass('show');
			} else {
				$(".depth2 > li.hasChild").removeClass('show');
				$(this).addClass('show');
			}
		})
		
		$("#eCategory1").change(function(){
		    var option_key = $(this).val();
		    $.ajax({
		    	type: "post",
		    	url: "/shop/admin/product/searchProduct.jsp",
		    	data: {
		    		"cate1":"yes",
		    		"category_key":option_key,
		    	}
		    }).done(function(data){
		        $("#eCategory2").html(data);
		    })
		});
		
		$("#eCategory2").change(function(){
		    var option_key = $(this).val();
		    $.ajax({
		    	type: "post",
		    	url: "/shop/admin/product/searchProduct.jsp",
		    	data: {
		    		"cate2":"yes",
		    		"category_key":option_key,
		    	}
		    }).done(function(data){
		        $("#eCategory3").html(data);
		    })
		});
		
		$("a.btnDate").click(function(){
			$("a.btnDate").removeClass('selected');
			$(this).addClass('selected');
		});
		
		// 전체 체크박스 체크
	    $("#searchResult").on('click', '#allChk', function() {
	        let p = $(this).closest("th");
	        let idx = $("table.eChkColor thead tr th").index(p);
	        let ar = $("table.eChkColor tbody td:nth-child(" + (idx + 1) + ") input:checkbox");
	        ar.prop("checked", this.checked);
	    });

	    // 밑에 있는 체크박스가 모두 선택되면 전체 체크박스 체크
	    $("#searchResult").on('click', 'tbody input:checkbox', function() {
	        let ar = $("tbody").find(":checkbox");
			
	        let chk = true;
	        for (let i = 0; i < ar.length; i++) {
	            if (!ar.eq(i).is(":checked")) {
	                chk = false;
	                break;
	            }
	        }
	        $("#allChk").prop("checked", chk);
	    });
	})
	
	// 검색 조건 폼 초기화
	function clearAll(){
		$('form')[0].reset();
	}
	
	// 검색
	function searchProduct(cPage){
		var frm = $("form").serialize();

		$.ajax({
			type : 'post',
			url : '/shop/admin/product/searchProduct.jsp?cPage='+cPage,
			data : frm,
		}).done(function(data){
			$("#searchResult").html(data);
			$("p.total strong").text($("input[name=prod_cnt]").val());
		});
	}
	
	// 체크한 상품을 삭제하기 
	function delete_choice(mode) {
	    let chk_box = $("tbody input:checkbox:checked");  // 체크된 체크박스들 찾기
	    let product_list = [];

	    if (chk_box.length == 0)
	    	return;
	    
	    let chkDel;
	    if (mode == '0'){
	    	chkDel = confirm("선택한 상품을 판매 상태로 전환하시겠습니까?");
		    if (!chkDel)
		    	return;
	    } else if (mode == '1') {
	    	chkDel = confirm("선택한 상품을 판매안함 상태로 전환하시겠습니까?");
	    } else {
	    	chkDel = confirm("선택한 상품을 완전 삭제하시겠습니까?");
	    }
	    
	    if (!chkDel)
	    	return;
	    
	    chk_box.each(function() {
	        let product = $(this).closest("tr").find(".product_key").val();  // 체크된 체크박스의 부모 tr에서 product_key 값 찾기
	        product_list.push(product);
	    });
	
	    product_list.forEach(function(product) {
	        $.ajax({
	            url: "/shop/admin/product/productIO.jsp",  
	            type: "post",
	            data: { 
	            	"product_key": product,
	            	"mode": mode,
                },
	        }).done(function (data) {
	        });
	    });
	    
	    if (mode == '0'){
	    	alert("판매 상태로 전환되었습니다.");
	    } else if (mode == '1') {
	    	alert("판매안함 상태로 전환되었습니다.");	    
    	} else {
    		alert("삭제가 완료되었습니다.");	    
   		}
    	
	    searchProduct(0);
	}
</script>
</body>
</html>
