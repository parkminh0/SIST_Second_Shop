<%@page import="vo.UgradeVO"%>
<%@page import="dao.UgradeDAO"%>
<%@page import="vo.OptionVO"%>
<%@page import="dao.OrderDAO"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.UserVO"%>
<%@page import="vo.BasketVO"%>
<%@page import="java.util.List"%>
<%@page import="org.jdom2.Document"%>
<%@page import="vo.CouponVO"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel ="stylesheet" href = "order/css/DoNotREAD.css">
<link rel ="stylesheet" href = "order/css/DoNotREAD2.css">
<link rel ="stylesheet" href = "order/css/test.css">
<body>
<c:set var="ar" value="${requestScope.ar }"/>
<div id="mCafe24Order" class="xans-element- xans-order xans-order-form typeHeader xans-record-">
<div id="ec-jigsaw-area-productdetail"></div>
<div class="titleArea">
	<h1>주문/결제</h1>
</div>
<div class="billingNshipping">
    <!-- 수령자 정보   -->
<div id="ec-jigsaw-area-shippingInfo" class="ec-base-fold eToggle selected">
<div id="ec-jigsaw-title-shippingInfo" class="title">
<h2>배송지</h2>
</div>
<%
	UserVO userVO = (UserVO) session.getAttribute("user_vo");
	String ug_idx = userVO.getUg_idx();
	String u_idx = request.getParameter("u_idx");
	String optionKeysParam = request.getParameter("option_keys");
	String bQtysParam = request.getParameter("b_qtys");
	
	String[] numbers = bQtysParam.split(",");
	String[] bQtys = null;
	OptionVO[] ovo = null;
	List<OptionVO> list = new ArrayList<>();
	
	 if (optionKeysParam != null && bQtysParam != null) {
	    String[] optionKeys = optionKeysParam.split(",");
	    bQtys = bQtysParam.split(",");
	    List<OptionVO> ovoList = new ArrayList<>();
	    for (int i = 0; i < optionKeys.length; i++) {
	        OptionVO[] optionVOs = OrderDAO.getOrderList(optionKeys[i]);
	        ovoList.addAll(Arrays.asList(optionVOs));
	    }
	    ovo = ovoList.toArray(new OptionVO[ovoList.size()]);
	}
	
	 UgradeVO[] uuuvo = UgradeDAO.searchUgrade(ug_idx);
	 String mile_ratio = uuuvo[0].getRatio_mile();
	 
	 request.setAttribute("mile_ratio", mile_ratio);
	 request.setAttribute("ovo", ovo);
	 request.setAttribute("b_Qty", bQtys);
	 request.setAttribute("u_idx", u_idx);
%>

<div class="contents">
<!-- 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 -->
	<c:set var="ovo" value="${ovo}" />
	<c:set var="ff_price" value="${requestScope.send_price }"/>
	<c:set var="basket_list" value="${sessionScope.user_vo.basket_list}" />
	<c:set var="user_mile" value="${sessionScope.user_vo.getTotal_mile()}" />
	<c:set var="total_spend" value="0" />
	<c:set var="total_qty" value="0" />
	<c:set var="delivery_price" value="0" />
	<c:forEach var="bvo" items="${ovo}" varStatus="status" >
		<c:set var="total_spend" value="${total_spend+bvo.getPvo().getCell_price()*b_Qty[status.index] }" />
		<c:set var="total_qty" value="${total_qty + b_Qty[status.index] }" />
	</c:forEach>
	<c:set var="delivery_price" value="2000" />
	<c:set var="final_price" value="${total_spend+delivery_price}" />
