<%@page import="java.util.HashMap"%>
<%@page import="vo.OptionVO"%>
<%@page import="java.util.List"%>
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
	.modalEx${Ex_idx} {
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
	<a href="#none" class="btnNormal updateOd exchange${Ex_idx }">교환신청</a>
</div>
<!-- 모달 다이얼로그 -->
<div id="myModalExchange${Ex_idx}" class="modalEx${Ex_idx}">
    <div class="modal-content">
        <div class="header">
            <h1>상품 교환 신청</h1>
            <a id="closeEx${Ex_idx}" class="close"><img src="//img.echosting.cafe24.com/skin/base/common/btn_close.gif" alt="닫기" />&times;</a>
            
        </div>
        
        <div class="contents">
            <div class="option-section">
        		<div id="modal-products-${Ex_idx}">
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
		                            	<div class="option-info">
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
			<div style="display:block;" id="option_products_divEx${Ex_idx}" class="{$total.total_display|display}">
				<table>
					<tbody class="option_products exchange o_pEx${Ex_idx }">
						<tr style="text-align: center; line-height: 10px;">
                            <th style="padding-top:10px; text-align: center; border-right: none;">
                            	<div class="option-select" style="margin: 5px 20px; display: inline-block;">
                            	옵션 : 
                            		<select class="option opEx${Ex_idx}" required>
                            			<option value="-1" disabled selected>[필수] 옵션을 선택해 주세요</option>
                            			<c:forEach var="op_vo" items="${pdvo.getOption_list() }" >
                            			<c:if test="${opvo.getOption_key() != op_vo.getOption_key() }">
                            				<c:if test="${op_vo.getProd_stock() gt 0}">
                            					<option class="opEx${Ex_idx}" value="${op_vo.getOption_key() }" data-size="${op_vo.getSize() }" data-color="${op_vo.getColor() }" data-prod_stock="${op_vo.getProd_stock() }" >${op_vo.getSize() } ${op_vo.getColor() }</option>
                            				</c:if>
                            				<c:if test="${op_vo.getProd_stock() eq 0}">
                            					<option disabled >${op_vo.getSize() } ${op_vo.getColor() } - 품절</option>
                            				</c:if>
                            			</c:if>
                            			</c:forEach>
                            		</select>
                        		</div>
							    <button id="btnEx${Ex_idx }" type="button" style="width:50px; height: 30px;" class="btnNormal exchange option confirm">선택</button>
                            </th>
                       	</tr>
		            </tbody>
	            </table>
			</div>
            <div style="padding:20px;" id="total_amount_Ex${Ex_idx}" class="total_amount"><!-- 여기에 js로 수량 추가합니당 --></div>
            <div style="padding:20px;" class="total_amount">
            교환 사유: 
            <input id="Ex_msg_${Ex_idx}" type="text" placeholder="사유 입력" />
            </div>
            <div class="ec-base-button" module="product_action">
                <a href="#none" onclick="odExchange${Ex_idx}()"class="btnSubmitFix sizeS"><span id="btn_buy">상품 교환</span></a>
                <a href="#none" onclick="closeModalEx${Ex_idx}()" class="btnNormalFix sizeS">닫기</a>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(document).ready(function() {
    
 	
 	// 모달 다이얼로그 열기
    $(".updateOd.exchange${Ex_idx}").on("click", function() { 

        const modal = document.getElementById("myModalExchange${Ex_idx}");

        const div = $(this).closest("div");
		
        $("#qty_input_Ex${Ex_idx}").val(1);
	
        $('.modalEx${Ex_idx}').off('click', '.qty_Ex${Ex_idx} .exchange.qty.up').on('click', '.qty_Ex${Ex_idx} .exchange.qty.up', function() {
        	let input = $(this).siblings("input[type='text']");
        	let currentVal = parseInt(input.val());
        	let max_ex = input.data("max");
        	let prod_stock = input.data("stock");
            
            totalQuantity = 0;
            localQuantity = 0;
            
            localQuantity = currentVal + 1;
            
            
            $(".o_pEx${Ex_idx } .product_Ex${Ex_idx}").each(function() {
                let quantity = parseInt($(this).find(".qty-input-Ex${Ex_idx}").val());

                totalQuantity += quantity;
            });

            if(totalQuantity >= max_ex){
                alert("교환가능 수량은 기존 주문량을 넘을 수 없습니다.");
                input.val(currentVal);
                return ; 
            } else if(localQuantity > prod_stock){
                alert("해당 상품의 재고가 더 이상 없습니다.");
                input.val(currentVal);
                return ; 
            } else {
                input.val(currentVal + 1);
                updateTotalAmountEx${Ex_idx}();
            }
        });

        $('.modalEx${Ex_idx}').off('click', '.qty_Ex${Ex_idx} .exchange.qty.down').on('click', '.qty_Ex${Ex_idx} .exchange.qty.down', function() {
            let input = $(this).siblings("input[type='text']");
            let currentVal = parseInt(input.val());
            if (currentVal > 1) {
                input.val(currentVal - 1);
                updateTotalAmountEx${Ex_idx}();
            }
        });
        
        modal.style.display = "block";
        updateTotalAmountEx${Ex_idx}();
    });
 	
 	
 
    // 모달 다이얼로그 닫기
    $("#closeEx${Ex_idx}").on("click", function() {
    	const modal = document.getElementById("myModalExchange${Ex_idx}");
        modal.style.display = "none";
    });

    //옵션 디브 보이깅1
    $("#btnEx${Ex_idx }").on("click", function() {
    	
		// 최대 수량 확인
        let totalQuantity = 0;
        
        $(".o_pEx${Ex_idx } .product_Ex${Ex_idx}").each(function() {
            let quantity = parseInt($(this).find(".qty-input-Ex${Ex_idx}").val());

            totalQuantity += quantity;
        });

        if(totalQuantity >= ${odvo.getOd_changed_qty()}){
            alert("교환가능 수량은 기존 주문량을 넘을 수 없습니다.");
            return ; 
        } 
    	
    	selectedOptionElement = $(".opEx${Ex_idx}:selected");

        let selectedOption = selectedOptionElement.val();

        let productName = "${pdvo.getProd_name()}";
        let qty = 1; 
        let productPrice = "${pdvo.getCell_price()}";
        
        let size = selectedOptionElement.data('size');
        let color = selectedOptionElement.data('color');

        let prod_stock = selectedOptionElement.data('prod_stock');
        
        addProductToTotal(qty, selectedOption, productName, productPrice, size, color, prod_stock);
    });
    
  //상품을 totalProducts에 추가하는 함수
    function addProductToTotal(qty, option, name, price, size, color, prod_stock) {
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
            <tr class="product_Ex${Ex_idx}" data-qty="` + qty + `" data-price="` + price + `">
                <input class="hidden_option" type="hidden" value="` + option + `" />
                <input class="hidden_qty" type="hidden" value="` + qty + `" />
                <td style="text-align:center; padding:20px; ">
                	<span>`+name+` | `+ size +`-`+color+`</span>            	
	   	            <div class="qty_Ex${Ex_idx}">
	   				    <button type="button" class="exchange qty down"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"/></button>
	   				    
	   				    <input type="text" value="1" min="1" data-stock="` + prod_stock + `" data-max="${odvo.getOd_changed_qty()}" class="qty-input-Ex${Ex_idx}" id="qty_Ex${Ex_idx}" style="width: 50px; text-align: center;" />
	   				    <button type="button" class="exchange qty up"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"/></button>
	   				</div>
                	<a href="" class="del_option_Ex${Ex_idx}">X</a>
               	</td>
            </tr>
        `;

        $(".o_pEx${Ex_idx }").append(productHtml);
        updateTotalAmountEx${Ex_idx}();
    }
});

$(document).on("click", ".del_option_Ex${Ex_idx}", function(e) {
    e.preventDefault();  // 기본 동작을 막습니다.
    let tr = $(this).closest("tr");
    tr.remove();
    updateTotalAmountEx${Ex_idx}();  // 삭제 후 총 금액과 수량을 업데이트합니다.
});

function odExchange${Ex_idx}(){
	if(confirm("해당 상품을 교환하시겠습니까?")){
		if(confirm("교환 시 번복이 불가합니다.\r\n교환을 진행하시겠습니까?")){
			
			let totalQuantity = 0;
	        
	        $(".o_pEx${Ex_idx } .product_Ex${Ex_idx}").each(function() {
	            let quantity = parseInt($(this).find(".qty-input-Ex${Ex_idx}").val());

	            totalQuantity += quantity;
	        });
			
	        let qty = totalQuantity;
	        
			let optionKeys = [];
		    let b_qtys = [];
			let items = document.querySelectorAll('.o_pEx${Ex_idx } .product_Ex${Ex_idx}');
			items.forEach(function(item) {
				        let optionKey = item.querySelector('.hidden_option').value;
				        let b_qty = item.querySelector('.qty-input-Ex${Ex_idx}').value;
				        optionKeys.push(optionKey);
				        b_qtys.push(b_qty);
				    });
			
			let msg = $("#Ex_msg_${Ex_idx}").val();
			
			$.ajax({
				url:"/shop/user/myshop/orderList/updateIO.jsp",
				type:"post",
				data: {
					"type": "exchange",
					"order_key": ${odvo.getOrder_key()},
					"od_key": ${odvo.getOd_key()},
					"product_key" : ${odvo.getOpvo().getProduct_key()},
					"option_key" : ${odvo.getOption_key()},
					"cell_price": ${pdvo.getCell_price()},
					"qty": qty,
					"option_keys": optionKeys.join(","),
					"b_qtys": b_qtys.join(","),
					"os_msg":msg,
				},
			}).done(function(data) {
				location.reload();
			});
		}
	}
}

//총 상품금액 업데이트 함수
function updateTotalAmountEx${Ex_idx}() {
	let totalPrice = 0;
    let totalQuantity = 0;
    $(".o_pEx${Ex_idx } .product_Ex${Ex_idx}").each(function() {
        
        let quantity = parseInt($(this).find(".qty-input-Ex${Ex_idx}").val());

        totalQuantity += quantity;
    });

	totalQuantity = ${odvo.getOd_changed_qty()} - totalQuantity;
    
    $("#total_amount_Ex${Ex_idx}").html('변경가능 상품량 : <span class="total-cnt"><strong>' + totalQuantity + '</strong>개</span>');
}

function closeModalEx${Ex_idx}(){
	const modal = document.getElementById("myModalExchange${Ex_idx}");
    modal.style.display = "none";
}
</script>

