<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="-1">
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/layout_beta.css?vs=2406261322" />
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/reset_front.css?vs=2406261322" />
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/suio.css?vs=2406261322" />
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/dashboard_v3.css?vs=2406261322" />
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/dashboard_v4.css?vs=2406261322" />
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/plugin/jquery.mCustomScrollbar.min.css" media="all" />
<link rel="stylesheet" type="text/css" href="/shop/admin/css/index.css" media="all" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css"/>
<link rel="stylesheet" href="/shop/user/myshop/css/wish_list.css?v=1.0.1"/>
<link rel="stylesheet" href="/shop/layout/css/common.css?v=1.0.1"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-ui.css?v=1.0.1"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-tooltip.css?v=1.0.1"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-help.css?v=1.0.1"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-paginate.css?v=1.0.1"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-tab.css?v=1.0.1"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-button.css?v=1.0.1"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-box.css?v=1.0.1"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-table.css?v=1.0.1"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-desc.css?v=1.0.1"/>
<link rel="stylesheet" href="/shop/user/myshop/css/optionSelectLayer.css?v=1.0.1"/>
<link rel="stylesheet" href="/shop/admin/css/coupon.css"/>

<title>관리자 페이지</title>
</head>
<body>
	<div id="wrap" class=" beta">
		<hr class="layout" />
		<div id="container">
			<div id="sidebar">
				<div class="logo">
					<h1>
						<a href="Controller?type=adindex"> <img src="/shop/layout/header/img/logo_off_new.png" alt="" class="off -mov" width="200" /></a>
					</h1>
				</div>
				<div class="snbArea simple">
					<div id="menuList" class="eCustomScrollbar">
						<div id="mCSB_2"
							class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside">
							<div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position: relative; top: 0; left: 0;">
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
								</ul>
							</div>
						</div>
					</div>
					<div class="subMenu eClone eCustomScrollbar mCustomScrollbar _mCS_3 mCS-autoHide mCS_no_scrollbar">
						<div id="mCSB_3" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 1016px;">
							<div id="mCSB_3_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position: relative; top: 0; left: 0;" dir="ltr">
								<div class="depthList">
									<ul class="depth2">
										<li class="selected ">
											<a id="QA_Lnb_Menu10394" href="Controller?type=adcoupon" class="link "> <span class="ellips">쿠폰 조회</span> </a>
										</li>
										<li class="">
											<a id="QA_Lnb_Menu10394" href="Controller?type=adaddcoupon" class="link "> <span class="ellips">쿠폰 발급 | 수정</span></a>
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
							<h1>쿠폰 조회</h1>
						</div>
					</div>
					<div class="section">
						<div class="mTitle">
							<h2>발급 쿠폰 검색</h2>
						</div>
						<div class="mBoard type2 gSmall">
							<form id="fSearchForm">
									<input id="fCouponPage" type="hidden" name="coupon_list_page" value="1"/> 
									<input id="fCouponType" type="hidden" name="coupon_type" value="O"/> 
									<input id="fListCount" type="hidden" name="list_count" value="10"/> 
									<input id="fCouponOrderColumn" type="hidden" name="coupon_order_column" value=""/> 
									<input id="fCouponOrderWay" type="hidden" name="coupon_order_way" value=""/>
								<table border="1" summary="">
									<caption>발급 쿠폰 검색</caption>
									<tbody>
										<tr>
											<!-- 쿠폰명 -->
											<th scope="row">쿠폰명</th>
											<td><input id="fSearchValue" type="text" class="fText" name="coupon_name" value="" style="width: 400px"/></td>
											<!-- 혜택구분 -->
											<th scope="row">혜택구분</th>
											<td>
												<select id="benefit_type" name="benefit_type">
													<option value="" selected="">전체</option>
													<option value="원">할인금액</option>
													<option value="%">할인율</option>
												</select>
											</td>
										</tr>
										<tr>
											<!-- 발급구분 -->
											<th scope="row">발급구분</th>
											<td>
												<select id="fIssueType" name="issue_type">
													<option value="">전체</option>
													<option value="일괄 지급">일괄 지급</option>
													<option value="조건부 지급">조건부 지급</option>
												</select> 
											</td>
											<!-- 적용 범위 -->
											<th scope="row">적용범위</th>
											<td>
												<select id="used_level_type" name="used_level_type">
													<option value="">전체</option>
													<option value="1">신발</option>
													<option value="2">의류</option>
													<option value="3">용품</option>
												</select>
											</td>
										</tr>
										<tr>
											<!-- 생성일자 -->
											<th scope="row">생성일자</th>
											<td>
											    <div id="date_div" >
											    	<input type="date" id="reg_date" name="create_date_type" />
											    </div>
											</td>
											<!-- 삭제여부 -->
											<th scope="row"></th>
										</tr>
									</tbody>
								</table>
							</form>
						</div>
						<div class="mButton ">
							<p><button onclick="ff()" class="mNoEventAction btnGeneral" id="fCouponSearchBtn"><span class="btnGeneral">검색</span></button></p>
						</div>
						<input type="hidden" name="page"/>
					</div>
					<div class="section">
						<div class="mTitle">
							<h2>발급 쿠폰 목록</h2>
						</div>
						<div class="mCtrl typeBoard"></div>
						<div class="mBoard typeList type1 gScroll">
							<table border="1" summary="" class="eTr">
								<caption>발급 쿠폰 목록</caption>
								<colgroup>
									<col style="width: 100px" />
									<col style="width: 170px" />
									<col style="width: 170px" />
									<col style="width: 170px" />
									<col style="width: 120px" />
									<col style="width: 210px" />
									<col style="width: 210px" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">
											<strong class="array order_way coupon_no">쿠폰번호</strong>
										</th>
										<th scope="col">
											<strong class="array order_way coupon_name">쿠폰명</strong>
										</th>
										<th scope="col">
											<strong class="array order_way benefit_type">혜택</strong>
										</th>
										<th scope="col">
											<strong class="array order_way issue_type">발급구분</strong>
										</th>
										<th scope="col">
											<strong class="array order_way issue_count">적용범위</strong>
										</th>
										<th scope="col">
											<strong class="array order_way use_period">생성일자</strong>
										</th>
										<th scope="col">
											<strong class="array order_way use_period">사용기간</strong>
										</th>
									</tr>
								</thead>
								<!-- 검색했을때 나타나는 테이블 쿠폰 쿠폰 쿠폰 쿠폰 쿠폰 쿠폰 쿠폰 쿠폰 -->
								<tbody id="mCouponList" class="center">
									<c:set var="c_ar" value="${sessionScope.c_ar }"/>
									<c:if test="${c_ar != null}">
									<c:forEach var="coupon" items="${c_ar}">
									<tr>
										<td class="c_no"><a href="Controller?type=adaddcoupon&mode=edit&c_idx=${coupon.c_idx }" class="txtLink" >${coupon.c_idx }</a></td>
										<td class="c_name"><a href="Controller?type=adaddcoupon&mode=edit&c_idx=${coupon.c_idx }" class="txtLink" >${coupon.c_name }</a></td>
										<td class="d_type">${coupon.d_price}${coupon.d_type }</td>
										<td class="issue_sort">${coupon.issue_sort }</td>
										<td class="category_key">
											<c:choose>
												<c:when test="${coupon.category_key eq '1'}">신발</c:when>
												<c:when test="${coupon.category_key eq '2'}">의류</c:when>
												<c:when test="${coupon.category_key eq '3'}">용품</c:when>
												<c:otherwise>전체</c:otherwise>
											</c:choose>
										</td>
										<td class="issue_at">${coupon.issue_at }</td>
										<td class="due_date">${coupon.due_date }</td>
									</tr>
									</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
						<div class="mCtrl typeBoard"></div>
						<div class="mPaging typeWhole"></div>
						<!-- 페이징 -->
						<c:set var="page" value="${sessionScope.page}"/>
						<div class="mPaginate">
