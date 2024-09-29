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
<title>Insert title here</title>

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

<jsp:include page="/layout/base.jsp"/>
<!-- 좌측 디자인(메인) -->
<!--@css(/_wg/css/left_main.css)-->
<link rel="stylesheet" href="/shop/layout/left_main/css/left_main.css"/>

<!--@css(/_wg/css/menupackage.css)-->
<link rel="stylesheet" href="/shop/product/css/menupackage.css"/>
</head>
<style>
	/* 모달 스타일 */
	.modal {
	    display: none; 
	    position: fixed; 
	    z-index: 100; 
	    left: 0;
	    top: 0;
	    width: 100%; 
	    height: 100%; 
	    overflow: auto; 
	    background-color: rgba(0,0,0,0); /* 배경을 반투명하게 설정 */
	    padding-top: 60px;
	}
	
	.modal-content {
	    background-color: #fff; /* 콘텐츠 배경을 불투명한 흰색으로 설정 */
	    margin: auto;
	    border: 1px solid #888;
	    width: 40%;
	    position: fixed;
	    top: 50%;
	    left: 50%;
	    transform: translate(-50%, -50%); /* 화면 중앙에 고정 */
	    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
	    opacity: 1; /* 투명도 제거 */
	}
	.contents {
		padding: 10px;
	}
	.close {
	    color: #aaa;
	    float: right;
	    font-size: 28px;
	    font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	    color: black;
	    text-decoration: none;
	    cursor: pointer;
	}
.header {
    background-color: #f4f4f4;
    padding: 10px;
    border-bottom: 1px solid #ddd;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.header h1 {
    margin: 0;
    font-size: 18px;
}
</style>
<body>
<%
	CategoryVO cvo = (CategoryVO)request.getAttribute("nowcate");
	Paging pvo = (Paging)request.getAttribute("page");
	String orderby = null;
	Object obj = session.getAttribute("orderby");
	if (obj != null){
		orderby = (String)obj;
	}
	String prevPage = "Controller?type=product&category="+cvo.getCategory_key()+"&depth="+request.getParameter("depth")+"&cPage="+pvo.getNowPage()+"&orderby="+orderby;
	session.setAttribute("prevPage", prevPage);
