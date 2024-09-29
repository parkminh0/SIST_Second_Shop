<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="wrap">
    	<!--  여기부터 콘텐츠 -->
    	<c:set var="basket_list" value="${sessionScope.user_vo.basket_list}" />
    	<c:set var="u_idx" value="${sessionScope.user_vo.getU_idx()}" />
    	<c:set var="total_spend" value="0" />
    	<c:set var="total_qty" value="0" />
    	<c:set var="delivery_price" value="0" />
    	<c:forEach var="bvo" items="${basket_list}" >
    		<c:set var="total_spend" value="${total_spend+(bvo.getPvo().getCell_price()*bvo.getB_qty() )}" />
    		<c:set var="total_qty" value="${total_qty+bvo.getB_qty() }" />
    	</c:forEach>
    	<c:set var="delivery_price" value="2000" />
   		<c:set var="final_price" value="${total_spend+delivery_price}" />


    	
		<div class="path">
		    <span>현재 위치</span>
		    <ol>
		        <li><a href="/">홈</a></li>
		        <li title="현재 위치"><strong>장바구니</strong></li>
		    </ol>
		</div>
		
		<div class="titleArea">
		    <h2>장바구니</h2>
		</div>
		
		<div>
		    <!--@css(/layout/basic/css/ec-base-layer.css)-->
		    <!--@css(/css/module/order/basketPackage.css)-->
		
		    <p class="orderStep"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/order/img_order_step1.gif" alt="01 장바구니" /></p>
		
		    <div class="orderListArea ec-base-table typeList gBorder">
				<c:if test="${basket_list eq null or f:length(basket_list) eq 0}">
					<div class="xans-element- xans-order xans-order-normtitle title">
		            	<h3>상품 (0)</h3>
	       			</div>
				</c:if>
				<c:if test="${basket_list ne null and f:length(basket_list) ne 0}">
					<div class="title">
		            	<h3>상품 ${f:length(basket_list)}</h3>
	       			</div>
				</c:if>
		
		        <table border="1" id="t1">
		            <caption>기본배송</caption>
		            <colgroup>
		                <col style="width:27px" />
		                <col style="width:92px" />
		                <col style="width:auto" />
		                <col style="width:88px" />
		                <col style="width:110px"/>
		                <col style="width:110px" />
		            </colgroup>
		            <thead>
		            <tr>
		                <th scope="col"><input type="checkbox" id="sAgreeAllChecked" /></th>
		                <th scope="col">이미지</th>
		                <th scope="col">상품정보</th>
		                <th scope="col">수량</th>
		                <th scope="col">상품구매금액</th>
		                <th scope="col">선택</th>
		            </tr>
		            </thead>
		            <tfoot class="right">
		            <tr>
		                <td colspan="10"><span class="gLeft">[기본배송]</span></td>
		            </tr>
		            </tfoot>
		            <tbody module="Order_list" class="center">
	            		<c:if test="${basket_list eq null or f:length(basket_list) eq 0}">
				            <tr>
				            	<td colspan="6">
										<p>장바구니가 비어 있습니다.</p>
							    </td>
				            </tr>
						</c:if>
	            		<c:if test="${basket_list ne null and f:length(basket_list) ne 0}">
			            <c:forEach var="bvo" items="${basket_list}" varStatus="idx">
			            <tr>
			            	<input type="hidden" class="basket_key" value="${bvo.getBasket_key() }" />
			                <td><input type="checkbox" id="check_${idx.index }" name="checkBasket" value="${bvo.getBasket_key() }"/>
			                	<input class="hidden_option" type="hidden" value="${bvo.getOption_key() }"/>
				                <input class="hidden_qty" type="hidden" value="${bvo.getB_qty() }"/></td>
			                <td class="thumb gClearLine"><a href="#"><img style="width:80px; height:80px;" src="${bvo.getPvo().getImg_url()}" alt="" /></a></td>
			                <td class="left gClearLine">
			                    <strong class="name">${bvo.getPvo().getProd_name() }</strong>
			                    <ul class="option" module="Order_optionAll">
			                        <li>
			                        	사이즈: ${bvo.getOvo().getSize() }
			                        </li>
			                        <li>
			                        	색상: ${bvo.getOvo().getColor() }
			                        </li>
			                    </ul>
		                    </td>
			                <td class="right">
		                        <span class="">
		                            <span class="ec-base-qty">
		                            <input id="quantity_id_0" name="quantity_name_0" size="2" readonly value="${bvo.getB_qty() }" type="tel">
		                            	<a href="javascript:;" class="up" onclick="javascript:cnt('up',${bvo.getBasket_key()},${bvo.getB_qty() })">
		                            	<img src="/shop/user/myshop/img/btn_quantity_up.gif" title="수량증가" />
		                            	</a>
		                            	<a href="javascript:;" class="down" onclick="javascript:cnt('down',${bvo.getBasket_key()},${bvo.getB_qty() })">
		                            	<img src="/shop/user/myshop/img/btn_quantity_down.gif" title="수량감소" />
		                            	</a>
		                            	</span>
		                        </span>
			                </td>
			                <td>
			                    <div id="{$product_purchase_price_div_id}">
				                    <strong>${bvo.getPvo().getCell_price() * bvo.getB_qty() } 원</strong>
			                    </div>
			                </td>
			                <td class="button">
		                    	<c:if test="${bvo.isInterested() eq false }">
		                    		<a href="javascript:;" src="before_interest" bs_key="${bvo.getBasket_key() }" pd_key="${bvo.getPvo().getProduct_key() }" class="btnNormal interest">관심상품등록</a>
		                    	</c:if>
		                    	<c:if test="${bvo.isInterested() eq true }">
		                    		<a href="javascript:;" style="background: rgb(120,120,120); color: rgb(200,200,200);"  src="after_interest" bs_key="${bvo.getBasket_key() }" pd_key="${bvo.getPvo().getProduct_key() }" class="btnNormal interest">관심상품삭제</a>
		                    	</c:if>
			                    <a href="javascript:;" class="btnNormal" onclick="del('${bvo.getBasket_key()}')"><i class="icoDelete"></i> 삭제</a>
			                </td>
			            </tr>
						</c:forEach>
						</c:if>
		            </tbody>
		        </table>
		    </div>
			<div class="orderListArea ec-base-table typeList gBorder"></div>
		    <div class="xans-element- xans-order xans-order-basketpriceinfoguide  ">
		        <p class="info {$basket_price_sale_guide_display|display}">할인 적용 금액은 주문서작성의 결제예정금액에서 확인 가능합니다.</p>
	        </div>
		    <div class="xans-element- xans-order xans-order-selectorder ec-base-button ">
		        <span class="gLeft">
		            <strong class="text">선택상품을</strong>
		            <a href="#none" class="btnEm" onclick="delSel()"><i class="icoDelete"></i> 삭제하기</a>
		        </span>
		        <span class="gRight">
		            <a href="#none" class="btnNormal" onclick="delAll()">장바구니비우기</a>
		        </span>
		    </div>
		
		    <!-- 총 주문금액 : 국내배송상품 -->
		    <div module="Order_TotalSummary" class="xans-element- xans-order xans-order-totalsummary ec-base-table typeList gBorder total  " unroll="1">
		        <table border="1" summary="">
		            <caption>총 주문금액</caption>
		            <colgroup>
		                <col style="width:17%;" />
		                <col style="width:19%;" />
		                <col style="width:auto;" />
		            </colgroup>
		            <thead>
		            <tr>
		                <th scope="col"><strong>총 상품금액</strong></th>
		                <th scope="col"><strong>총 배송비</strong></th>
		                <th scope="col"><strong>결제예정금액</strong></th>
		            </tr>
		            </thead>
		            <tbody class="center">
		            <tr>
		                <td><div class="box txt16">
		                	<strong>
		                	<span class="txt23">${total_spend }</span>
		                	원</strong> </div></td>
		                <td>
		                    <div class="box shipping txt16">
		                        <strong class="txt23">+ </strong>
		                        <strong>
		                        ${delivery_price } 원
		                        </strong>
		                                </div>
		                </td>
		                <td>
		                <div class="box txtEm txt16">
		                <strong class="txt23">= </strong>
		                <strong>${final_price } 원</strong>
		                </tr>
		            </tbody>
		        </table>
		    </div>
		
		    <div module="Order_TotalOrder" class="xans-element- xans-order xans-order-totalorder ec-base-button justify">
		        <a href="#none" onclick="sendAll()" class="btnSubmitFix sizeM">전체상품주문</a>
		        <a href="#none" onclick="sendOrder()" class="btnEmFix sizeM" link-order="/order/orderform.html{$param}" link-login="/member/login.html">선택상품주문</a>
		        <span class="gRight">
		            <a href="/" class="btnNormalFix sizeM">쇼핑계속하기</a>
		        </span>
		        <!-- 네이버 체크아웃 구매 버튼  -->
		        <div id="{$naver_checkout_button_id}"></div>
		        <!--상품상세페이지에 추가되는 앱 관련 결제버튼 div-->
		        <div id="{$app_payment_button_box_id}"></div>
		    </div>
		</div>
		
		<div class="ec-base-help">
		    <h3>이용안내</h3>
		    <div class="inner">
		        <h4>장바구니 이용안내</h4>
		        <ol>
		            <li class="item1">해외배송 상품과 국내배송 상품은 함께 결제하실 수 없으니 장바구니 별로 따로 결제해 주시기 바랍니다.</li>
		            <li class="item2">해외배송 가능 상품의 경우 국내배송 장바구니에 담았다가 해외배송 장바구니로 이동하여 결제하실 수 있습니다.</li>
		            <li class="item3">선택하신 상품의 수량을 변경하시려면 수량변경 후 [변경] 버튼을 누르시면 됩니다.</li>
		            <li class="item4">[쇼핑계속하기] 버튼을 누르시면 쇼핑을 계속 하실 수 있습니다.</li>
		            <li class="item5">장바구니와 관심상품을 이용하여 원하시는 상품만 주문하거나 관심상품으로 등록하실 수 있습니다.</li>
		            <li class="item6">파일첨부 옵션은 동일상품을 장바구니에 추가할 경우 마지막에 업로드 한 파일로 교체됩니다.</li>
		        </ol>
		        <h4>무이자할부 이용안내</h4>
		        <ol>
		            <li class="item1">상품별 무이자할부 혜택을 받으시려면 무이자할부 상품만 선택하여 [주문하기] 버튼을 눌러 주문/결제 하시면 됩니다.</li>
		            <li class="item2">[전체 상품 주문] 버튼을 누르시면 장바구니의 구분없이 선택된 모든 상품에 대한 주문/결제가 이루어집니다.</li>
		            <li class="item3">단, 전체 상품을 주문/결제하실 경우, 상품별 무이자할부 혜택을 받으실 수 없습니다.</li>
		            <li class="item4">무이자할부 상품은 장바구니에서 별도 무이자할부 상품 영역에 표시되어, 무이자할부 상품 기준으로 배송비가 표시됩니다.<br />실제 배송비는 함께 주문하는 상품에 따라 적용되오니 주문서 하단의 배송비 정보를 참고해주시기 바랍니다.</li>
		        </ol>
		    </div>
		</div>
		<!-- 여기까지 -->
       </div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script type="text/javascript">
	$(function(){
		

		//체크박스 전체 체크박스 
		$("#t1 thead input:checkbox").click(function() {
			let ar = $("#t1 tbody input:checkbox");
			ar.prop("checked", this.checked);
		});
		
		//밑에있는 체크박스들이 전체가 선택되면 위에있는 체크박스 선택
		$("tbody input:checkbox").bind("click",function(){
			let ar = $("tbody").find(":checkbox");
			
			let chk = true;
			for(let i=0; i<ar.length; i++){
				if(!ar.eq(i).is(":checked")){
					chk = false;
					break;
				}
			}
			
			$("#sAgreeAllChecked").prop("checked", chk);
			if(chk)
				$("#sAgreeAllChecked").next();
			else
				$("#sAgreeAllChecked").next();
		});
		
		
		
		$('.btnNormal.interest').click(function(){
			/* 관심상품 취소할 경우 */
			if ($(this).attr("src") == "after_interest"){
				$.ajax({
					url:"/shop/user/myshop/basket/interestIO.jsp",
					type:"post",
					data: {
						"product_key": encodeURIComponent($(this).attr("pd_key")),
						"mode": "off",
					},
				}).done(function(data) {
					alert("관심상품에서 삭제되었습니다.");
					location.reload();
				});
			}
			/* 관심상품 등록할 경우 */
			else {
				$.ajax({
					url:"/shop/user/myshop/basket/interestIO.jsp",
					type:"post",
					data: {
						"product_key": encodeURIComponent($(this).attr("pd_key")),
						"mode": "on",
					},
				}).done(function(data) {
					alert("관심상품에 등록되었습니다.");
					location.reload();
				});
			}
		});
		
	})
	
	function cnt(type, basket_key, b_qty){
		if(type == "down" && b_qty < 2){
			alert("최소 수량은 1 개 입니다.");
		} else {
			$.ajax({
				url:"/shop/user/myshop/basket/basketIO.jsp",
				type:"post",
				data: {
					"basket_key": basket_key,
					"incDec": type,
				},
			}).done(function(data) {
				location.reload();
			});
		}
		
	}
	
	function del(basket_key){
		if(confirm("해당 상품을 장바구니에서 삭제하시겠습니까?")){
			if(confirm("정말로 삭제하시겠습니까?")){
				$.ajax({
					url:"/shop/user/myshop/basket/deleteIO.jsp",
					type:"post",
					data: {
						"basket_key": basket_key,
					},
				}).done(function(data) {
					location.reload();
				});
			}
		}
		
	}
	
	function delAll(){
		if(confirm("장바구니를 비우시겠습니까?")){
			if(confirm("정말로 비우시겠습니까?")){
				$.ajax({
					url:"/shop/user/myshop/basket/deleteIO.jsp",
					type:"post",
					data: {
						"basket_key": "-1",
					},
				}).done(function(data) {
					location.reload();
				});
			}
		}
	}
	
	function delSel(){
		let chk_box = $("tbody input:checkbox:checked");  // 체크된 체크박스들 찾기
		console.log(chk_box.length);
		
		// 체크된 박스가 없을 경우 경고창 표시
        if (chk_box.length === 0) {
            alert("삭제할 상품을 선택하세요");
            return;
        }
		
		if(confirm("선택한 상품을 삭제하시겠습니까?")){
			if(confirm("정말로 삭제하시겠습니까?")){
			    let basketKeys = [];
				
			    chk_box.each(function() {
			        let basket_key = $(this).closest("tr").find(".basket_key").val();  // 체크된 체크박스의 부모 tr에서 product_key 값 찾기
			        basketKeys.push(basket_key);
			        console.log(basketKeys);
			    });
				
			    basketKeys.forEach(function(basketKey) {
		        	console.log("basketKey: "+ basketKey);
			        $.ajax({
			            url: "/shop/user/myshop/basket/deleteIO.jsp",  
			            type: "post",
			            data: {
			                "basket_key": basketKey,
			            },
			        }).done(function (data) {
						location.replace("Controller?type=basket");
					});
			    }); 
			}
		}
	}
	
	function sendOrder() {
			let items =  document.querySelectorAll('input[name="checkBasket"]:checked');
			
			if(items.length == 0){
				alert("상품을 선택해주세요.");
				return;
			}
			
			let optionKeys = [];
		    let b_qtys = [];
		    let u_idx = '${u_idx}';
			items.forEach(function(item) {
				        let optionKey = item.parentElement.querySelector('.hidden_option').value;
				        let b_qty = item.parentElement.querySelector('.hidden_qty').value;
				        
				        optionKeys.push(optionKey);
				        b_qtys.push(b_qty);
				    });
			let newUrl = 'Controller?type=orderpage&u_idx='+u_idx+'&option_keys='+optionKeys.join(",")+'&b_qtys='+b_qtys.join(",");
			location.replace(newUrl);
	}
	
	function sendAll(){
			let ar = $("#t1 tbody input:checkbox");
			ar.prop("checked", true);
			sendOrder();
	}
	
	
</script>	