<!-- 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 값 넘김 -->
	<div id="ec-orderform-billingNshipping-head"></div>
	<div class="">
			<div id="ec-jigsaw-tab-shippingInfo" class="ec-base-tab "></div>
		<div id="ec-shippingInfo-newAddress" class="tabCont newShipArea ">
			<div class="ec-base-table typeWrite">
				<table border="1">
					<caption>배송 정보 입력</caption>
						<colgroup>
							<col style="width:102px">
							<col style="width:auto">
						</colgroup>
				<tbody>

				<!-- 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 -->
				<tr class="ec-shippingInfo-newAddress-name">
					<th scope="row">받는사람 <span class="icoRequired">필수</span></th>
						<td>
							<input id="rname" name="rname" fw-filter="isFill" fw-label="수취자 성명" fw-msg="" class="inputTypeText"
							 placeholder="" size="15" value="${ar[0].getName() }" type="text">
						</td>
				</tr>
				<!-- 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 받는사람 -->
				
				<!-- 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 -->
				<tr id="ec-receiver-address">
					<th scope="row">주소 <span class=""><span class="icoRequired">필수</span></span></th>
					<td>
						<ul class="ec-address">
						<li id="receiver_zipcode_wrap" class="ec-address-zipcode" style="">
							<input id="rzipcode1" name="rzipcode1" placeholder="우편번호" fw-filter="isLengthRange[1][14]" class="inputTypeText" type="text" maxlength="14" style="" readonly="" fw-label="우편번호" value="${ar[0].getZip_code() }"> 
							<button id="btn_search_rzipcode" onclick="checkPost()" class="btnBasic" type="button" style="cursor: pointer;">주소검색</button>
							<span class="ec-base-label">
								<input id="no_rzipcode0" name="no_rzipcode0" class="displaynone" type="checkbox" disabled="" style="display: none; cursor: unset;" fw-filter="">
								<label id="receiver_zipcode_check_label" for="no_rzipcode0" class="displaynone" disabled="" style="display: none;" fw-filter="">우편번호 없음</label>
							</span>
							<span id="receiver_zipcodeNotFoundMsg_wrap" class="ec-base-label displaynone">우편번호가 정확하지 않습니다. 다시 확인해 주세요.</span>
						</li>
						<li id="receiver_baseAddr_wrap" class="" style="">
							<input id="raddr1" name="raddr1" placeholder="기본주소" fw-filter="isFill" class="inputTypeText" type="text" size="60" maxlength="100" style="" readonly="" fw-label="기본주소" value="${ar[0].getAddr() }">
						</li>
						<li id="receiver_detailAddr_wrap" class="" style="">
							<input id="raddr2" name="raddr2" placeholder="나머지 주소(선택 입력 가능)" fw-filter="" class="inputTypeText" type="text" size="60" maxlength="255" style="" fw-label="나머지 주소(선택 입력 가능)" value="${ar[0].getAddr_detail() }">
							<input type="hidden" name="addr_d" id="addr_extra" placeholder="참고항목">
						</li>
						</ul>                                
					</td>
				</tr>
				<!-- 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 주소 -->
				
				<!-- 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화  -->
				<tr class="ec-shippingInfo-receiverPhone displaynone">
					<td><div class="ec-base-mail"></div></td></tr>
					<tr class="ec-shippingInfo-receiverCell ">
						<th scope="row">휴대전화 <span class=""><span class="icoRequired">필수</span></span></th>
						<td><div class="ec-base-mail"><select id="rphone2_1" name="rphone2_[]" fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호" fw-alone="N" fw-msg="">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
							</select>-<input id="rphone2_2" name="rphone2_[]" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호" fw-alone="N" fw-msg=""
							 placeholder="" size="4" value="${fn:substring(ar[0].getPhone(), 4,8)}" type="text">-<input id="rphone2_3" name="rphone2_[]" maxlength="4" fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
							  fw-alone="N" fw-msg="" placeholder="" size="4" value="${fn:substring(ar[0].getPhone(),9,13)}" type="text"></div>
						</td>
				</tr>
				<!-- 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화 휴대전화  -->
				
				<!-- 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 -->
				<tr class="ec-orderform-emailRow ec-shop-deliverySimpleForm ">
					<th scope="row">이메일 <span class="icoRequired icon_order_email" style="">필수</span></th>
					<td>
						<div class="ec-base-mail">
							<input id="oemail1" name="oemail1" fw-filter="isFill" fw-label="주문자 이메일" fw-alone="N" fw-msg="" class="mailId" value="${ar[0].getEmail() }" type="text">
						</div>
					</td>
				</tr>
				<!-- 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 이메일 -->
				</tbody>
				</table>
			</div>
		</div>
	</div>
	<!-- 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 -->
		<div class="ec-shippingInfo-shippingMessage segment unique  ">
			<select id="omessage_select" name="omessage_select" fw-filter="" fw-label="배송 메세지" fw-msg="">
				<option value="oMessage-0" selected="selected">-- 메시지 선택 (선택사항) --</option>
				<option value="oMessage-1">배송 전에 미리 연락바랍니다.</option>
				<option value="oMessage-2">부재 시 경비실에 맡겨주세요.</option>
				<option value="oMessage-3">부재 시 문 앞에 놓아주세요.</option>
				<option value="oMessage-4">빠른 배송 부탁드립니다.</option>
				<option value="oMessage-5">택배함에 보관해 주세요.</option>
			</select>               
			<div class="ec-shippingInfo-omessageInput gBlank10" style="display:none;">
				<textarea id="omessage" name="omessage" fw-filter="" fw-label="배송 메세지" fw-msg="" maxlength="255" cols="70"></textarea>
			</div>
		</div>
	</div>
