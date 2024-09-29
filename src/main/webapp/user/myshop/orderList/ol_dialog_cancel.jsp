<%@page import="vo.OrderDetailVO"%>
<%@page import="vo.OrderVO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="order_key" value="${param.order_key }" />
<c:set var="od_key" value="${param.od_key }" />

<c:set var="opvo" value="${odvo.getOpvo() }" />
<c:set var="pdvo" value="${opvo.getPvo() }" />


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

<style>
	/* 모달 스타일 */
	.modalCc${Cc_idx} {
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
   
.qty img{
	width: 30px;
}
   
</style>
<div data-name="${opvo.getProduct_name()}" data-img="${opvo.getImg_url()}" data-qty="${odvo.getOd_changed_qty()}" data-price="${pdvo.getCell_price()*odvo.getOd_changed_qty()}" data-option='${opvo.size} ${opvo.color}'>
	<a href="#none" class="btnNormal updateOd cancel${Cc_idx }">취소신청</a>
</div>
<!-- 모달 다이얼로그 -->
<div id="myModalCancel${Cc_idx}" class="modalCc${Cc_idx}">
    <div class="modal-content">
        <div class="header">
            <h1>상품 취소 신청</h1>
            <a id="closeCc${Cc_idx}" class="close"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close.gif" alt="닫기" />&times;</a>
            
        </div>
        
        <div class="contents">
            <div class="option-section">
        		<div id="modal-products-${Cc_idx}">
					<div class="product">
                    <h2 style="margin: 5px;" class="name"><strong>${opvo.getProduct_name()}</strong></h2>
                    <div style="display: flex;" class="productNormal">
                        <div style="width: 100px; height: 100px;" class="imgArea" module="product_image">
                            <img width="100px" height="100px" src="${opvo.getImg_url()}" />
                        </div>
                        <table border="1" summary="" module="product_option">
                            <colgroup>
                                <col width="120px" />
                                <col width="auto" />
                            </colgroup>
                            <tbody module="product_option">
	                            <tr style="line-height: 10px;">
		                            <th style="padding-top:15px;" scope="row">옵션</th>
		                            <td style="padding-top:22px;">
		                            	<div class="option-select">
		                            		<p>${opvo.size} ${opvo.color}</p>
		                        		</div>
		                            </td>
	                        	</tr>
	                    		<tr style="line-height: 10px;">
	                    			<th style="padding-bottom:15px" scope="row">수량</th>
	                    			<td style="padding-bottom:15px;"><p class="product-price" data-qty="${odvo.getOd_changed_qty()}">${odvo.getOd_changed_qty()}개</p></td>
	                    		</tr>
	                    		<tr style="line-height: 10px;">
                    			<th style="padding-bottom:15px" scope="row">가격</th>
                    			<td style="padding-bottom:15px;"><p class="product-price" data-price="${pdvo.getCell_price()*odvo.getOd_changed_qty()}">${pdvo.getCell_price()*odvo.getOd_changed_qty()}원</p></td>
                    		</tr>
                            </tbody>
                        </table>
                    </div>
                </div>
				</div>
            </div>
            <hr/>
			<div style="display:block;" id="option_products_divCc${Cc_idx}" class="{$total.total_display|display}">
				<table>
					<tbody class="option_products cancel">
						<tr class="product" data-qty="${odvo.getOd_changed_qty()}">
				            <input class="hidden_qty" type="hidden" value="${odvo.getOd_changed_qty()}" />
				            <td style="text-align:center; padding:20px 40px 20px 40px; ">
					            <div class="qty_Cc${Cc_idx}" >
								    <button type="button" class="cancel qty down"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"/></button>
								    <input type="text" data-max="${odvo.getOd_changed_qty()}" value="1" min="1" class="qty-input" id="qty_input_Cc${Cc_idx}" readonly style="width: 50px; text-align: center;" />
								    <button type="button" class="cancel qty up"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"/></button>
								</div>
							</td>
				        </tr>
		            </tbody>
	            </table>
			</div>
            <div style="padding:20px;" id="total_amount_Cc${Cc_idx}" class="total_amount"><!-- 여기에 js로 수량 추가합니당 --></div>
            <div style="padding:20px;" class="total_amount">
            취소 사유: 
            <input id="Cc_msg_${Cc_idx}" type="text" placeholder="사유 입력" />
            </div>
            <div class="ec-base-button" module="product_action">
                <a href="#none" onclick="odCancel${Cc_idx}()"class="btnSubmitFix sizeS"><span id="btn_buy">상품 취소</span></a>
                <a href="#none" onclick="closeModalCc${Cc_idx}()" class="btnNormalFix sizeS">닫기</a>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
    
 	
 	// 모달 다이얼로그 열기
    $(".updateOd.cancel${Cc_idx}").on("click", function() { 

        const modal = document.getElementById("myModalCancel${Cc_idx}");

        const div = $(this).closest("div");

        $("#qty_input_Cc${Cc_idx}").val(1);

        $('.modalCc${Cc_idx}').off('click', '.qty_Cc${Cc_idx} .cancel.qty.up').on('click', '.qty_Cc${Cc_idx} .cancel.qty.up', function() {
        	let input = $(this).siblings("input[type='text']");
            let currentVal = parseInt(input.val());
            let prod_stock = input.data("max");

            if(currentVal >= prod_stock){
                alert("취소가능 수량은 기존 주문량을 넘을 수 없습니다.");
                input.val(prod_stock);
                return ; 
            } else {
                input.val(currentVal + 1);
                updateTotalAmountCc${Cc_idx}();
            }
        });

        $('.modalCc${Cc_idx}').off('click', '.qty_Cc${Cc_idx} .cancel.qty.down').on('click', '.qty_Cc${Cc_idx} .cancel.qty.down', function() {
            let input = $(this).siblings("input[type='text']");
            let currentVal = parseInt(input.val());
            if (currentVal > 1) {
                input.val(currentVal - 1);
                updateTotalAmountCc${Cc_idx}();
            }
        });
        
        modal.style.display = "block";
        updateTotalAmountCc${Cc_idx}();
    });
 	
 	
 
    // 모달 다이얼로그 닫기
    $("#closeCc${Cc_idx}").on("click", function() {
    	const modal = document.getElementById("myModalCancel${Cc_idx}");
        modal.style.display = "none";
    });

});


