<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@page import="util.Paging"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>Insert title here</title>
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
/*tr 보더스타일 주기*/
.option_products tr.product {
        border-bottom: 1px solid #adb5bd;
        border-top: 1px solid #adb5bd;     
    }
   
</style>
<body>
<c:set var="p_list" value="${sessionScope.p_list }" />
<c:set var="uvo" value="${sessionScope.user_vo }" />
<input id="u_idx" type="hidden" value="${uvo.u_idx }">

<div id="wrap">
	<!--@layout(/layout/basic/layout.html)-->
	<jsp:include page="/layout/base.jsp"/>
		
	<!-- 상단 디자인 -->
    <!--@import(/_wg/import/header.html)-->
    <jsp:include page="/layout/header/header.jsp"/>
    
    <div id="container" class="left">
	    <!-- 왼쪽 사이드 디자인 -->
		<jsp:include page="/layout/login_side/login_side.jsp"/>
		
		<div id="contents" class="left">
		<!--@layout(/layout/basic/layout.html)-->
			<div class="path">
	    		<span>현재 위치</span>
	    		<ol>
			        <li><a href="Controller?type=index">홈</a></li>
			        <li><a href="Controller?type=mypage">마이쇼핑</a></li>
			        <li title="현재 위치"><strong>관심상품</strong></li>
	    		</ol>
			</div>
			<div class="titleArea"><h2>관심상품</h2></div>
			<div module="myshop_wishlist" class="ec-base-table typeList">
	    		<table border="1" id="t1" summary="" class="{$list_display|display}">
			        <caption>관심상품 목록</caption>
			        <colgroup>
			            <col style="width:27px;" />
			            <col style="width:92px" />
			            <col style="width:auto" />
			            <col style="width:120px" />
			            <col style="width:120px" />
			        </colgroup>
	        		<thead>
				        <tr>
				            <th scope="col"><input type="checkbox" id="sAgreeAllChecked" onclick="{$chk_wishlist}" /></th>
				            <th scope="col">이미지</th>
				            <th scope="col">상품정보</th>
				            <th scope="col">판매가</th>
				            <th scope="col">선택</th>
				        </tr>
			        </thead>
	        		<tbody class="center">
					<c:forEach var="wvo" items="${p_list}">
					    <tr data-name="${wvo.prod_name}" data-img="${wvo.img_url}" data-price="${wvo.cell_price}" data-option='${wvo.optionListJson}'>
					        <td><input type="checkbox" name="checker"></td>
					        <td class="thumb"><a href="Controller?type=detail&product=${wvo.product_key }"><img width="100px" height="100px" src="${wvo.img_url}"/></a></td>
					        <td class="left">
					            <input class="product_key" type="hidden" value="${wvo.product_key }">
					            <strong class="name">${wvo.prod_name}</strong>
					        </td>
					        <td class="price right"><strong class="{$discount}">${wvo.cell_price}원<br /></strong><br /></td>
					        <td class="button">
					            <a href="#none" class="btnNormal open_part">장바구니담기</a>
					            <a href="#none" class="btnNormal del_part" rel="{$rel_del}" ><i class="icoDelete"></i> 삭제</a>
					        </td>
					    </tr>
					</c:forEach>
			        </tbody>
				</table>
				<c:if test="${p_list.size() == 0 }">
			    	<p class="message {$empty_display|display}">관심상품 내역이 없습니다.</p>
			    </c:if>
			</div>
			<div module="Myshop_WishlistButton" class="ec-base-button">
			    <span class="gLeft">
			        <strong class="text">선택상품을</strong>
			        <a href="#none" class="btnNormal open">장바구니 담기</a>
			        <a href="#none" class="btnEm" onclick="delInter()"><i class="icoDelete"></i> 삭제하기</a>
			    </span>
			    <span class="gRight">
			        <a href="#none" class="btnEmFix sizeM" >관심상품 비우기</a>
			    </span>
			</div>
			
			<!-- 페이징 -->
			<c:set var="ivo" value="${sessionScope.ivo }"></c:set>
			<c:set var="page" value="${requestScope.page}"/>
			<div class="xans-element- xans-product xans-product-normalpaging ec-base-paginate">
			    <a href="Controller?type=interest&&cPage=1" class="first">
			    	<img src="/shop/product/img/btn_page_first.png" alt="첫 페이지"/>
		    	</a>
		    	<c:if test="${page.getStartPage() < page.getPagePerBlock()}">
					<a href="#">
						<img src="/shop/product/img/btn_page_prev.png" alt="이전 페이지"/>
					</a>
				</c:if>
				<c:if test="${page.getStartPage() >= page.getPagePerBlock()}">
					<a href="Controller?type=interest&cPage=${page.getNowPage()-page.getPagePerBlock()}">
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
								<a href="Controller?type=interest&cPage=${idx.index}" class="other">${idx.index}</a>
							</li>
						</c:if>
					</c:forEach>
                </ol>				
				<c:if test="${page.getEndPage() < page.getTotalPage()}">
					<a href="Controller?type=interest&cPage=${page.getNowPage()+page.getPagePerBlock()}">
						<img src="/shop/product/img/btn_page_next.png" alt="다음 페이지"/>
					</a>									
				</c:if>
				<c:if test="${page.getEndPage() >= page.getTotalPage()}">
					<a href="#">
						<img src="/shop/product/img/btn_page_next.png" alt="다음 페이지"/>
					</a>
				</c:if>
			    <a href="Controller?type=interest&cPage=${page.totalPage}" class="last">
			    	<img src="/shop/product/img/btn_page_last.png" alt="마지막 페이지"/>
		    	</a>
			</div>
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
                <a href="#none" onclick="sendOrder()" class="btnSubmitFix sizeS"><span id="btn_buy">바로구매하기</span></a>
                <a href="#none" onclick="addBasket()"  class="btnNormalFix sizeS">장바구니 담기</a>
            </div>
        </div>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
    // 전체 체크박스 체크
    $("#t1 thead input:checkbox").click(function() {
        let p = $(this).closest("th");
        let idx = $("#t1 thead tr th").index(p);
        let ar = $("#t1 tbody td:nth-child(" + (idx + 1) + ") input:checkbox");
        ar.prop("checked", this.checked);
    });

    // 밑에 있는 체크박스가 모두 선택되면 전체 체크박스 체크
    $("tbody input:checkbox").bind("click", function() {
        let ar = $("tbody").find(":checkbox");

        let chk = true;
        for (let i = 0; i < ar.length; i++) {
            if (!ar.eq(i).is(":checked")) {
                chk = false;
                break;
            }
        }
        $("#sAgreeAllChecked").prop("checked", chk);
    });

 	// 모달 다이얼로그 열기
    $(".open").on("click", function() {
    	$(".total_amount").empty();
    	$(".option_products").empty();
        const modal = document.getElementById("myModal");
        const modalProducts = document.getElementById("modal-products");
        modalProducts.innerHTML = ''; // 이전 내용 삭제

        // 선택된 체크박스 요소들을 가져오기
        const checkedItems = $("tbody input:checkbox:checked").closest("tr");

        // 선택된 요소들을 모달에 추가하기
        checkedItems.each(function() {
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
                    const displayText = ``+opt.size+` - `+opt.color+``;
                  
                    optionHtml += `<option value="`+opt.option_key+`" data-size="`+opt.size+`" data-color="`+opt.color+`" data-prod_stock="`+opt.prod_stock+`"  >`+displayText+`</option>`;

                });
            }
            
            const productHtml = `
                <div class="product">
                    <h2 style="margin: 5px;" class="name"><strong>`+name+`</strong></h2>
                    <div style="display: flex;" class="productNormal">
                        <div style="width: 100px; height: 100px;" class="imgArea" module="product_image">
                            <img class="pro_img" width="100px" height="100px" src="`+img+`" />
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
            let prod_stock = selectedOptionElement.data('prod_stock');

            if(currentVal == prod_stock){
                alert("최대 구매가능 수량입니다.")
                return ; 
            } else {
                input.val(currentVal + 1);
                updateTotalAmount();
            }
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
 	
 	// 모달 다이얼로그 열기
    $(".open_part").on("click", function() { 
    	$(".total_amount").empty();
    	$(".option_products").empty();
        const modal = document.getElementById("myModal");
        const modalProducts = document.getElementById("modal-products");
        modalProducts.innerHTML = ''; // 이전 내용 삭제

        // 선택된 체크박스 요소들을 가져오기
        const tr = $(this).closest("tr");

        // 선택된 요소들을 모달에 추가하기
        tr.each(function() {
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
                    const displayText = ``+opt.size+` - `+opt.color+``;
                    optionHtml += `<option id="ff" value="`+opt.option_key+`" data-size="`+opt.size+`" data-color="`+opt.color+`" data-prod_stock="`+opt.prod_stock+`" >`+displayText+`</option>`;
                });
            }
            
            const productHtml = `
                <div class="product">
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
            let prod_stock = selectedOptionElement.data('prod_stock');

            if(currentVal == prod_stock){
                alert("최대 구매가능 수량입니다.")
                return ; 
            } else {
                input.val(currentVal + 1);
                updateTotalAmount();
            }
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
    });

    // 모달 다이얼로그 바깥 클릭 시 창 닫기
    window.onclick = function(event) {
    	const modal = document.getElementById("myModal");
        if (event.target == modal) {
            modal.style.display = "none";
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

});