</div>
<!-- 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 메시지 -->

<!-- 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 -->
<div class="ec-shippingInfo-newAddress-setMain segment ">
<input id="set_main_address0" name="set_main_address[]" fw-filter="" fw-label="기본 배송지로 저장" fw-msg="" value="T" type="checkbox"><label for="set_main_address0">기본 배송지로 저장</label></div>
<!-- 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 기본 배송지로 저장 -->

<!-- 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 -->
<div id="ec-jigsaw-area-orderProduct" class="ec-base-fold eToggle selected">
    <div id="ec-jigsaw-title-orderProduct" class="title">
        <h2>주문상품</h2>
        <span id="ec-jigsaw-heading-orderProduct" class="txtStrong gRight" style="display: none;">1개</span>
    </div>
    <div class="contents">

        <!-- 국내배송상품 주문내역 -->
        <div class="orderArea ">
            <!-- 기본배송 -->
            <div class="xans-element- xans-order xans-order-normallist">
<!-- 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 -->
							<c:if test="${ovo ne null and fn:length(ovo) ne 0}">
								<c:forEach var="bvo" items="${ovo}" varStatus="status">
									<div class="ec-base-prdInfo xans-record-">
										<div class="prdBox">

											<div class="displaynone">
												<input id="chk_order_cancel_list0" name="chk_order_cancel_list_basic0" value="602:000B:F:17" type="checkbox" disabled="">
											</div>
											<div class="thumbnail">
												<a
													href="/skin-skin5/product/detail.html?product_no=602&amp;cate_no=445"><img src="${bvo.getPvo().getImg_url()}" alt="" width="90" height="90"></a>
											</div>
											<div class="description">
												<strong class="prdName" title="상품명"> <a
													href="/skin-skin5/product/반려동물-화장실-고양이-배변통-캣-모래통-스마트-탈취-모래삽-발패드/602/category/445/"
													class="ec-product-name">${bvo.getPvo().getProd_name() }</a></strong>
												<ul class="info">
													<li class="displaynone">무이자할부 상품</li>
													<li title="유효기간" class="displaynone">내 사용</li>
													<li title="옵션">
														<p class="option size">사이즈 : ${bvo.getSize() }</p>
														<p class="option color">색상 : ${bvo.getColor() }</p>
													</li>
													<li>수량: ${b_Qty[status.index] } 개</li>
													<li id="" class="displaynone">할인금액: <span
														class="txtWarn">-<span id="">0</span>원
													</span> <span class="txtWarn displaynone">()</span>
													</li>
													<li class="displaynone" title="배송">[무료] / 기본배송</li>
													<li class="displaynone" title="배송주기">배송주기 : <span
														class="txtEm"></span>
													</li>
													<li id="product_mileage0" class="mileage displaynone"
														title="적립금">-</li>
												</ul>
												<div class="proPrice">
													<span class="display"> <del id="">${bvo.getPvo().getCell_price() * b_Qty[status.index]} 원 -></del> <span id="final_price_${status.index}"><c:out value="${bvo.getPvo().getOri_price() * b_Qty[status.index]}"/> 원</span>
													</span>
													<button class="coupon" id="ec-shop_btn_layer_payment" onclick="openCouponModal(${status.index})">쿠폰적용</button>
													<input type="hidden" id="category_key_${status.index}" value="${ovo[status.index].pvo.category_key}">
													<input type="hidden" id="send_price_${status.index}" value="${ovo[status.index].pvo.cell_price * b_Qty[status.index]}">
												</div>

											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<tr class="ec-orderform-emailRow ec-shop-deliverySimpleForm ">
					<th scope="row">마일리지 <span class="icoRequired icon_order_email" style=""></span></th>
					<td>
						<div class="ec-base-mail">
							<input class="cssmile" id="mile" name="mile" style="width: 50%;" placeholder="고객님의 마일리지 총 잔액은${user_vo.getTotal_mile() }원 입니다." fw-filter="isLengthRange[1][14]" class="inputTypeText" type="text" maxlength="60" style=""fw-label="우편번호" value=""> 
							<button id="btn_search_rzipcode" onclick="usemile()" class="btnBasic" type="button" style="cursor: pointer;">마일리지 적용</button>
						</div>
					</td>
				</tr>
							<!-- 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 상품반복 -->

