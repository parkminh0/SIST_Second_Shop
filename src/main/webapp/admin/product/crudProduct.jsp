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
<link rel="stylesheet" type="text/css" href="/shop/admin/css/crudProduct.css" media="all" charset="utf-8" />
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
                                    <li class="selected">
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
       	<div class="headingArea">
	        <div class="mTitle">
	        	<c:if test="${requestScope.mode eq 'edit'}">
	        		<h1>상품 수정</h1>
	        		<input type="hidden" value="edit" name="editMode"/>
	        	</c:if>
	        	<c:if test="${requestScope.mode ne 'edit'}">
	            	<h1>상품 등록</h1>
	            	<input type="hidden" value="add" name="editMode"/>
	        	</c:if>
	        </div>
        </div>
        <form name="eProductRegisterForm" id="eProductRegisterForm">
        	<input type="hidden" name="prod_key" value="${requestScope.pvo.product_key}"/>
    		<div class="section" id="QA_register1">
			    <div class="mToggleBar eToggle selected" id="exposure">
			        <h2 class="eToggleTitle">표시 설정</h2>
				</div>
				<div class="toggleArea" style="display:block;">
				    <div class="mBoard typeProduct">
				        <table border="1" summary="" class="gDivision">
				        <caption>쇼핑몰 표시 설정</caption>
				        <colgroup>
				            <col class="product"/>
				            <col style="width:auto"/>
				        </colgroup>
					        <tbody>
					            <tr>
					                <th scope="row">판매상태</th>
					                <td>
						        		<c:if test="${requestScope.pvo.getDel() ne 1}">
						        			<label class="gLabel"><input type="radio" name="selling_status" class="fChk eMarketChecker" value="0"  checked="checked"/> 판매함</label>
				                    		<label class="gLabel"><input type="radio" name="selling_status" class="fChk" value="1"/> 판매안함</label>
					                	</c:if>
					                	<c:if test="${requestScope.pvo.getDel() eq 1}">
					                		<label class="gLabel"><input type="radio" name="selling_status" class="fChk eMarketChecker" value="0"  /> 판매함</label>
				                    		<label class="gLabel"><input type="radio" name="selling_status" class="fChk" value="1" checked="checked"/> 판매안함</label>
					                	</c:if>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">판매영역</th>
					                <td>
						                <ul class="mForm typeVer">
						                	<li>
                                           		<input type="checkbox" class="fChk" checked="checked" disabled="disabled"/> 일반상품 영역
                                           	</li>
						        		<c:if test="${requestScope.pvo.isnew ne 1}">
						        			<li>
                                            	<input type="checkbox" class="fChk" name="isnew" value="1" id="isnew"/> 신상품 영역
                                           	</li>
					                	</c:if>
					                	<c:if test="${requestScope.pvo.isnew eq 1}">
					                		<li>
                                            	<input type="checkbox" class="fChk" name="isnew" value="1" checked="checked" id="isnew"/> 신상품 영역
                                           	</li>
					                	</c:if>
					                	<c:if test="${requestScope.pvo.isrecommend ne 1}">
						        			<li>
                                           		<input type="checkbox" class="fChk" name="isrecommend" value="1" id="isrecommend"/> 추천상품 영역
                                           	</li>
					                	</c:if>
					                	<c:if test="${requestScope.pvo.isrecommend eq 1}">
					                		<li>
                                           		<input type="checkbox" class="fChk" name="isrecommend" checked="checked" value="1" id="isrecommend"/> 추천상품 영역
                                           	</li>
					                	</c:if>
                                    	</ul>
				                    </td>
					            </tr>
								<tr>
			                		<th scope="row">상품분류 선택</th>
		              				<td>
		              					<input type="hidden" name="crud_category_key" value="${requestScope.nowcate.category_key}"/>
			               				<div class="mSearchSelect typeCategory theme1" id="selectCategoryTable">
			                       			<div class="state">
				                                <strong class="txtEm" id="eSelectedCategory">
				                                	<c:if test="${requestScope.cate1 ne null}">
				                                	${requestScope.cate1.category_name} &gt;
				                                	</c:if>
				                                	<c:if test="${requestScope.cate2 ne null}">
				                                	${requestScope.cate2.category_name} &gt;
				                                	</c:if>
				                                	<c:if test="${requestScope.cate3 ne null}">
				                                	${requestScope.cate3.category_name}
				                                	</c:if>
			                                	</strong>
			                                	<c:if test="${requestScope.nowcate ne null}">
			                                		<span id="eUnSelectedCategory" style="display:none;">상품분류를 선택하세요</span>
			                                	</c:if>
			                                	<c:if test="${requestScope.nowcate eq null}">
			                                		<span id="eUnSelectedCategory">상품분류를 선택하세요</span>
			                                	</c:if>
			                            	</div>
				                            <table border="1" summary="">
					                            <caption>분류</caption>
					                            <colgroup>
					                                <col style="width:auto" span="3"/>
					                            </colgroup>
					                            <tbody id="eCategoryTbody">
					                                <tr>
					                                    <td class="td_cate_depth1">
					                                        <div class="list">
					                                            <ul class="eExposureCategory cate_depth1">
					                                            <c:forEach var="cate1" items="${applicationScope.category_list}">
					                                            	<c:if test="${cate1.category_key eq requestScope.cate1.category_key}">
							                                            <li class="li_cate1 selected" data-key="${cate1.category_key}">${cate1.category_name}<span class="right"> &gt;</span></li>
					                                            	</c:if>
																	<c:if test="${cate1.category_key ne requestScope.cate1.category_key}">
							                                            <li class="li_cate1" data-key="${cate1.category_key}">${cate1.category_name}<span class="right"> &gt;</span></li>
					                                            	</c:if>					                                            
				                                            	</c:forEach>
					                                            </ul>
				                                            </div>
					                                    </td>
					                                    <c:if test="${requestScope.cate2_list ne null}">
					                                    	<td class="td_cate_depth2">
							                                    <div class="list">
						                                            <ul class="eExposureCategory cate_depth2">
					                                            	<c:forEach var="cate2" items="${requestScope.cate2_list}">
						                                            	<c:if test="${cate2.category_key eq requestScope.cate2.category_key}">
								                                            <li class="li_cate1 selected" data-key="${cate2.category_key}">${cate2.category_name}<span class="right"> &gt;</span></li>
						                                            	</c:if>
																		<c:if test="${cate2.category_key ne requestScope.cate2.category_key}">
								                                            <li class="li_cate1" data-key="${cate2.category_key}">${cate2.category_name}<span class="right"> &gt;</span></li>
						                                            	</c:if>					                                            
				                                            		</c:forEach>
						                                            </ul>
						                                        </div>
						                                    </td>
					                                    </c:if>
					                                    <c:if test="${requestScope.cate2_list eq null}">
					                                    	<td class="td_cate_depth2 displaynone">
							                                    <div class="list">
						                                            <ul class="eExposureCategory cate_depth2">
						                                            </ul>
						                                        </div>
						                                    </td>
					                                    </c:if>
					                                    <c:if test="${requestScope.cate3_list ne null}">
					                                    	<td class="td_cate_depth3">
							                                    <div class="list">
						                                            <ul class="eExposureCategory cate_depth3">
					                                            	<c:forEach var="cate3" items="${requestScope.cate3_list}">
						                                            	<c:if test="${cate3.category_key eq requestScope.cate3.category_key}">
								                                            <li class="li_cate1 selected" data-key="${cate3.category_key}">${cate3.category_name}<span class="right"> &gt;</span></li>
						                                            	</c:if>
																		<c:if test="${cate3.category_key ne requestScope.cate3.category_key}">
								                                            <li class="li_cate1" data-key="${cate3.category_key}">${cate3.category_name}<span class="right"> &gt;</span></li>
						                                            	</c:if>					                                            
				                                            		</c:forEach>
						                                            </ul>
						                                        </div>
						                                    </td>
					                                    </c:if>
					                                    <c:if test="${requestScope.cate3_list eq null}">
					                                    	<td class="td_cate_depth3 displaynone">
							                                    <div class="list">
						                                            <ul class="eExposureCategory cate_depth3">
						                                            </ul>
						                                        </div>
						                                    </td>
					                                    </c:if>
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
			</div>
			<div class="section" id="QA_register2">
			    <div class="mToggleBar eToggle selected" id="basic">
			        <h2 class="eToggleTitle">기본 정보</h2>
			    </div>
				<div class="toggleArea" style="display:block;">
				    <div class="mBoard typeProduct">
				        <table border="1" summary="">
					        <caption>상품 기본 정보</caption>
					        <colgroup>
					            <col class="product">
					            <col style="width:auto">
					        </colgroup>
					        <tbody>
	                        	<tr>
                					<th scope="row">상품명
                						<strong class="icoRequired">필수</strong>                  
               						</th>
					                <td>
					                    <div class="gIcoShop">
					                        <div class="overlapTip">
					                            <input type="text" name="prod_name" id="prod_name" placeholder="예시) 플라워 미니 원피스" class="fText eMarketChecker eHasModifyProductAuth" style="width:730px;" value="${requestScope.pvo.prod_name}"/>
					                        </div>
					                    </div>
					                </td>
            					</tr>
	                        	<tr>
                					<th scope="row">상품이미지</th>
					                <td>
					                    <div class="gIcoShop">
					                        <div class="overlapTip">
					                            <input type="text" name="img_url" id="img_url" placeholder="/shop/img/product/ 이후의 이미지 경로를 작성해주세요." class="fText eMarketChecker eHasModifyProductAuth" style="width:730px;" 
					                            value="${f:substring(requestScope.pvo.img_url, 18, f:length(requestScope.pvo.img_url))}"/>
					                        </div>
					                    </div>
					                </td>
            					</tr>
					            <tr>
					                <th scope="row">상품 요약설명 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="prod_desc1" class="fText eMarketChecker" style="width:730px;" value="${requestScope.pvo.prod_desc1}"/>
					                    </div>
					                </td>
					            </tr>
		                        <tr class="Detail">
		                			<th scope="row">상품 상세설명</th>
                					<td>
					                    <div class="gIcoShop">
		                            		<textarea rows="10" cols="100" name="prod_desc2">${requestScope.pvo.prod_desc2}</textarea>
                    					</div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">제조사 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="factory" class="fText eMarketChecker" style="width:730px;" value="${requestScope.pvo.factory}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">소재 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="material" class="fText eMarketChecker" style="width:730px;" value="${requestScope.pvo.material}"/>
					                    </div>
					                </td>
					            </tr>
        					</tbody>
				        </table>
			        </div>
			    </div>
			</div>
			<div class="section" id="QA_register4">
			    <div class="mToggleBar eToggle selected" id="sales">
			        <h2 class="eToggleTitle">판매 정보</h2>
			    </div>
			    <div class="toggleArea" style="display:block;">
				    <div class="mBoard typeProduct">
				        <table border="1" summary="">
					        <caption>판매 정보</caption>
					        <colgroup>
					            <col class="product"/>
					            <col style="width:auto"/>
					        </colgroup>
					        <tbody>
								<tr>
								    <th scope="row">원가 <strong class="icoRequired">필수 </strong></th>
								    <td>
							            <input type="number" class="fText right eMarketChecker eHasModifyProductAuth" style="width:80px;" name="ori_price" id="ori_price" value="${requestScope.pvo.ori_price}" min="0"/> 
							            <span class="txtCode">KRW</span>
							        </td>
								</tr>
								<tr>
								    <th scope="row">판매가 <strong class="icoRequired">필수</strong></th>
								    <td>
							            <input type="number" class="fText right eMarketChecker eHasModifyProductAuth" style="width:80px;" name="cell_price" id="cell_price" value="${requestScope.pvo.cell_price}" min="0"/> 
							            <span class="txtCode">KRW</span>
						            </td>
								</tr>
	       					</tbody>
	       				</table>
				    </div>
			   	</div>
			</div>
			<div class="section eOptionArea" id="QA_register4">
			    <div class="mToggleBar eToggle selected" id="item">
			        <h2 class="eToggleTitle">옵션/재고 설정</h2>
			    </div>
			    <div class="toggleArea" style="display:block;">
			        <div class="mBoard typeProduct">
						<table border="1" summary="" class="gDivision " id="eManualOption" style="display: table;">
						    <caption>상품 옵션 입력</caption>
						    <colgroup>
						        <col class="product">
						        <col style="width:auto">
						    </colgroup>
						    <tbody>
						    	<tr>
							        <th scope="row">
							        	옵션입력
							        	<button type="button" onclick="addOption();" class="btnOption lv1Plus vaBottom">추가</button>
							        </th>
							        <td>
							            <div class="mBoard gCellSingle">
							                <table border="1" summary="">
							                    <caption>옵션</caption>
							                    <thead>
								                    <tr>
								                        <th scope="col">사이즈</th>
								                        <th scope="col">색상</th>
								                        <th scope="col">재고</th>
								                    </tr>
                    							</thead>
							                    <tbody id="eManualOptionTbody">
								                    	<c:forEach var="option" items="${requestScope.pvo.option_list}">
							                    		<tr class="eHeading heading" id="eManualOptionHeadTemplate">
									                        <td>
									                            <input value="${option.size}" id="option_size" type="text" name="option" placeholder="예시) XL" class="fText eManualOptionName" style="width:90%;"/>
									                        </td>
									                        <td class="eBubbleArea" id="eOptionBubbleArea">
									                            <input value="${option.color}" id="option_color" type="text" name="option" placeholder="예시) 검정색" class="fText eManualOptionName" style="width:90%;"/>
									                        </td>
									                        <td class="eBubbleArea" id="eOptionBubbleArea">
									                        	<div class="bubbleArea">
										                        	<div class="mBubble">
	               											         	<input value="${option.prod_stock}" id="option_stock" type="number" min="0" value="0" name="option" class="fText eManualOptionName"/>
						                        						<div class="button">
						                        							<button type="button" class="btnOption lv1Minus vaBottom">삭제</button> 
			                        									</div>
		                        									</div>
									                        	</div>
									                        </td>
									                    </tr>
							                    		</c:forEach>
							                    </tbody>
							                </table>
							            </div>
							        </td>
							    </tr>
						    </tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="mButton gCenter">
				<c:if test="${requestScope.mode eq 'edit'}">
	           		<a href="#" onclick="editProduct();" class="btnSubmit" id="eProductRegister"><span>상품수정</span></a>
	           		<a href="#" onclick="deleteProduct();" class="btnEm btnPreview" id="eProductRegister"><span>상품삭제</span></a>
				</c:if>
				<c:if test="${requestScope.mode ne 'edit'}">
	           		<a href="#" onclick="addProduct();" class="btnSubmit" id="eProductRegister"><span>상품등록</span></a>
				</c:if>
		    </div>
	    </form>
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
		});
		
		let category_text1 = "";
		let category_text2 = "";
		let category_text3 = "";
		$("li.li_cate1").click(function(){
			$("li.li_cate1").removeClass('selected');
			$("li.li_cate2").removeClass('selected');
			$("li.li_cate3").removeClass('selected');
			$(this).addClass('selected');
			
			$("#eSelectedCategory").html($(this).text());
			category_text1 = $("#eSelectedCategory").html();
			category_text2 = "";
			category_text3 = "";
			$("#eUnSelectedCategory").css('display', 'none');
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
		});
		
		$("ul.cate_depth3").on('click', 'li.li_cate3', function(){
			category_text3 = category_text2 + $(this).text();
			var category_key = $(this).data("key");
			
			$("#eSelectedCategory").html(category_text3);
			$("li.li_cate3").removeClass('selected');
			$(this).addClass('selected');
			
			$("input[name=crud_category_key]").val(category_key);
		});
		
		$("tbody#eManualOptionTbody").on("click", "button.lv1Minus", function(){
			$(this).closest('tr').remove();
		});
	})
	
	let stock = 0;
	function addProduct(){
		var frm = $("form").serialize();
		var tr = $("#eManualOptionTbody > tr");
		
		for (i = 0; i < tr.length; i++){
			var tmp = $(tr[i]).find('#option_stock').val();

			stock += parseInt(tmp);
		}
		$.ajax({
			type : 'post',
			url : '/shop/admin/product/crudProductIO.jsp?mode=add&stock='+stock,
			data : frm,
		}).done(function(data){
			$("#eManualOptionTbody").append(data);
			addOptions($("#eManualOptionTbody").find("#crud_prod_key").val(), 0);
		}).fail(function(data){
			alert("추가 중 오류가 발생했습니다. 다시 시도해주세요.");
		}); 
	}
	
	function addOptions(product_key, mode){
		var tr = $("#eManualOptionTbody > tr");
		if(tr.length < 1){
			if(mode == 0){
				alert("추가가 완료되었습니다.");				
				location.href = "Controller?type=adproduct";
			} else if (mode == 1){
				alert("수정이 완료되었습니다.");	
			}
			return;
		}
		
		for (i = 0; i < tr.length; i++){
			$.ajax({
				type : 'post',
				url : '/shop/admin/product/optionIO.jsp',
				data: {
					"product_key": encodeURIComponent(product_key),
					"size": encodeURIComponent($(tr[i]).find('#option_size').val()),
					"color": encodeURIComponent($(tr[i]).find('#option_color').val()),
					"prod_stock": encodeURIComponent($(tr[i]).find('#option_stock').val()),
				},
			}).done(function(data){
			});
		}
		
		if(mode == 0){
			alert("추가가 완료되었습니다.");				
			location.href = "Controller?type=adproduct";
		} else if (mode == 1){
			alert("수정이 완료되었습니다.");	
		}
	}
	
	function editProduct(){
		var frm = $("form").serialize();
		var tr = $("#eManualOptionTbody > tr");
		
		for (i = 0; i < tr.length; i++){
			var tmp = $(tr[i]).find('#option_stock').val();
			stock += parseInt(tmp);
		}
		$.ajax({
			type : 'post',
			url : '/shop/admin/product/crudProductIO.jsp?mode=edit&stock='+stock,
			data : frm,
		}).done(function(data){
			addOptions($("input[name=prod_key]").val(), 1);
		}).fail(function(data){
			alert("수정 중 오류가 발생했습니다. 다시 시도해주세요.");
		});
	}
	
	function deleteProduct(){
		let chkDel = confirm("해당 상품을 완전 삭제하시겠습니까?");
	    if (!chkDel)
	    	return;

		var frm = $("form").serialize();
	    $.ajax({
			type : 'post',
			url : '/shop/admin/product/crudProductIO.jsp?mode=delete',
			data : frm,
		}).done(function(data){
			alert("삭제가 완료었습니다.");
			location.href = "Controller?type=adproduct";
		}).fail(function(data){
			alert("삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
		});
	}
	
	function addOption(){
		let tmp = `
					<tr class="eHeading heading" id="eManualOptionHeadTemplate">
		            <td>
		                <input id="option_size" type="text" name="size" placeholder="예시) XL" class="fText eManualOptionName" style="width:90%;"/>
		            </td>
		            <td class="eBubbleArea" id="eOptionBubbleArea">
		                <input id="option_color" type="text" name="color" placeholder="예시) 검정색" class="fText eManualOptionName" style="width:90%;"/>
		            </td>
		            <td class="eBubbleArea" id="eOptionBubbleArea">
		            	<div class="bubbleArea">
		                	<div class="mBubble">
						         	<input id="option_stock" type="number" min="0" value="0" name="color" class="fText eManualOptionName"/>
								<div class="button">
									<button type="button" class="btnOption lv1Minus vaBottom">삭제</button> 
								</div>
							</div>
		            	</div>
		            </td>
		        </tr>`;
		$("tbody#eManualOptionTbody").append(tmp);
	}
</script>
</body>
</html>