// 체크한 상품을 삭제하기 
function delInter() {
	let chk = confirm("선택한 상품을 관심상품에서 삭제하시겠습니까?");
	if (!chk)
		return;
	
    let chk_box = $("tbody input:checkbox:checked");  // 체크된 체크박스들 찾기
    let productKeys = [];

    chk_box.each(function() {
        let productKey = $(this).closest("tr").find(".product_key").val();  // 체크된 체크박스의 부모 tr에서 product_key 값 찾기
        console.log(productKey);
        productKeys.push(productKey);
    });

    productKeys.forEach(function(productKey) {
        $.ajax({
            url: "/shop/product/interestIO.jsp",  
            type: "post",
            data: { "product_key": productKey,  
                    "mode": "off" },
        }).done(function (data) {
            location.replace("Controller?type=interest");
        });
    });
}
//오른쪽 삭제 버튼
$(".del_part").click(function() { 
	let chk = confirm("해당 상품을 관심상품에서 삭제하시겠습니까?");
	if (!chk)
		return;
	
    let tr = $(this).closest("tr");
    
    let productKey = tr.find(".product_key").val();
    
    // AJAX 요청 보내기
    $.ajax({
        url: "/shop/product/interestIO.jsp",
        type: "post",
        data: { "product_key": productKey, "mode": "off" },
    }).done(function(data) {
        // 요청이 성공하면 해당 tr 요소를 삭제
        tr.remove();
    });
});