<!-- 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 주문상품 -->
</div>
            <div class="totalPrice ">
                <div class="title">
                    <h3>배송비</h3>
                    <span class="deliveryFee"><span id="domestic_ship_fee">2000</span>원</span>
                </div>
            </div>

            <!-- 업체기본배송 -->
                        <div class="totalPrice displaynone">
                <div class="title">
                    <h3>배송비</h3>
                    <span class="deliveryFee"><span id=""></span>원</span>
                </div>
            </div>

            <!-- 개별배송 -->
                        <div class="totalPrice displaynone">
                <div class="title">
                    <h3>배송비</h3>
                    <span class="deliveryFee"><span id=""></span>원</span>
                </div>
            </div>
        </div>
        </div>
<!-- [할인/부가결제] 할인/부가결제, 자동 할인내역 레이어 팝업 -->
<div class="ec-jigsawWrapper">
	<div id="ec-jigsaw-area-discount" class="ec-base-fold eToggle selected displaynone">
		<div id="ec-jigsaw-title-discount" class="title">
			<h2>할인/부가결제</h2>
			<span id="ec-jigsaw-heading-discount" class="txtStrong gRight"style="display: none;"> -<span id="discount_total_sale_price_view"></span>원 <span class="displaynone"><span id="discount_total_sale_price_ref_view"><span class="eRefPrice"></span></span></span>
			</span>
		</div>
		<div class="contents">
			<div class="discountDetail displaynone"
				id="ec-shop-orderfom-total-benefit-view-id"
				style="display: none;">
				<div class="discountList eToggle">
					<div class="title">
						<div class="heading">자동 할인</div>
						<div class="control">
							<span class="txtEm"><span
								id="total_benefit_price_view">0</span>원</span>
						</div>
					</div>
					<div class="contents">
						<ul id="total_benefit_list">
							<li class="displaynone "><span class="discountName">쿠폰할인</span>
								<span class="discountPrice"><span
									id="mBenefitCouponSale">0원</span></span></li>
							<li class="displaynone ec-shop-mBenefitShipfeeSale"
								style="display: none;"><span class="discountName">배송비할인</span>
								<span class="discountPrice"><span
									id="mBenefitShipfeeSale">0원</span></span></li>
							<li class="displaynone ec-shop-mBenefitMembergroupSale"
								style="display: none;"><span class="discountName">회원등급할인</span>
								<span class="discountPrice"><span
									id="mBenefitMembergroupSale">0원</span></span></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="discountDetail displaynone mCouponSelect"
				style="display: block;">
				<div class="displayFlex">
					<strong class="heading">쿠폰 할인</strong>
					<div class="control">
						<span class="discountPrice"><span id=""
							class="mTotalCouponDiscount discountStrong">0원</span></span> <a
							href="#none" id="btn_coupon_select" class="btnNormal">쿠폰
							적용</a>
					</div>
				</div>
				<span class="summary">보유쿠폰 <span class="txtEm">0개</span></span>
				<p class="discountMsg ec-autoApplyMsg txtEm"
					style="display: none;">자동 적용된 할인 쿠폰을 확인해 주세요.</p>
			</div>
			<div class="discountDetail mCouponModify" style="display: none;">
				<span class="summary">보유쿠폰 <span class="txtEm">0개</span></span>
				<p class="discountMsg ec-autoApplyMsg txtEm" style="display: none;">자동 적용된 할인 쿠폰을 확인해 주세요.</p>
				<ul class="couponWrap displaynone">
					<li id="divCpnView" class="coupon ec-order-expandwrap">
						<div class="couponList">
							<span id="txt_cpn_name" class="ec-coupon-expand"><span class="txt_info"></span></span> <span id="txt_cpn_price"></span> <span
								id="txt_cpn_attr_D"></span> <span id="txt_cpn_attr_M"></span>
							<span id="txt_cpn_attr_C"></span> <span class="displaynone"
								id="mProductCouponDiscount">0원</span> <span
								class="displaynone" id="txt_cpn_sale2">0원</span> <span
								class="displaynone" id="mDeliveryCouponDiscount">0원</span>
							<button type="button" class="btnRemove" id="txt_cpn_delete">x</button>
						</div>
						<ul class="coupon-help-info">
							<li>사용 기간 : <span id="txt_cpn_period"></span>
							</li>
							<li id="txt_cpn_paymethod_display">결제 조건 : <span
								id="txt_cpn_paymethod"></span>
							</li>
						</ul>
					</li>
				</ul>
				<ul id="divCpn" style="display: none;" class="couponWrap"></ul>
			</div>
			<div id="mileage_use_area" class="discountDetail displaynone">
				<div class="displayblock">
					<strong class="heading">적립금</strong>
					<div class="control">
						<input type="hidden" name="ori_total_avail_mileage"
							id="ori_total_avail_mileage" value="0.00" disabled="">
						<input id="input_mile" name="input_mile" fw-filter=""
							fw-label="적립금" fw-msg="" class="inputTypeText" placeholder=""
							size="10" value="" type="text">
						<button type="button" class="btnNormal" id="all_use_mileage">전액
							사용</button>
					</div>
				</div>
				<span class="summary">보유 잔액 <span class="txtEm">0원</span></span>
				<ul class="ec-base-help ec-order-expandwrap">
					<li id="mileage_max_limit" class="ec-order-expand">1회 구매시
						적립금 최대 사용금액은 0원입니다.</li>
					<li>최소 적립금 0원 이상일 때 사용 가능합니다.</li>
					<li id="mileage_max_unlimit" class="">최대 사용금액은 제한이 없습니다.</li>
					<li>적립금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면
						주문이 완료됩니다.</li>
					<li id="mileage_shipfee" class="displaynone">적립금 사용 시 배송비는
						적립금으로 사용 할 수 없습니다.</li>
					<li id="mileage_exception" class="displaynone">적립금 사용 시 해당
						상품에 대한 적립금은 적립되지 않습니다.</li>
				</ul>
			</div>
			<div class="discountDetail displaynone">
				<div class="displayblock">
					<strong class="heading">예치금</strong>
					<div class="control">
						<input type="hidden" name="ori_total_deposit"
							id="ori_total_deposit" value="" disabled=""> <input
							id="input_deposit" name="input_deposit" fw-filter=""
							fw-label="예치금" fw-msg="" class="inputTypeText" placeholder=""
							size="10" value="" type="text" disabled="">
						<button type="button" class="btnNormal" id="all_use_deposit">전액
							사용</button>
					</div>
				</div>
				<span class="summary">보유 잔액 <span class="txtEm">원</span></span>
				<ul class="ec-base-help ec-order-expandwrap">
					<li class="ec-order-expand">예치금은 사용제한 없이 언제든 결제가 가능합니다.</li>
					<li>예치금으로만 결제할 경우, 결제금액이 0으로 보여지는 것은 정상이며 [결제하기] 버튼을 누르면
						주문이 완료됩니다.</li>
				</ul>
			</div>
			<div class="discountDetail discount_affiliate_template"
				style="display: none;">
				<div class="displayblock">
					<strong class="heading">''</strong>
					<div class="control">
						<input id="input_affiliate" name="input_affiliate"
							fw-filter="" fw-label="" fw-msg=""
							class="inputTypeText affiliateInput" placeholder="" size="10"
							value="" type="text" readonly="" disabled=""> &nbsp;<input
							id="paymethod_affiliate" name="paymethod_affiliate" value=""
							type="hidden" disabled=""><input
							id="receiptIssuer_affiliate" name="receiptIssuer_affiliate"
							value="" type="hidden" disabled=""> &nbsp;
						<button type="button" class="btnNormal affiliate_balance"
							value="">조회</button>
						<button type="button"
							class="btnNormal btn_reset affiliate_reset">초기화</button>
					</div>
				</div>
			</div>
			<div class="totalPay">
				<h3 class="heading">적용금액</h3>
				<div class="txtEm">
					-<span id="total_sale_price_view">0</span>원 <span
						class="refer displaynone">(<span
						id="total_sale_price_ref_view"><span class="eRefPrice"></span></span>)
					</span>
				</div>
				<span class="displaynone" id="total_addpay_price_view">0</span>
			</div>
		</div>
	</div>
