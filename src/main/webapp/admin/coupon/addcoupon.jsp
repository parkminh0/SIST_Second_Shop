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
<link rel="stylesheet" type="text/css" href="/shop/admin/css/addcoupon.css" media="all" charset="utf-8" />
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
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu6" href="Controller?type=aduser" class="link member" name="고객">고객</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu7" href="Controller?type=adbbs" class="link board" name="게시판">게시판</a>
		            			</li>
		                        <li class="hasChild show">
		                			<a id="QA_Lnb_Menu1250" href="Controller?type=adcoupon" class="link promotion" name="프로모션">쿠폰</a>
		            			</li>
		                       	<li class="hasChild ">
		                			<a id="QA_Lnb_Menu2060" href="Controller?type=adstatistic" class="link calculate" name="통계">통계</a>
		            			</li>
						</div>
					</div>
				</div>
				<div class="subMenu eClone eCustomScrollbar mCustomScrollbar _mCS_3 mCS-autoHide mCS_no_scrollbar">
					<div id="mCSB_3" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 1016px;">
						<div id="mCSB_3_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
            				<div class="depthList">
                				<ul class="depth2">
                                	<li class="">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=adcoupon" class="link ">
				                            <span class="ellips">쿠폰 조회</span>
				                        </a>
                    				</li>                                                                     
                                	<li class="selected">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=adaddcoupon" class="link ">
				                            <span class="ellips">쿠폰 발급 | 수정</span>
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
        <div id="content">
            
            <div class="gHeading">
                <div class="mTitle">
                	<c:if test="${param.mode ne  null}">
	                    <h1>쿠폰 수정</h1>
                	</c:if>
           	        <c:if test="${param.mode eq  null}">
	                    <h1>쿠폰 발급</h1>
                	</c:if>
                </div>
            </div>
            <form name="coupon_create_form" class="coupon_create_form" id="coupon_create_form" enctype="multipart/form-data" action="/exec/admin/shop1/Newcoupon/Create" method="post" novalidate="novalidate">
                <div class="section">
                    <div class="mTitle">
                        <h2>발급 정보</h2>
                    </div>
                    <p class="mRequired"><strong class="icoRequired">필수</strong> 필수 입력사항</p>
                    <div class="mBoard type2 gMedium"><table border="1" summary=""><caption>발급 정보</caption>
                            
                            <tbody class="tBodyDefault">
                            <tr>
                                <th scope="row">쿠폰이름 <strong class="icoRequired">필수</strong></th>
                                <td>
                                    <input type="text" class="fText" name="coupon_name"  style="width:auto;"   value="${requestScope.cvo.c_name}"/>
                                 </td>
                            </tr>
                            
						        <tr benefit-type="tr_F">
						            <th scope="row" value="${requestScope.cvo.issue_sort}">혜택구분<strong class="icoRequired">필수</strong></th>
						            <td>
						                <div>
									        <select name="fbenefit_parent_type"  >
									            <option value="">선택하세요</option>
									            <c:if test="${requestScope.cvo.d_type eq '원' }">
										            <option value="원" selected>할인금액</option>
										            <option value="%">할인율</option>
									            </c:if>
									            <c:if test="${requestScope.cvo.d_type eq '%' }">
										            <option value="원" >할인금액</option>
										            <option value="%" selected>할인율</option>
									            </c:if>
									            <c:if test="${requestScope.cvo.d_type eq null }">
										            <option value="원" >할인금액</option>
										            <option value="%">할인율</option>
									            </c:if>									            
									        </select>
									        <span id="benefit_price">
										        <span id="d_price_won"  style="display:'';">
										        	<input type="text" class="fText right won"   name="d_price"  value= "${requestScope.cvo.d_price}"  style="width:50px; "/> 원
										        </span>
										        <span id="d_price_per" style="display:'';">
										        	<input type="text" class="fText right percent" name="d_price" value= "${requestScope.cvo.d_price}"  style="width:50px;"/> %
										        </span>
										        <span id="d_price_won"  style="display:none;">
										        	<input type="text" class="fText right won"   name="d_price"  value= "${requestScope.cvo.d_price}"  style="width:50px; "/> 원
										        </span>
										        <span id="d_price_per" style="display:none;">
										        	<input type="text" class="fText right percent" name="d_price" value= "${requestScope.cvo.d_price}"  style="width:50px;"/> %
										        </span>
									        </span>
									    </div>
						            </td>
						        </tr>
												    
                   <tr>
					    <th scope="row">발급구분<strong class="icoRequired">필수</strong></th>
					    <td id="fissue_type_td">
					    	<c:if test="${requestScope.mode eq 'edit' }">
					    	<select name="fissue_type" onchange="this.selectedIndex = this.initialSelect;">
					            <option value="선택하세요">선택하세요</option>
					            <option value="1" ${requestScope.cvo.issue_sort eq '1' ? 'selected' : ''}>일괄 지급</option>
					            <option value="2" ${requestScope.cvo.issue_sort eq '2' ? 'selected' : ''}>조건부 지급</option>
					        </select>
					    	</c:if>
					    	<c:if test="${requestScope.mode ne 'edit' }">
				    		<select name="fissue_type">
					            <option value="선택하세요">선택하세요</option>
					            <option value="1" ${requestScope.cvo.issue_sort eq '1' ? 'selected' : ''}>일괄 지급</option>
					            <option value="2" ${requestScope.cvo.issue_sort eq '2' ? 'selected' : ''}>조건부 지급</option>
					        </select>
					    	</c:if>					    	
					        
					    </td>
					</tr>

                            
                            </tbody>
                        </table> 
                    </div>

                </div>
              <div class="section detailSection">
                    <div class="mTitle">
                        <h2>사용 정보</h2>
                    </div>
                    <div class="mBoard type2 gMedium">
                        <table border="1" summary="">
                            <caption>사용 정보</caption>
                            <tbody class="tBodyDetail">
                            <tr issue-type="tr_MM_MC_AJ_AD_AA_AI_AP_AO_AF_AQ_AU_DM_DC_DN_DJ_DD_DA_DI_DP_DO_R" benefit-type="tr_F" style="display: table-row;">
                                <th scope="row">사용 기간<strong class="icoRequired">필수</strong></th>
                               <td>
                                    <span name="favailable_period_type">
									    <span class="gForm sp_available_period_from" style="display: inline;"">
									        시작일 :
									        <input type="date" id="startDate" name="startDate" class="fText right" style="width:auto;"
									        value= "${requestScope.cvo.issue_at}" >
									       
									    </span>
									    ~   
									    <span name="favailable_period_type">
									        종료일 : 
									        <input type="date" id="endDate" name="endDate" class="fText right" style="width:auto;"
									         value="${requestScope.cvo.due_date}">
									    </span>  
											</span>	
						   
						    
                       <span class="gForm sp_available_period_from" style="display: none;">
                     
                        <input type="text" name="favailable_day_from_issued" value="3" class="fText right" style="width:30px;">
                    	</span>
							</td>
                            </tr>
                            <!-- <tr issue-type="tr_MM_MC_AJ_AD_AA_AI_AP_AO_AF_AQ_AU_DM_DC_DN_DJ_DD_DA_DI_DP_DO_R" benefit-type="tr_" style="display: table-row;">
                                <th scope="row">적용 범위<strong class="icoRequired">필수</strong></th>
                                <td>
                                    <select name="fused_level_type">
                                                                                <option value="O">
                                        주문서 쿠폰                                        </option>
                                                                                <option value="P">
                                        상품 쿠폰                                        </option>
                                                                            </select>
                                </td>
                            </tr> -->
                            <tr benefit-type="tr_F">
                                <th scope="row">최소 주문 금액 </th>
                                <td>
                                    <input type="text" class="fText right" name="min_order_price" value="${requestScope.cvo.min_order_price}" style="width:50px;"> 원                        </span>
                    	        </tr>
	                                <th scope="row">최대 할인 금액 </th>
	                                <td>
	                                 <input type="text" class="fText right" name="max_d_price" value="${requestScope.cvo.max_discount}" style="width:50px;"> 원                        </span>
	                    	        </tr>
                                                        <tr issue-type="tr_MM_MC_AJ_AD_AA_AF_AI_AP_AO_AQ_AU_DM_DC_DN_DJ_DD_DA_DI_DP_DO_R" benefit-type="tr_" style="display: table-row;">
                                <th scope="row">쿠폰적용 분류 선택<strong class="icoRequired">필수</strong></th>
                                <td>
                                    <select name="category_key" id ="category_key">
                                                                                <option value="0" ${requestScope.cvo.category_key eq '0' ? 'selected' : ''}>전체</option>
                                                                                <option value="1" ${requestScope.cvo.category_key eq '1' ? 'selected' : ''}>신발</option>
                                                                                <option value="2" ${requestScope.cvo.category_key eq '2' ? 'selected' : ''}>의류</option>
                                                                                <option value="3" ${requestScope.cvo.category_key eq '3' ? 'selected' : ''}>용품</option>
                                    </select>
                                    <a href="#none" class="btnEm"><span id="category_select" style="display: none;">분류선택</span></a>
                                </td>
                            </tr>
                                                        </tbody>
                        </table>
                    </div>
                </div>
            </form>
            <div class="mButton">
                <p>
           		    <c:if test="${param.mode ne  null}">
                    	<a onclick="editCoupon('${requestScope.c_idx}');" class="btnSubmit btnEdit"><span>쿠폰 수정</span></a>
                   		<a onclick="deleteCoupon('${requestScope.c_idx}');" class="btnEm btnPreview" id="eProductRegister"><span>쿠폰 삭제</span></a>
                   	</c:if>
                   	<!--  &mode=edit"  -->
                   	
           	        <c:if test="${param.mode eq  null}">
	              		<a onclick="saveCoupon();" href="#" class="btnSubmit btnSave"><span>저장</span></a>
	              	</c:if>
	          		
                </p>
            </div>

                <!-- 직접 컨트롤하는 데이터를 구분하기 위해 form 안쪽으로 넣지않고 일부로 tpl 최하단으로 배치했으며 이에 대한 폼전송은 js쪽에서 처리하게 되어있음 -->
            <input type="hidden" name="" class="selectedPrdList" value="">
            <input type="hidden" name="" class="selectedCateList" value="">
            <input type="hidden" name="" class="IssueSelectedPrdList" value="">
            <input type="hidden" name="" class="IssueSelectedCateList" value="">
            <input type="hidden" name="" class="couponCopyImgPath" value="">
        </div>
		<!-- 여기까지 content -->
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
/* 	$(function(){
		$("select[name=fbenefit_parent_type]").onchage(function(){
			
		})
	}) */
	$(document).ready(function() {

        // 옵션 변경 시 업데이트
        $("select[name='fbenefit_parent_type']").on('change', function() {
            updateBenefitDisplay();
        });
        
        updateBenefitDisplay();
    });

    function updateBenefitDisplay() {
        var selectedValue = $("select[name='fbenefit_parent_type']").val();
        console.log(selectedValue);
        if (selectedValue == "원") {
        	$("#d_price_won").css('display', '');
        	$("#d_price_per").css('display', 'none');
            
        } else if (selectedValue == "%") {
        	$("#d_price_won").css('display', 'none');
        	$("#d_price_per").css('display', '');
        } else {
        	$("#d_price_won").css('display', 'none');
        	$("#d_price_per").css('display', 'none');
        }
    }

	function saveCoupon(){
		var frm = $("form").serialize();
		$.ajax({
			type : 'post',
			url : '/shop/admin/coupon/addcouponIO.jsp',
			data : frm,
		}).done(function(data){
			alert("추가가 완료되었습니다.");
			location.href = "Controller?type=adcoupon";
		}).fail(function(data){
			alert("추가 중 오류가 발생했습니다. 다시 시도해주세요.");
		}); 
		
	}
	function editCoupon(key){
		var frm = $("form").serialize();
		frm += "&mode=edit&c_idx="+key;
		$.ajax({
			type : 'post',
			url : '/shop/admin/coupon/addcouponIO.jsp',
			data : frm
		}).done(function(data){
			alert("수정이 완료되었습니다.");
			location.href = "Controller?type=adcoupon";
		}).fail(function(data){
			alert("수정 중 오류가 발생했습니다. 다시 시도해주세요.");
		}); 
		
	}
	function deleteCoupon(key){
		let chk = confirm("선택한 쿠폰을 삭제하시겠습니까?");
		if (!chk)
			return;
		
		var frm = $("form").serialize();
		frm += "&mode=del&c_idx="+key;
		$.ajax({
			type : 'post',
			url : '/shop/admin/coupon/addcouponIO.jsp',
			data : frm
		}).done(function(data){
			alert("삭제가 완료되었습니다.");
			location.href = "Controller?type=adcoupon";
		}).fail(function(data){
			alert("삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
		}); 
	}
</script>
</body>
</html>