//총 상품금액 업데이트 함수
function updateTotalAmountCc${Cc_idx}() {
	let totalPrice = 0;
    let totalQuantity = 0;
    $("#option_products_divCc${Cc_idx} .option_products.cancel .product").each(function() {
        
        let quantity = parseInt($(this).find("#qty_input_Cc${Cc_idx}").val());

        totalPrice += ${pdvo.getCell_price()}*(${odvo.getOd_changed_qty()} - quantity);
        totalQuantity += quantity;
    });

    
    $("#total_amount_Cc${Cc_idx}").html('<strong>변경후 상품금액</strong>(수량) : <span class="total-cnt"><strong><em>' + totalPrice.toLocaleString() + '원</em></strong> (' + totalQuantity + '개)</span>');
}


function odCancel${Cc_idx}(){
	if(confirm("해당 상품을 취소하시겠습니까?")){
		if(confirm("취소 시 번복이 불가합니다.\r\n취소를 진행하시겠습니까?")){
			
			let qty = $("#qty_input_Cc${Cc_idx}").val();
			let msg = $("#Cc_msg_${Cc_idx}").val();
			
			$.ajax({
				url:"/shop/user/myshop/orderList/updateIO.jsp",
				type:"post",
				data: {
					"type": "cancel",
					"order_key": ${odvo.getOrder_key()},
					"od_key": ${odvo.getOd_key()},
					"product_key" : ${odvo.getOpvo().getProduct_key()},
					"option_key" : ${odvo.getOption_key()},
					"cell_price": ${pdvo.getCell_price()},
					"qty": qty,
					"os_msg":msg,
				},
			}).done(function(data) {
				location.reload();
			});
		}
	}
}

function closeModalCc${Cc_idx}(){
	const modal = document.getElementById("myModalCancel${Cc_idx}");
    modal.style.display = "none";
}
</script>