</div>
<!-- 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 -->
<div id="ec-jigsaw-area-payment"
	class="ec-base-fold eToggle selected">
	<div id="ec-jigsaw-title-payment" class="title">
		<h2>결제정보</h2>
	</div>
	<div class="contents">
		<div class="segment">
			<div class="ec-base-table gCellNarrow">
				<table border="1">
					<caption>결제정보 상세</caption>
					<colgroup>
						<col style="width: 155px">
						<col style="width: auto">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">주문상품</th>
							<td class="right"><span id="total_product_base_price_id"
								class="price">${total_spend }원</span></td>
						</tr>
						<tr class="">
							<th scope="row">배송비 <span class="displaynone info">(착불상품
									포함)</span>
							</th>
							<td class="right"><span class="price">+<span
									id="total_ship_price_id">${delivery_price}</span>원</span></td>
						</tr>
						<tr class="discountView">
							<th scope="row">할인/부가결제</th>
							<td class="right"><span class="price"><span class="txtRed">-<span class="eRefPrice" id="payment_total_sale_price_view">0</span></span>원</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="totalPay paymentPrice">
			<h3 class="heading">최종 결제 금액</h3>
			<strong class="txtStrong"> <span id="payment_total_order_sale_price_view">${final_price }</span>원<span
				class="refer displaynone"> (<span
					id="payment_total_order_sale_price_ref_view"><span
						class="eRefPrice"></span></span>)
			</span>
			</strong> <span class="displaynone"><input id="total_price"
				name="total_price" fw-filter="isFill" fw-label="결제금액" fw-msg=""
				class="inputTypeText" placeholder=""
				style="text-align: right; ime-mode: disabled; clear: none; border: 0px; float: none;"
				size="10" readonly="1" value="99800" type="text" disabled=""></span>
		</div>
	</div>
