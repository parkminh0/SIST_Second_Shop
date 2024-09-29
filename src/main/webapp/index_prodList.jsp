<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="listType" value="<%=listType %>" />

<c:choose>
	<c:when test="${listType == 'newRec' }">
		<c:set var="show_list" value="${requestScope.nr_list}" />
	</c:when>
	<c:when test="${listType == 'new' }">
		<c:set var="show_list" value="${requestScope.n_list}" />
	</c:when>
	<c:when test="${listType == 'rec' }">
		<c:set var="show_list" value="${requestScope.r_list}" />
	</c:when>
	<c:when test="${listType == 'basket' }">
		<c:set var="show_list" value="${requestScope.bs_list}" />
	</c:when>
	<c:when test="${listType == 'interest' }">
		<c:set var="show_list" value="${requestScope.in_list}" />
	</c:when>
</c:choose>

 <c:forEach var="menu" items="${show_list}">
	<li id="anchorBoxId_606" data-price="48300^48300" class="item DB_rate xans-record-">
		<!-- 상품 이미지 -->
		<div class="thumbnail">
			<!-- 상품 hover 왼쪽 아래 메뉴 -->
	        <div class="list_button -mov">
	            <!-- 관심상품 -->
	            <span class="wish">
	            	<c:if test="${sessionScope.user_vo eq null}">
		            	<img name="interest_img" src="/shop/product/img/before_interest.png" class="icon_img ec-product-listwishicon" alt="${menu.product_key}">
	            	</c:if>
	            	<c:if test="${sessionScope.user_vo ne null}">
	            		<c:set var="chk_interest" value="0"/>
	            		<c:forEach var="interest" items="${sessionScope.user_vo.interest_list}">
							<c:if test="${interest.product_key eq menu.product_key}">
								<c:set var="chk_interest" value="1"/>
							</c:if>						           		
	           			</c:forEach>
	           			<c:if test="${chk_interest eq 0}">
			            	<img name="interest_img" src="/shop/product/img/before_interest.png" class="icon_img ec-product-listwishicon" alt="${menu.product_key}">
	           			</c:if>
	           			<c:if test="${chk_interest eq 1}">
			            	<img name="interest_img" src="/shop/product/img/after_interest.png" class="icon_img ec-product-listwishicon" alt="${menu.product_key}">
	           			</c:if>
	            	</c:if>
	           	</span>
	        </div>
	        <a href="Controller?type=detail&product=${menu.product_key}">
	            <div class="normal_thumb">
	                <img src="${menu.img_url}" class="off" alt="${menu.alt_text}">
	                &nbsp;
	               </div>
	        </a>
	    </div>
	    <!-- 상품 정보 -->
	    <div class="description">
	    	<!-- 상품명 -->
	        <p class="name">
	            <a href="Controller?type=detail&product=${menu.product_key}" class="">
	            	<span id="ellipsis" style="font-size:13px;color:#555555;font-weight:bold;">${menu.prod_name}</span>
	           	</a>
	           </p>
			<div class="line -mov"></div>
	        <!-- 상세 정보 -->
	        <ul class="xans-element- xans-product xans-product-listitem spec"><li class=" xans-record-">
	        	<!-- 가격 -->
				<li class=" xans-record-">
					<span style="font-size:14px;color:#333333;font-weight:bold;">
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${menu.cell_price}" />
					</span>
				</li>
				<li class=" xans-record-">
					<strong class="title "><span style="font-size:12px;color:#555555;">리뷰</span> :</strong> 
					<span style="font-size:12px;color:#555555;">0</span>
					</li>
				</ul>
		    </div>
	</li>
</c:forEach>