$(document).on("click", ".del_option", function(e) {
    e.preventDefault();  // 기본 동작을 막습니다.
    let tr = $(this).closest("tr");
    tr.remove();
    updateTotalAmount();  // 삭제 후 총 금액과 수량을 업데이트합니다.
});


$(".btnEmFix.sizeM").click(function() {
	let chk = confirm("모든 상품을 관심상품에서 삭제하시겠습니까?");
	if (!chk)
		return;
	
    let productKeys = [];

    // 모든 product_key 값을 가진 input:hidden 요소들을 찾기
    $("tbody input:hidden.product_key").each(function() {
        let productKey = $(this).val();
        productKeys.push(productKey);
    });

    if (productKeys.length == 0){
    	alert("삭제할 관심상품이 없습니다.");
    }
    // productKeys 배열을 순회하며 AJAX 요청 보내기
    productKeys.forEach(function(productKey) {
        $.ajax({
            url: "/shop/product/interestIO.jsp",
            type: "post",
            data: { "product_key": productKey, "mode": "off" },
        }).done(function(data) {
            // 요청이 성공하면 페이지 새로고침
            location.replace("Controller?type=interest");
        });
    }); 
});

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
        let b_qty = item.querySelector('.qty-input').value;
// 		console.log("option_key1: "+optionKey);
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

//상품을 totalProducts에 추가하는 함수
function addProductToTotal(qty, option, name, price, size, color) {
    // 이미 선택된 옵션인지 확인
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
        <tr class="product" data-qty="` + qty + `" data-price="` + price + `">
            <input class="hidden_option" type="hidden" value="` + option + `" />
            <input class="hidden_qty" type="hidden" value="` + qty + `" />
            <td style="text-align:center; padding:20px;">` + name + `</td>
            <td style="text-align:center; padding:20px; ">`+size+`-`+color+`</td>              	
            <td style="text-align:center; padding:20px 40px 20px 40px; ">
	            <div class="qty">
				    <button type="button" class="qty up"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"/></button>
				    <input type="text" value="1" min="1" class="qty-input" id="qty" style="width: 50px; text-align: center;" />
				    <button type="button" class="qty down"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"/></button>
				</div>
			</td>
            <td style="text-align:center; padding:20px;">` + price + `</td>
            <td style="text-align:center; padding:20px;"><a href="" class="del_option">X</a></td>
        </tr>
    `;

    $(".option_products").append(productHtml);
    updateTotalAmount();
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