</div>
<!-- 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 결제정보 -->

<!-- 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 -->
<div id="ec-jigsaw-area-paymethod" class="ec-base-fold eToggle selected">
    <div id="ec-jigsaw-title-paymethod" class="title">
        <h2>결제수단</h2>
    </div>
<div class="contents">
	<div class="segment">
		<ul class="payMethod">
			<li class="ec-paymethod-recentArea displaynone">
				<div id="ec-payment-recentPaymethodText" class="inner"></div>
			</li>
			<li class="ec-paymethod-newArea selected">
				<div class="inner">
				<span class="ec-base-label"><input id="addr_paymethod0" name="addr_paymethod" fw-filter="isFill" fw-label="결제방식" fw-msg="" value="cash" type="radio" checked="checked" autocomplete="off"><label for="addr_paymethod0">토스페이먼츠</label></span>                 
				</div>
			</li>
		</ul>
	</div>
		<div class="ec-paymethod-input-detail">
			<div id="payment_input_cash" class="ec-base-table typeWrite" style="">
			<table border="1">
				<colgroup>
					<col style="width:100px">
					<col style="width:auto">
				</colgroup>
				<tbody>
						<tr>
							<td>
							 	<ul id="toss_info" class="ec-base-help typeDash">
				                	<li>토스는 간편하게 지문 또는 비밀번호만으로 결제할 수 있는 빠르고 편리한 간편 결제 서비스입니다.</li>
				                    <li>토스 결제 후 취소/반품 등이 발생할 경우 토스를 통한 신용카드 취소/토스머니 환불이 이루어집니다.</li>
				                    <li>토스 이용가능 결제수단 : 국내 발행 신용/체크카드, 토스머니</li>
				            	</ul>
				            </td>
				        </tr>
				</tbody>
			</table>
			</div>
		</div>
</div>
<!-- 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 결제수단 -->

<!-- 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 -->
<div id="ec-jigsaw-area-benefit" class="ec-base-fold eToggle">
	<div id="ec-jigsaw-title" class="title">
		<h2>적립 혜택</h2>
		<span id="ec-jigsaw-heading-benefit" class="txtStrong gRight"><span id="mAllMileageSum-title">0</span>원 예정</span>
	</div>
	<div class="contents">
		<div class="segment">
			<div class="ec-base-table gCellNarrow">
				<table border="1">
					<caption>적립 혜택 상세</caption>
					<colgroup>
						<col style="width:160px">
						<col style="width:auto">
					</colgroup>
						<tbody>
							<tr>
								<th scope="row">회원등급 적립금</th>
								<td class="right"><span id="mMemberMileage" class="price">0원</span></td>
							</tr>
							<tr>
								<th scope="row">쿠폰 적립금</th>
								<td class="right"><span id="mCouponMileage" class="price">0원</span></td>
							</tr>
						</tbody>
				</table>
			</div>
		</div>
		<div class="totalPay">
			<h3 class="heading">적립 예정금액</h3>
			<strong class="txtEm"><span id="mAllMileageSum" style="">0원</span></strong>
		</div>
	</div>