%>
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
				        <li><a href="Controller?type=product&category=${requestScope.cate1.category_key}&depth=1&cPage=1&orderby=${sessionScope.orderby}">${requestScope.cate1.category_name}</a></li>
				        <li><a href="Controller?type=product&category=${requestScope.cate2.category_key}&depth=2&cPage=1&orderby=${sessionScope.orderby}">${requestScope.cate2.category_name}</a></li>
				        <li><a href="Controller?type=product&category=${requestScope.cate3.category_key}&depth=3&cPage=1&orderby=${sessionScope.orderby}">${requestScope.cate3.category_name}</a></li>
			        </ol>
				</div>
				<!-- 제목(현재 카테고리) -->
				<div class="xans-element- xans-product xans-product-headcategory titleArea">
					<h2>${requestScope.nowcate.category_name}</h2>
				</div>
				<!-- 하위 카테고리명&개수 -->
				<ul class="menuCategory p0202">
				<c:if test="${requestScope.cate3 ne null}">
					<c:forEach var="down_cate" items="${requestScope.cate2.category_list}">
			       		<li class="{$selected} dm2 li">
				            <a href="Controller?type=product&category=${down_cate.category_key}&depth=3&cPage=1&orderby=${sessionScope.orderby}">${down_cate.category_name}
			            	</a>
				        </li>
					</c:forEach>
				</c:if>
				<c:if test="${requestScope.cate3 eq null}">
					<c:forEach var="down_cate" items="${requestScope.nowcate.category_list}">
			       		<li class="{$selected} dm2 li">
				            <a href="Controller?type=product&category=${down_cate.category_key}&depth=${param.depth+1}&cPage=1&orderby=${sessionScope.orderby}">${down_cate.category_name}
			            	</a>
				        </li>
					</c:forEach>
				</c:if>
			    </ul>
			</div>
			<div class="divClear"></div>
			<div class="xans-element- xans-product xans-product-normalpackage">
				<div id="Product_ListMenu" class="anchor"></div>
				<div id="Product_ListMenu" class="xans-element- xans-product xans-product-normalmenu ">
					<div class="function">
						<!-- 상품수 -->
          				<p class="prdCount"><strong>${requestScope.page.totalRecord}</strong> ITEMS</p>
          				<!-- 상품정렬 -->
		          		<select id="selArray" name="selArray" class="xans-element- xans-product xans-product-orderby">
		          		<c:if test="${sessionScope.orderby eq null}">
		          			<option selected value="Controller?type=product&category=${nowcate.category_key}&cPage=1&depth=${requestScope.depth}" class="xans-record-">신상품</option>
		          		</c:if>
		          		<c:if test="${sessionScope.orderby ne null}">
		          			<option value="Controller?type=product&category=${nowcate.category_key}&cPage=1&depth=${requestScope.depth}" class="xans-record-">신상품</option>
		          		</c:if>
		          		<c:if test="${sessionScope.orderby eq 1}">
							<option selected value="Controller?type=product&category=${nowcate.category_key}&orderby=1&cPage=1&depth=${requestScope.depth}" class="xans-record-">상품명</option>
		          		</c:if>
		          		<c:if test="${sessionScope.orderby ne 1}">
							<option value="Controller?type=product&category=${nowcate.category_key}&orderby=1&cPage=1&depth=${requestScope.depth}" class="xans-record-">상품명</option>
		          		</c:if>
		          		<c:if test="${sessionScope.orderby eq 2}">
							<option selected value="Controller?type=product&category=${nowcate.category_key}&orderby=2&cPage=1&depth=${requestScope.depth}" class="xans-record-">낮은가격</option>
		          		</c:if>
		          		<c:if test="${sessionScope.orderby ne 2}">
							<option value="Controller?type=product&category=${nowcate.category_key}&orderby=2&cPage=1&depth=${requestScope.depth}" class="xans-record-">낮은가격</option>
		          		</c:if>
		          		<c:if test="${sessionScope.orderby eq 3}">
							<option selected value="Controller?type=product&category=${nowcate.category_key}&orderby=3&cPage=1&depth=${requestScope.depth}" class="xans-record-">높은가격</option>
		          		</c:if>
		          		<c:if test="${sessionScope.orderby ne 3}">
							<option value="Controller?type=product&category=${nowcate.category_key}&orderby=3&cPage=1&depth=${requestScope.depth}" class="xans-record-">높은가격</option>
		          		</c:if>
		          		<c:if test="${sessionScope.orderby eq 4}">
							<option value="Controller?type=product&category=${nowcate.category_key}&orderby=4&cPage=1&depth=${requestScope.depth}" class="xans-record-">사용후기</option>
		          		</c:if>
		          		<c:if test="${sessionScope.orderby ne 4}">
							<option value="Controller?type=product&category=${nowcate.category_key}&orderby=4&cPage=1&depth=${requestScope.depth}" class="xans-record-">사용후기</option>
		          		</c:if>
						</select>
			        </div>
				</div>
				<div class="xans-element- xans-product xans-product-listnormal ec-base-product normal">
					<ul class="prdList grid4">
					<!-- 상품 뿌리기 -->
					<c:forEach var="menu" items="${requestScope.product_list}">
						<li id="anchorBoxId_606" data-price="${menu.cell_price}" class="item DB_rate xans-record-"  data-name="${menu.prod_name}" data-img="${menu.img_url}" data-option='${menu.optionListJson}'>
							<!-- 상품 이미지 -->
							<div class="thumbnail">
								<!-- 상품 hover 왼쪽 아래 메뉴 -->
						        <div class="list_button -mov">
						        	<!-- 장바구니 -->
						            <span class="basket">
						            	<img src="/shop/product/img/icon_202305201655559500.png" alt="장바구니 담기" class="ec-admin-icon cart open">
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
			<div class="ec-base-paginate">
			    <a href="Controller?type=product&category=${nowcate.category_key}&depth=${param.depth}&cPage=1&orderby=${sessionScope.orderby}" class="first"></a>
		    	<c:if test="${page.getStartPage() < page.getPagePerBlock()}">
					<a href="#">
						<img src="/shop/product/img/btn_page_prev.png" alt="이전 페이지"/>
					</a>
				</c:if>
				<c:if test="${page.getStartPage() >= page.getPagePerBlock()}">
					<a href="Controller?type=product&category=${nowcate.category_key}&depth=${param.depth}&cPage=${page.getNowPage()-page.getPagePerBlock()}&orderby=${sessionScope.orderby}">
						<img src="/shop/product/img/btn_page_prev.png" alt="이전 페이지"/>
					</a>
				</c:if>
			    <ol>
					<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" varStatus="idx">
						<c:if test="${page.getNowPage() eq idx.index}">
							<li class="now">
								<a href="Controller?type=product&category=${nowcate.category_key}&depth=${param.depth}&cPage=${idx.index}&orderby=${sessionScope.orderby}" class="this">${idx.index}</a>
							</li>
						</c:if>
						<c:if test="${page.getNowPage() ne idx.index}">
							<li>
								<a href="Controller?type=product&category=${nowcate.category_key}&depth=${param.depth}&cPage=${idx.index}&orderby=${sessionScope.orderby}" class="other">${idx.index}</a>
							</li>
						</c:if>
					</c:forEach>
                </ol>				
				<c:if test="${page.getEndPage() < page.getTotalPage()}">
					<a href="Controller?type=product&category=${nowcate.category_key}&depth=${param.depth}&cPage=${page.getNowPage()+page.getPagePerBlock()}&orderby=${sessionScope.orderby}">
						<img src="/shop/product/img/btn_page_next.png" alt="다음 페이지"/>
					</a>									
				</c:if>
				<c:if test="${page.getEndPage() >= page.getTotalPage()}">
					<a href="#">
						<img src="/shop/product/img/btn_page_next.png" alt="다음 페이지"/>
					</a>
				</c:if>
			    <a href="Controller?type=product&category=${nowcate.category_key}&depth=${param.depth}&cPage=${page.totalPage}&orderby=${sessionScope.orderby}" class="last">
			    	<img src="/shop/product/img/btn_page_last.png" alt="마지막 페이지"/>
		    	</a>
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

