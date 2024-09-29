<%@page import="util.Paging"%>
<%@page import="vo.CategoryVO"%>
<%@page import="vo.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품검색</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- PG크로스브라우징필수내용 -->
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
<!-- // PG크로스브라우징필수내용 -->

<link rel="stylesheet" href="/shop/layout/css/common.css"/>
   <!-- <link rel="stylesheet" href="/shop/layout/css/layout.css"/> 사용안함 -->
<!-- <link rel="stylesheet" href="/shop/layout/css/xeicon.css"/> -->
<link rel="stylesheet" href="/shop/layout/css/ec-base-ui.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-tooltip.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-help.css"/><!-- 
<link rel="stylesheet" href="/shop/layout/css/ec-base-product.css"/> -->
<link rel="stylesheet" href="/shop/layout/css/ec-base-paginate.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-tab.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-button.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-box.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-table.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-desc.css"/>

<link rel="stylesheet" href="/shop/product/css/searchbar.css"/>

<jsp:include page="/layout/base.jsp"/>
<!-- 좌측 디자인(메인) -->
<!--@css(/_wg/css/left_main.css)-->
<link rel="stylesheet" href="/shop/layout/left_main/css/left_main.css"/>

<!--@css(/_wg/css/menupackage.css)-->
<link rel="stylesheet" href="/shop/product/css/menupackage.css"/>
</head>
<body>
<c:set var="page" value="${requestScope.page }" />
<c:set var="keyword" value="${param.keyword }" />
<input type="hidden" id="u_idx" value="${sessionScope.user_vo.u_idx}"/>
<div id="wrap">
    <!-- 상단 디자인 -->
    <!--@import(/_wg/import/header.html)-->
    <jsp:include page="/layout/header/header.jsp"/>
	<div id="container" class="left">
	    <!-- 왼쪽 사이드 디자인 -->
		<jsp:include page="/layout/left_main/left_main.jsp"/>
	    <div id="contents" class="left">
	    	<!--  여기부터 콘텐츠 -->
	    	<div class="xans-element- xans-product xans-product-menupackage product_menupackage">
	    		<!-- 오른쪽 위 상단 -->
				<div class="xans-element- xans-product xans-product-headcategory path">
				    <span>현재 위치</span>
				    <ol>
				        <li><a href="Controller?type=index">홈</a></li>
				        <li><strong>상품검색</strong></li>
			        </ol>
				</div>
				<!-- 제목(현재 카테고리) -->
				<div class="xans-element- xans-product xans-product-headcategory titleArea">
					<h2>상품검색</h2>
				</div>
				<div class="xans-element- xans-product xans-product-searchdata xans-record-">
					<div class="searchField" id="ec-product-searchdata-searchkeyword_form">
						<fieldset>
							<legend>상품검색</legend>
				            <div class="searchInput">
				                 <input type="text" class="keyword" name="keyword" id="ec-product-searchdata-keyword" value="${keyword }" onkeyup="enter_pS()"/>
				                 <input type="image" id="ec-product-searchdata-submit_button" src="/shop/product/img/btn_search_b_100.png" alt="검색" class="btnSearch" onclick="javascript:search_pS()" />
							</div>
						</fieldset>
					</div>
				</div>
			</div>
			<div class="divClear"></div>
			<div class="xans-element- xans-product xans-product-normalpackage">
				<div id="Product_ListMenu" class="anchor"></div>
				<div id="Product_ListMenu" class="xans-element- xans-product xans-product-normalmenu ">
					<div class="function">
						<!-- 상품수 -->
          				<p class="prdCount"><strong>${requestScope.page.totalRecord}</strong> ITEMS</p>
			        </div>
				</div>
				<div class="xans-element- xans-product xans-product-listnormal ec-base-product normal">
					<ul class="prdList grid3">
					<!-- 상품 뿌리기 -->
					<c:forEach var="menu" items="${requestScope.product_list}">
						<li id="anchorBoxId_606" data-price="48300^48300" class="item DB_rate xans-record-">
							<!-- 상품 이미지 -->
							<div class="thumbnail">
								<!-- 상품 hover 왼쪽 아래 메뉴 -->
						        <div class="list_button -mov">
						        	<!-- 장바구니 -->
						            <span class="basket">
						            	<img src="/shop/product/img/icon_202305201655559500.png" onclick="" alt="장바구니 담기" class="ec-admin-icon cart">
					            	</span>
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
						            	<span style="font-size:13px;color:#555555;font-weight:bold;">${menu.prod_name}</span>
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
					</ul>
				</div>
			</div>
			<c:set var="page" value="${requestScope.page}"/>
			<div class="xans-element- xans-product xans-product-normalpaging ec-base-paginate">
		    	<c:if test="${page.getNowPage() <= page.getPagePerBlock()}">
					<a href="#">
			    		<img src="/shop/product/img/btn_page_first.png" alt="첫 페이지"/>
					</a>
				</c:if>
		    	<c:if test="${page.getNowPage() > page.getPagePerBlock()}">
					<a href="Controller?type=searchProd&keyword=${keyword }&cPage=1" class="first">
			    		<img src="/shop/product/img/btn_page_first.png" alt="첫 페이지"/>
		    		</a>
				</c:if>
				
				<c:if test="${page.getStartPage() < page.getPagePerBlock() }">
					<a href="#" class="last page disabled">
							<img src="/shop/product/img/btn_page_prev.png" alt="이전 페이지"/>
					</a>
				</c:if>

				<c:if test="${page.getStartPage() >= page.getPagePerBlock() }">
					<c:if test="${page.getEndPage()%page.getPagePerBlock() == 0 }">
						<a href="Controller?type=searchProd&keyword=${keyword }&cPage=${page.getEndPage()-page.getPagePerBlock() }">
					</c:if>
					<c:if test="${page.getEndPage()%page.getPagePerBlock() != 0 }">
						<a href="Controller?type=searchProd&keyword=${keyword }&cPage=${page.getEndPage()-(page.getEndPage()%page.getPagePerBlock()) }">
					</c:if>
							<img src="/shop/product/img/btn_page_prev.png" alt="이전 페이지"/>
						</a>
				</c:if>
				
			    <ol>
					<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" varStatus="idx">
						<c:if test="${page.getNowPage() eq idx.index}">
							<li class="now">
								<a href="#" class="this">${idx.index}</a>
							</li>
						</c:if>
						<c:if test="${page.getNowPage() ne idx.index}">
							<li>
								<a href="Controller?type=searchProd&keyword=${keyword }&cPage=${idx.index}" class="other">${idx.index}</a>
							</li>
						</c:if>
					</c:forEach>
                </ol>
                
                
				<c:if test="${page.getEndPage() >= page.getTotalPage() }">
					<a href="#" class="last page disabled">
						<img src="/shop/product/img/btn_page_next.png" alt="다음 페이지"/>
					</a>
				</c:if>
				<c:if test="${page.getEndPage() < page.getTotalPage() }">
					<a href="Controller?type=searchProd&keyword=${keyword }&cPage=${page.getStartPage()+page.getPagePerBlock()}">
						<img src="/shop/product/img/btn_page_next.png" alt="다음 페이지"/>
					</a>
				</c:if>				
				
				
				<c:if test="${page.getTotalPage() == 0 || page.getNowPage() > page.getTotalPage() - (page.getTotalPage()%page.getPagePerBlock()) }">
					<a href="#" class="last page disabled">
						<img src="/shop/product/img/btn_page_last.png" alt="마지막 페이지"/>
					</a>
				</c:if>
				<c:if test="${page.getTotalPage() > 0 && page.getNowPage() <= page.getTotalPage()- (page.getTotalPage()%page.getPagePerBlock()) }">
					<a href="Controller?type=prodSearch&keyword=${keyword }&cPage=${page.getTotalPage()}" class="last">
						<img src="/shop/product/img/btn_page_last.png" alt="마지막 페이지"/>
			    	</a>
				</c:if>
			</div>
			<!-- 여기까지 -->
        </div>
    </div>
	<!-- 오른쪽 사이드 -->
	<jsp:include page="/layout/side/side.jsp"/>
	<!-- 하단 디자인 -->
    <!--@import(/_wg/import/footer.html)-->
    <jsp:include page="/layout/footer/footer.jsp"/>
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
	})
	
	function search_pS(){
		let keyword = $("#ec-product-searchdata-keyword").val().trim().replace(/^\s+|\s+|\s+$/g,"");
		if(keyword.length == 0 || keyword == ""){
			alert("검색어를 입력하세요.");
			$("#ec-product-searchdata-keyword").val("");
			$("#ec-product-searchdata-keyword").focus();
			return;
		}
		let viewpath = "Controller?type=searchProd&keyword="+keyword;
		location.href = viewpath;
		
	}
	function enter_pS(){

		if (window.event.keyCode == 13) {
			search_pS();
		}
	}
</script>	
</body>
</html>