</div>
<!-- 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 적립혜택 -->

<!-- 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 -->
						<div class="ec-base-button gFull">
						<c:forEach var="bvo" items="${ovo}" varStatus="status">
							<td class="hidden">
								<input type="hidden" class="hidden_option" value="${ovo[status.index].getOption_key()}">
								<input type="hidden" class="hidden_qty" value="${b_Qty[status.index]}">
							</td>
						</c:forEach>
							<button type="submit" class="btnSubmit" onclick="sendData()" id="ec-shop_btn_layer_payment">
								<span id="ec-shop-confirm_total_order_price_view">${final_price }</span> 원 결제하기
							</button>
						</div>
					
					
</div>
</div>
			<iframe id="h_payment" name="h_payment" width="0" height="0" frameborder="0" src=""></iframe>
			<input type="hidden" id="sPrdName" name="sPrdName" value="반려동물 화장실 고양이 배변통 캣 모래통 스마트 탈취 모래삽 발패드"> &nbsp;
			

</div>
	<div class="helpArea">
		<ul class="ec-base-help typeDash">
			<li class="displaynone"><span class="txtEm">상기 금액은 결제 시점의
					금액과 다를 수 있습니다.</span></li>
			<li>무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해
				무이자할부가 적용되지 않습니다. 무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기
				바랍니다.</li>
			<li>최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</li>
		</ul>
	</div>
</div>
<!-- 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 최종결제 -->

<div class="modal fade" id="couponModal" tabindex="-1" aria-labelledby="couponModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="couponModalLabel">쿠폰</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- 모달 내용 -->
                <div class="ec-base-table">
                    <!-- 여기에 테이블이 들어갈 예정 -->
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
function sendData() {
    let u_idx = "${u_idx}";
    let deli_selectElement = document.getElementById("omessage_select");
    let delivery_msg = deli_selectElement.options[deli_selectElement.selectedIndex].textContent;
    let d_price = document.getElementById("payment_total_sale_price_view").textContent;
    let destination = document.getElementById("raddr2").value;
    let receiver = document.getElementById("rname").value;
    let zip_code = document.getElementById("rzipcode1").value;
    let receiver_tel = document.getElementById("rphone2_1").value + document.getElementById("rphone2_2").value + document.getElementById("rphone2_3").value;
    let order_qty = 0;
    let final_price = "${final_price}";
    let delivery_price = document.getElementById("total_ship_price_id").textContent;
    let totalPrice = document.getElementById("ec-shop-confirm_total_order_price_view").innerText;
    let items = document.querySelectorAll('.hidden_option');
    let items2 = document.querySelectorAll('.hidden_qty');
    let option_keys = [];
    let b_qtys = [];
    
    items.forEach(function(item) {
        let optionKey = item.value;
        option_keys.push(optionKey);
    });
    
    items2.forEach(function(item) {
        let b_qty = item.value;
        b_qtys.push(b_qty);
    });
    
    b_qtys.forEach(function(b_qty) {
    	order_qty += parseInt(b_qty);
    });

	
    let form = document.createElement("form");
    form.method = "post";
    form.action = "order/toss/checkout.jsp";
    
    let param = {
        u_idx: u_idx,
        delivery_msg: delivery_msg,
        delivery_price: delivery_price,
        d_price: d_price,
        destination: destination,
        receiver: receiver,
        zip_code: zip_code,
        receiver_tel: receiver_tel,
        order_qty: order_qty,
        final_price: final_price,
        totalPrice: totalPrice,
        option_keys: option_keys.join(","),
        b_qtys: b_qtys.join(",")
    };
    
    for (let key in param) {
        if (param.hasOwnProperty(key)) {
            let input = document.createElement("input");
            input.type = "hidden";
            input.name = key;
            input.value = param[key];
            form.appendChild(input);
        }
    }

    document.body.appendChild(form);
    form.submit();
	
	
}