<!-- 모달 다이얼로그 -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <div class="header">
            <h1>옵션 선택</h1>
            <a id="close" class="close"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close.gif" alt="닫기" />&times;</a>
            
        </div>
        
        <div class="contents">
            <div class="option-section">
        		<div id="modal-products"><!-- 여기에 js로 상품칸 추가합니당 --></div><hr/>
            </div>
            <!-- 선택한 옵션창 -->
			<div style="display:block;" id="option_products_div" class="{$total.total_display|display}">
			                        <p class="ec-base-help txtWarn txt11 mTxt {$several_item_display|display}"> 위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다.</p>
			                       <table border="1" summary="">
			                           <caption>상품 목록</caption>
			                           <colgroup>
			                               <col>
			                               <col>
			                               <col>
			                           </colgroup>
			                           <thead>
			                               <tr>
			                                   <th style="padding:10px;" scope="col">상품명</th>
			                                   <th style="padding:10px;" scope="col">옵션명</th>
			                                   <th style="padding:10px;" scope="col">수량</th>
			                                   <th style="padding:10px;" scope="col">개당 가격</th>
			                               </tr>
			                           </thead>
			                           <!-- 옵션선택 또는 세트상품 선택시 상품이 추가되는 영역입니다. 쇼핑몰 화면에는 아래와 같은 마크업구조로 표시됩니다. 삭제시 기능이 정상동작 하지 않습니다. -->
			                           <tbody class="option_products">
			                            	
			                           </tbody>
			                       </table>
			</div>
            <div style="padding:20px;" id="total_amount" class="total_amount"><!-- 여기에 js로 수량 추가합니당 --></div>
            <div class="ec-base-button" module="product_action">
                <a href="#" onclick="sendOrder()" class="btnSubmitFix sizeS"><span id="btn_buy">바로구매하기</span></a>
                <a href="#" onclick="addBasket()"  class="btnNormalFix sizeS">장바구니 담기</a>
            </div>
        </div>
    </div>
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
	
	// 모달 다이얼로그 열기
    $(".open").on("click", function() {
    	$(".total_amount").empty();
    	$(".option_products").empty();
        const modal = document.getElementById("myModal");
        const modalProducts = document.getElementById("modal-products");
        modalProducts.innerHTML = ''; // 이전 내용 삭제

        // 선택된 상품 가져오기
        const productItem = $(this).closest("li");

        // 선택된 요소들을 모달에 추가하기
        productItem.each(function() {
            const name = $(this).data('name');
            let img = $(this).data('img');
            let price = $(this).data('price');
            let optionJson = $(this).attr('data-option'); // JSON 문자열로 가져오기
            
         	// JSON 문자열을 객체로 변환
            let options;
            try {
                options = JSON.parse(optionJson);
            } catch (e) {
                console.error('Invalid JSON:', optionJson);
                options = [];
            }
            
            // 새로운 div 요소 생성
            const productDiv = document.createElement('div');
            productDiv.classList.add('product');
			
         	// 옵션 HTML 생성
            let optionHtml = '<option value="" disabled selected>[필수] 옵션을 선택해 주세요</option>';
            if (Array.isArray(options)) {
                options.forEach(function(opt) {
                    const displayText  = ``+opt.size+` - `+opt.color+``;
                    
                    optionHtml += `<option value="`+opt.option_key+`" data-size="`+opt.size+`" data-color="`+opt.color+`" data-prod_stock="`+opt.prod_stock+`" >`+displayText+`</option>`;
                });
            }
            
            const productHtml = `
                <div>
                    <h2 style="margin: 5px;" class="name"><strong>`+name+`</strong></h2>
                    <div style="display: flex;" class="productNormal">
                        <div style="width: 100px; height: 100px;" class="imgArea" module="product_image">
                            <img width="100px" height="100px" src="`+img+`" />
                        </div>
                        <table border="1" summary="" module="product_option">
                            <colgroup>
                                <col width="120px" />
                                <col width="auto" />
                            </colgroup>
                            <tbody module="product_option">
	                            <tr style="line-height: 10px;">
		                        	<th style="padding-top:30px;" scope="row">옵션</th>
		                        	<td style="padding-top:22px;">
		                        		<div class="option-select">
		                        			<select class="option" required>
		                        				`+optionHtml+`
		                        			</select>
		                    			</div>
		                        	</td>
		                		</tr>
		                		<tr style="line-height: 10px;">
		                			<th style="padding-bottom:15px" scope="row">가격</th>
		                			<td style="padding-bottom:15px;"><p class="product-price" data-price="`+price+`">`+price+`원</p></td>
		                		</tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            `;
            productDiv.innerHTML = productHtml;

            // 완성된 productDiv를 modal-products에 추가
            modalProducts.appendChild(productDiv);
        });

        $('body').off('click', '.qty.up').on('click', '.qty.up', function() {
            let input = $(this).siblings("input[type='text']");
            let currentVal = parseInt(input.val());
            let selectedOption = $(this).closest('tr').find('.hidden_option').val();
            let prod_stock = $(`option[value='`+selectedOption+`']`).data('prod_stock');

            if(currentVal == prod_stock){
                alert("최대 구매가능 수량입니다.")
                
                return ; 
            }
                input.val(currentVal + 1);
                updateTotalAmount();
                
                
        });

        $('body').off('click', '.qty.down').on('click', '.qty.down', function() {
            let input = $(this).siblings("input[type='text']");
            let currentVal = parseInt(input.val());
  
            if (currentVal > 1) {
                input.val(currentVal - 1);
                updateTotalAmount();
            }
        });
        
     	// 수량 입력 필드 변경 이벤트
        $(".qty-input").on("input", function() {
            updateTotalAmount();
        });
        
        modal.style.display = "block";
        updateTotalAmount();
    });
 
    // 모달 다이얼로그 닫기
    $("#close").on("click", function() {
    	const modal = document.getElementById("myModal");
        modal.style.display = "none";
        $(".option_products").empty();
        $(".total_amount").empty();
    });

    // 모달 다이얼로그 바깥 클릭 시 창 닫기
    window.onclick = function(event) {
    	const modal = document.getElementById("myModal");
        if (event.target == modal) {
            modal.style.display = "none";
            $(".option_products").empty();
            $(".total_amount").empty();
        }
    }
    
  //옵션 디브 보이깅1
    $(document).on('change', '.option', function() {
        selectedOptionElement = $(this).find('option:selected');
        let selectedOption = selectedOptionElement.val();

        let productName = $(this).closest('.product').find('.name').text();
        let qty = $(this).closest('.product').find('.qty-input').val(); 
        let productPrice = $(this).closest('.product').find('.product-price').text();
        
        let size = selectedOptionElement.data('size');
        let color = selectedOptionElement.data('color');
        
        addProductToTotal(qty, selectedOption, productName, productPrice, size, color);
    });
})