<%-- 							<c:if test="${page.getStartPage() >= page.getPagePerBlock()}"> --%>
<%-- 								<a href="#" onclick="searchProduct('${page.getNowPage()-page.getPagePerBlock()}');" class="prev">이전 3페이지</a> --%>
<%-- 							</c:if> --%>
							<ol>
								<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" varStatus="idx">
								<c:if test="${page.getNowPage() eq idx.index}">
									<li>
										<strong title="현재페이지">${idx.index}</strong>
									</li>
								</c:if>
								<c:if test="${page.getNowPage() ne idx.index}">
									<li>
										<a href="#" onclick="searchProduct('${idx.index}');">${idx.index}</a>
									</li>
								</c:if>
								</c:forEach>
							</ol>
							<c:if test="${page.getEndPage() < page.getTotalPage()}">
								<a href="#" onclick="searchProduct('${page.getNowPage()+page.getPagePerBlock()}');" class="next">다음 3페이지</a>
							</c:if>
						</div>
					</div>
				</div>
				<!-- 여기까지 content -->
			</div>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script><script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#reg_date").datepicker({
        dateFormat: "yy-mm-dd"
    });
});

function searchProduct(cPage){
	var frm = $("form").serialize();

	$.ajax({
		type : 'post',
		url : '/shop/admin/coupon/couponSearchIO.jsp?cPage='+cPage,
		data : frm,
	}).done(function(data){
		location.reload();
	});
}

//검색버튼 클릭시 
function ff() {
    let c_name = $('#fSearchValue').val();
    let d_type = $("#benefit_type").val();
    let issue_sort = $("#fIssueType").val();
    let category_key = $("#used_level_type").val();
    let issue_at = $("#reg_date").val();

    let param = {
        c_name: c_name,
        d_type: d_type,
        issue_sort: issue_sort,
        category_key: category_key,
        issue_at: issue_at
    };

    $.ajax({
        url: "/shop/admin/coupon/couponSearchIO.jsp",
        type: "POST",
        data: param,
        success: function () {
            location.reload();
        }
    });
}
</script>
</body>
</html>