function checkPost() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("addr_extra").value = extraAddr;
            
            } else {
                document.getElementById("addr_extra").value = '';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('rzipcode1').value = data.zonecode;
            document.getElementById("raddr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("raddr2").focus();
        }
    }).open();
}
    function openCouponModal(index) {
    	let category_key = document.getElementById("category_key_" + index).value;
    	let ff_price = "${ff_price}";
    	let u_idx = "${u_idx}";
    	
    	$('#couponModal').attr('data-index', index);
    	$.ajax({
            url: "/shop/order/mycouponorder.jsp",
            type: "post",
            data: {
                category_key: category_key,
                send_price: ff_price,
                u_idx: u_idx
            },
            success: function(response) {
                // 성공적으로 응답을 받으면 모달을 엽니다.
                var tableHtml = $(response).find('.ec-base-table').html();
    
    			// 모달의 콘텐츠 부분에 테이블 HTML 삽입
    			$('#couponModal .modal-body .ec-base-table').html(tableHtml);
                $('#couponModal').modal('show');
            }});
    }


    $(document).on('click', '.coupon.apply', function() {
        var index = $(this).closest('tr').index();
        var c_idx = $(this).val();
        
    });

    $(document).on('click', '.coupon.cancel', function() {
        var index = $(this).closest('tr').index();
        var c_idx = $(this).val();
    });
    function toggleCoupon(button, isApply , index, c_idx) {
        let tr = button.closest('tr');
        let aa = button.value;
        let elements = document.querySelectorAll('input[id^="coupon_status_"]');
        let ele_status = 0;

        if (isApply) {
            elements.forEach(function(element) {
	            if (element.value == '1') {
	                ele_status++;
	            }
	        });
	        if (ele_status >= 1) {
	            alert('상품 1개당 1개의 쿠폰만 사용 가능합니다.');
	        }
	        else{
			document.getElementById("coupon_status_"+index).value = 1;
            tr.querySelector('.apply').style.display = 'none';
            tr.querySelector('.cancel').style.display = 'inline-block';
            tr.querySelector('.cancel').style.display = 'inline-block';
            sendCouponData(c_idx, index, 1);
	        }
            
            } else {
            tr.querySelector('.cancel').style.display = 'none';
            tr.querySelector('.apply').style.display = 'inline-block'; 
            document.getElementById("coupon_status_"+index).value = 0;
            sendCouponData(c_idx, index, 0);
        }
        
    }
	let final_d_price = 0;
	let final_final_price = "${final_price}";
  function sendCouponData(c_idx, index, isApply) {
		let u_idx = "${u_idx}";
		let index2 = $('#couponModal').attr('data-index');
		let price = document.getElementById("send_price_"+index2).value;
		let param = "c_idx="+c_idx+ "&isApply="+isApply+"&u_idx="+u_idx+"&price="+price;
		let final_price = 0;
		let mile_ratio = "${mile_ratio}";

			$.ajax({
		    	url:"/shop/order/mycouponorderIO.jsp",
		    	type:"post",
		    	data: param,}).done(function(data) {
		    		console.log(final_final_price);
		    		final_d_price += parseFloat(data.d_price);
		    		let use_mile = document.getElementById("mile").value;
		    		final_d_price = final_d_price + use_mile;
		    		document.getElementById("final_price_"+index2).innerText =  Math.floor(data.price) + "원";
		    		document.getElementById("payment_total_sale_price_view").innerText =  Math.floor(final_d_price);
		    		document.getElementById("mAllMileageSum-title").innerText =  Math.floor((final_final_price- final_d_price)*mile_ratio*0.01);
		    		document.getElementById("payment_total_order_sale_price_view").innerText =  final_final_price - final_d_price;
		    		document.getElementById("ec-shop-confirm_total_order_price_view").innerText =  final_final_price - final_d_price;
				});
 }
  function usemile() {
	  let user_mile = "${user_mile}";
	  let use_mile = document.getElementById("mile").value;
	 if(use_mile > user_mile){
		 alert("최대 사용가능 마일리지는"+user_mile+"원 입니다.");
	 }else{
		 final_d_price = parseInt(final_d_price) + parseInt(use_mile);
		 document.getElementById("payment_total_order_sale_price_view").innerText =  final_final_price - final_d_price;
 		 document.getElementById("ec-shop-confirm_total_order_price_view").innerText =  final_final_price - final_d_price;
	 }
 }



</script>
</body>
</html>