$(document).on("click", ".del_option", function(e) {
    e.preventDefault();  // 기본 동작을 막습니다.
    let tr = $(this).closest("tr");
    tr.remove();
    updateTotalAmount();  // 삭제 후 총 금액과 수량을 업데이트합니다.
});

//상품을 totalProducts에 추가하는 함수
function addProductToTotal(qty,option, name, price, size, color) {
//     $("#option_products_div").css("display", "block");
    let existingOptions = $(".hidden_option").map(function() {
        return $(this).val();
    }).get();

    if (existingOptions.includes(option)) {
        alert("이미 선택된 옵션입니다.");
        return;
    }

    // 옵션이 선택되지 않은 경우 경고창 표시
    if (!option || option.trim() === "") {
        alert("옵션을 선택하세요.");
        return;
    }
    
    let productHtml = `
        <tr class="product" data-qty="`+qty+`" data-price="`+price+`">
    		<input class="hidden_option" type="hidden" value="`+option+`" />
    		<input class="hidden_qty" type="hidden" value="`+qty+`" />
            <td style="text-align:center; padding:20px; ">`+name+`</td>
            <td style="text-align:center; padding:20px; ">`+size+`-`+color+`</td>              	
            <td style="text-align:center; padding:20px 40px 20px 40px; ">
                <div class="qty">
                    <button type="button" class="qty down"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"/></button>
                    <input type="text" value="1" min="1" class="qty-input" id="qty" style="width: 50px; text-align: center;" />
                    <button type="button" class="qty up"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"/></button>
                </div>
            </td>
            <td style="text-align:center; padding:20px;">`+price+`</td>
            <td style="text-align:center; padding:20px;"><a href="" class="del_option">X</a></td>      
        </tr>
    `;
    
    $(".option_products").append(productHtml);
    updateTotalAmount();
   
}

function addBasket() {
    // 로그인 확인
    if ($("#u_idx").val() == null || $("#u_idx").val().trim() == '') {
        alert("로그인 후 이용하세요.");
        return;
    }

    let items = document.querySelectorAll('.option_products .product');
    
  
    // 선택된 옵션이 없는 경우 경고창 표시
    if (items.length === 0) {
        alert("옵션을 선택하세요.");
        return;
    }

    items.forEach(function(item) {
        let optionKey = item.querySelector('.hidden_option').value;
        console.log(optionKey);
        let b_qty = item.querySelector('.qty-input').value;
        console.log(b_qty);
        $.ajax({
            url: "/shop/product/basketIO.jsp",
            type: "post",
            data: {
                "u_idx": encodeURIComponent($("#u_idx").val()),
                "option_key": encodeURIComponent(optionKey),
                "b_qty": encodeURIComponent(b_qty),
            },
        }).done(function(data) {
            // 추가 작업
            location.replace("Controller?type=basket&user_id=${sessionScope.user_vo.id}");
            
        });
    });

    alert("장바구니에 추가되었습니다.");
    $('.option_products').empty();
    total = 0;
   
}

//총 상품금액 업데이트 함수
function updateTotalAmount() {
    let totalAmount = 0;
    let totalQuantity = 0;

    $(".option_products .product").each(function() {
        let price = parseFloat($(this).data("price"));
        let quantity = parseInt($(this).find(".qty-input").val());
        totalAmount += price * quantity;
        totalQuantity += quantity;
    });

    $(".total_amount").html('<strong>총 상품금액</strong>(수량) : <span class="total-cnt"><strong><em>' + totalAmount.toLocaleString() + '원</em></strong> (' + totalQuantity + '개)</span>');
}

function sendOrder() {
	let optionKeys = [];
    let b_qtys = [];
    let u_idx = document.getElementById("u_idx").value;
	let items = document.querySelectorAll('.option_products .product');
	items.forEach(function(item) {
		        let optionKey = item.querySelector('.hidden_option').value;
		        let b_qty = item.querySelector('.qty-input').value;
		        optionKeys.push(optionKey);
		        b_qtys.push(b_qty);
		    });
	let newUrl = 'Controller?type=orderpage&u_idx='+u_idx+'&option_keys='+optionKeys.join(",")+'&b_qtys='+b_qtys.join(",");
	location.replace(newUrl);
}
</script>	
</body>
</html>
