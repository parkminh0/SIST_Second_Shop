<%-- <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.menu li.listType:first-child[selected]{
		padding-left: 15px; 
		background: rgb(100,100,100);
	
	}

	li.listType[selected] a {
		color: #fff;
	}
	
	li.listType[selected] {
		background: rgb(100,100,100);
	}

   .xans-myshop-orderhistoryhead .stateSelect {
	    display: inline-block;
	    padding: 0 12px 0 0;
	    margin: 0 5px 0 2px;
	    background: url("//img.echosting.cafe24.com/skin/base/common/ico_bar.gif") no-repeat 100% 6px;
	}
  
	  .ec-base-table .message {
	    border: 1px solid #d7d5d5;
	    padding: 50px 0;
	    text-align: center;
	    color: #757575;
	    font-weight: bold;
	}
	
	.ec-base-table .center {
	    text-align: center;
	}
	
	.xans-myshop-orderhistorylistitem .title {
	    margin: 40px 0 10px 10px;
	}
	
	.xans-myshop-orderhistorylistitem .title h3 {
	    color: #353535;
	    font-size: 12px;
	}
	
	.xans-myshop-orderhistoryhead ul {
	    margin: 10px 0 0;
	    color: #939393;
	    line-height: 1.5;
	}
	
	.xans-myshop-orderhistoryhead fieldset .period {
	    display: inline-block;
	    margin: 0 2px;
	    font-size: 0;
	    vertical-align: middle;
	}
	
	.xans-myshop-orderhistoryhead fieldset .period a {
	    padding: 0;
	    border: 0;
	}
	
	.ec-base-tab .menu li {
	    float: left;
	    border-left: 1px solid #cbcdce;
	    background: #f2f2f2;
	}
	
	.ec-base-tab .menu li a {
	    display: block;
	    min-width: 187px;
	    margin: 0 0 0 -1px;
	    padding: 12px 5px 11px;
	    border-right: 1px solid #cbcdce;
	    color: #707070;
	    text-decoration: none;
	    outline: 0;
	    text-align: center;
	    background: #f2f2f2;
	}
	
	.ec-base-tab .menu li.selected a {
	    position: relative;
	    top: -1px;
	    left: -2px;
	    margin: 0 0 -1px;
	    border: 1px solid #202020;
	    border-bottom: 0;
	    color: #fff;
	    font-weight: bold;
	    background: #4a5164;
	}
	
	.ec-base-table img {
		width:100px;
	}
	
</style>
    
	<c:if test="${requestScope.resultNum ne null}">
		<c:set var="resultNum" value="${requestScope.resultNum}"/>
	</c:if>
	<c:if test="${requestScope.resultNum eq null}">
		<c:set var="resultNum" value="0"/>
	</c:if>
	
	<c:if test="${param.listType eq null}">
		<c:set var="listType" value="${requestScope.listType }"/>
	</c:if>
	<c:if test="${param.listType ne null}">
		<c:set var="listType" value="${param.listType}"/>
	</c:if>
	<c:if test="${param.selBd eq null}">
		<c:set var="selBd" value="${requestScope.selBd }"/>
	</c:if>
	<c:if test="${param.selBd ne null}">
		<c:set var="selBd" value="${param.selBd}"/>
	</c:if>
	
	<c:if test="${param.delivery_key eq null}">
		<c:set var="delivery_key" value="${requestScope.delivery_key }"/>
	</c:if>
	<c:if test="${param.delivery_key ne null}">
		<c:set var="delivery_key" value="${param.delivery_key}"/>
	</c:if>
	<c:if test="${param.os_option eq null}">
		<c:set var="os_option" value="${requestScope.os_option }"/>
	</c:if>
	<c:if test="${param.os_option ne null}">
		<c:set var="os_option" value="${param.os_option}"/>
	</c:if>
	
	
	<c:if test="${param.start_date eq null}">
		<c:set var="start_date" value="${requestScope.start_date }"/>
	</c:if>
	<c:if test="${param.start_date ne null}">
		<c:set var="start_date" value="${param.start_date}"/>
	</c:if>
	<c:if test="${param.end_date eq null}">
		<c:set var="end_date" value="${requestScope.end_date }"/>
	</c:if>
	<c:if test="${param.end_date ne null}">
		<c:set var="end_date" value="${param.end_date}"/>
	</c:if>
	
	
	
	
	

	<c:set var="pvo" value="${requestScope.page }"/>
	<c:set var="o_ar" value="${requestScope.o_ar}" />
<%-- 	<c:set var="od_ar" value="${requestScope.od_ar}" /> --%>
<%-- 	<c:set var="os_ar" value="${requestScope.os_ar}" /> --%>
	<c:if test="${param.cPage eq null }" >
	<c:set var="cPage" value="${requestScope.cPage} }" />
	</c:if>
	<c:if test="${param.cPage ne null }" >
	<c:set var="cPage" value="${param.cPage}" />
	</c:if>
		<!--  여기부터 콘텐츠 -->
		<div class="path">
		    <span>현재 위치</span>
		    <ol>
		        <li><a href="/">홈</a></li>
		        <li><a href="/myshop/index.html">마이쇼핑</a></li>
		        <li title="현재 위치"><strong>주문조회</strong></li>
		    </ol>
		</div>
		
		<div class="titleArea">
		    <h2>주문조회</h2>
		</div>
		
		<div module="Myshop_OrderHistoryTab">
		    <ul class="menu">
		        <li class="tab_class listType" ${listType eq 1 ? 'selected' : '' }><a href="Controller?type=orderList&listType=1">주문내역조회 (<span id="xans_myshop_total_orders">${resultNum_1 }</span>)</a></li>
		        <li class="tab_class_cs listType" ${listType eq 2 ? 'selected' : ''}><a href="Controller?type=orderList&listType=2">취소/반품/교환 내역 (<span id="xans_myshop_total_orders_cs">${resultNum_2 }</span>)</a></li>
		    </ul>
		</div>
		
		<div module="Myshop_OrderHistoryHead" class="ec-base-tab xans-myshop-orderhistoryhead">
		    <fieldset class="ec-base-box">
		        <legend>검색기간설정</legend>
		        <div class="stateSelect ">
		            <select id="order_status" name="order_status" class="fSelect">
		                <option value="0">전체 주문처리상태</option>
						<c:if test="${listType eq 1}">
		                <option ${delivery_key eq 2 ? 'selected' : '' } value="2">배송준비</option>
		                <option ${delivery_key eq 3 ? 'selected' : '' } value="3">배송중</option>
		                <option ${delivery_key eq 4 ? 'selected' : '' } value="4">배송완료</option>
		                </c:if>
						<c:if test="${listType eq 2}">
			                <option ${os_option eq 1 ? 'selected' : '' } value="5">취소</option>
			                <option ${os_option eq 2 ? 'selected' : '' } value="6">반품</option>
			                <option ${os_option eq 3 ? 'selected' : '' } value="7">교환</option>
		                </c:if>
		            </select>
		        </div>
		        <span class="period">
		            <a href="#none" data-val="1" class="btnDate ${selBd == 1 ? 'selected' : ''}" data-days="00"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1${selBd == 1 ? '_on' : ''}.gif" data-offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1.gif" data-onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date1_on.gif" alt="오늘"></a>
		            <a href="#none" data-val="2" class="btnDate ${selBd == 2 ? 'selected' : ''}" data-days="07"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2${selBd == 2 ? '_on' : ''}.gif" data-offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2.gif" data-onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date2_on.gif" alt="1주일"></a>
		            <a href="#none" data-val="3" class="btnDate ${selBd == 3 ? 'selected' : ''}" data-days="30"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3${selBd == 3 ? '_on' : ''}.gif" data-offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3.gif" data-onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date3_on.gif" alt="1개월"></a>
		            <a href="#none" data-val="4" class="btnDate ${selBd == 4 ? 'selected' : ''}" data-days="90"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4${selBd == 4 ? '_on' : ''}.gif" data-offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4.gif" data-onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date4_on.gif" alt="3개월"></a>
		            <a href="#none" data-val="5" class="btnDate ${selBd == 5 ? 'selected' : ''}" data-days="180"><img src="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5${selBd == 5 ? '_on' : ''}.gif" data-offimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5.gif" data-onimage="//img.echosting.cafe24.com/skin/base_ko_KR/myshop/btn_date5_on.gif" alt="6개월"></a>
		        </span>
		        <input id="start_date_ol" name="history_start_date" class="fText hasDatepicker"  size="10" value="" type="date"/>
		        	 ~ 
		        <input id="end_date_ol" name="history_end_date" class="fText hasDatepicker" size="10" value="" type="date"/>
		        
		        <input alt="조회" id="order_search_btn_ol" type="image" src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/btn_search.gif">
		    </fieldset>
		    <ul>
		       
		        <li>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
		        <li class="displaynone">취소/교환/반품 신청은  일까지 가능합니다.</li>
		    </ul>
		</div>
		<c:if test="${listType eq 1 }">
		<div class="ec-base-table typeList xans-myshop-orderhistorylistitem">
		    <div class="title">
		        <h3>주문내역조회</h3>
		    </div>
			<c:if test="${o_ar ne null }">
		    <table border="1" summary="" class="center">
		        <caption>{$list_title}</caption>
		        <colgroup>
		            <col style="width:120px;" />
		            <col style="width:100px;" />
		            <col style="width:auto;" />
		            <col style="width:60px;" />
		            <col style="width:110px;" />
		            <col style="width:100px;" />
		            <col style="width:100px;" />
		        </colgroup>
		        <thead>
		            <tr>
		                <th scope="col">상세 주문번호<br />[상세 주문일자]</th>
		                <th scope="col">이미지</th>
		                <th scope="col">상품정보</th>
		                <th scope="col">수량</th>
		                <th scope="col">상품구매금액</th>
		                <th scope="col">주문처리상태</th>
		                <th scope="col">취소/교환/반품</th>
		            </tr>
		        </thead>
		
		        <tbody>
					<c:set var="Cc_idx" value="1"/>
					<c:set var="Rf_idx" value="1"/>
					<c:set var="Ex_idx" value="1"/>
					<c:set var="Cf_idx" value="1"/>
					
		            <c:forEach var="ovo" items="${o_ar}">
		                <c:set var="rowspan" value="${ovo.getOd_true_size() + 1}" />
		                <tr>
		                    <td rowspan="${rowspan}" class="number">
		                        <p><a href="#none" class="line">${ovo.getOrder_key()}</a></p>
		                        <p>[${ovo.getOrder_dtm()}]</p>
		                        <c:if test="${ovo.getOds_confirm(ovo.getOrder_key()) eq 0 }">
			                        <c:if test="${ovo.getDelivery_key() lt 3 }">
			                        	<c:if test="${ovo.getOrder_qty() eq ovo.getOrder_changed_qty() }">
			                        		<a href="#none" class="btnNormal" onclick="cancelAllOrder(${ovo.getOd_list().size() },${ovo.getOrder_key()})">전체주문취소</a>
				                        </c:if>
			                        </c:if>
			                        <c:if test="${ovo.getDelivery_key() eq 4 }">
			                        	<c:if test="${ovo.getOrder_qty() eq ovo.getOrder_changed_qty() }">
			                        		<a href="#none" class="btnNormal" onclick="refundAllOrder(${ovo.getOd_list().size() },${ovo.getOrder_key()})">전체주문반품</a>
				                        </c:if>
			                        </c:if>
		                        </c:if>
		                    </td>
		                    <c:set var="total_price" value="0"/>
		                    <c:set var="total_qty" value="0" />
		                    <c:forEach var="odvo" items="${ovo.getOd_list()}">
			                    <c:set var="total_price" value="${total_price + odvo.getOd_totalprice() }"/>
			                    <c:set var="total_qty" value="${total_qty + odvo.getOd_changed_qty() }" />
			                    <c:if test="${odvo.getOd_changed_qty() > 0}">
		                        <tr>
		                            <td class="thumb">
		                            	<a href="/product/detail.html?productId=${item.productId}">
		                            		<img id="thumb" src="${odvo.getOpvo().getImg_url()}" onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';" alt="상품 이미지" />
		                            	</a>
	                            	</td>
		                            <td class="product left top">
		                                <strong class="name">${odvo.getOpvo().getProduct_name()}</strong>
		                                <div class="option">${odvo.getOpvo().getSize()} ${odvo.getOpvo().getColor()}</div>
		                                <c:if test="${odvo.getIsexchanged() eq 1 }">
		                                <strong class="name">[교환제픔]</strong>
		                                </c:if>
		                            </td>
		                            <td>${odvo.getOd_changed_qty()}</td>
		                            <td class="right">
		                            	<fmt:formatNumber value="${odvo.getCell_price()*odvo.getOd_changed_qty()}" type="currency"/><br/>
		                            	적립금: [${odvo.getOd_mile()}]원
		                            </td>
		                            <td class="state">
		                                <p class="txtEm">${odvo.getD_status()}</p>
		                            </td>
		                            <td>
                               			<c:set var="order_key" value="${ovo.getOrder_key()}" />
                               			<c:set var="od_key" value="${odvo.getOd_key()}" />
		                            	<c:if test="${odvo.getDelivery_key() eq 4 }">
	                                		<c:if test="${odvo.getOd_confirm() ne 1 }">
		                                		<%@include file="/user/myshop/orderList/ol_dialog_refund.jsp"%>
												<c:set var="Rf_idx" value="${Rf_idx + 1 }"/>
		                                		<%@include file="/user/myshop/orderList/ol_dialog_exchange.jsp"%>
												<c:set var="Ex_idx" value="${Ex_idx + 1 }"/>
											</c:if>
	                                		<c:if test="${odvo.getOd_confirm() ne 1 }">
		                                		<a href="#none" class="btnNormal" onclick="confirmBuy('${odvo.getOd_key()}')">구매확정</button>
											</c:if>
	                                		<c:if test="${odvo.getOd_confirm() eq 1 }">
		                                		<strong>구매확정</strong>
											</c:if>
		                                </c:if>
		                                <c:if test="${odvo.getDelivery_key() lt 3 }">
	                                		<%@include file="/user/myshop/orderList/ol_dialog_cancel.jsp"%>
											<c:set var="Cc_idx" value="${Cc_idx + 1}"/>
		                                </c:if>
		                            </td>
		                           </tr>
	                           </c:if>
		                    </c:forEach>
	                	</tr>
		                <tr>
		                	<td>
		                	</td>
		                    <td colspan="6" class="order-summary">
		                        총 수량: ${total_qty}, 총 구매 금액: <fmt:formatNumber value="${total_price}" type="currency"/>, 총 적립금: ${ovo.getMile()}원
		                    </td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		    </c:if>
		    <c:if test="${o_ar eq null }">
		    	<p class="message">주문 내역이 없습니다.</p>
		    </c:if>
		</div>
		</c:if>
		<c:if test="${listType eq 2 }">
		<div class="ec-base-table typeList xans-myshop-orderhistorylistitem">
		    <div class="title">
		        <h3>취소/반품/교환주문내역</h3>
		    </div>
			<c:if test="${o_ar ne null }">
		    <table border="1" summary="" class="center">
		        <caption>{$list_title}</caption>
		        <colgroup>
		            <col style="width:120px;" />
		            <col style="width:100px;" />
		            <col style="width:auto;" />
		            <col style="width:60px;" />
		            <col style="width:110px;" />
		            <col style="width:100px;" />
		        </colgroup>
		        <thead>
		            <tr>
		                <th scope="col">상세 주문번호<br />[상세 주문일자]</th>
		                <th scope="col">이미지</th>
		                <th scope="col">상품정보</th>
		                <th scope="col">수량</th>
		                <th scope="col">취소/환불금액</th>
		                <th scope="col">취소/반품/교환</th>
		            </tr>
		        </thead>
		
		        <tbody>
		            <c:forEach var="ovo" items="${o_ar}" varStatus="ind">
		                <c:set var="rowspan" value="${ovo.getOs_list().size()+1}" />
		                <tr>
		                    <td rowspan="${rowspan}" class="number">
		                        <p><a href="#none" class="line">${ovo.getOrder_key()}</a></p>
		                        <p>[${ovo.getOrder_dtm()}]</p>
		                    </td>
		                    <c:set var="total_price" value="0"/>
		                    <c:set var="total_qty" value="0" />
		                    <c:forEach var="osvo" items="${ovo.getOs_list()}">
			                    <c:set var="total_price" value="${total_price + osvo.getOs_price() }"/>
			                    <c:set var="total_qty" value="${total_qty + osvo.getOs_qty() }" />
		                        <tr>
		                            <td class="thumb">
		                            	<a href="/product/detail.html?productId=${item.productId}">
		                            		<img id="thumb" src="${osvo.getOdvo().getOpvo().getImg_url()}" onerror="this.src='//img.echosting.cafe24.com/thumb/img_product_small.gif';" alt="상품 이미지" />
		                            	</a>
	                            	</td>
		                            <td class="product left top">
		                                <strong class="name">${osvo.getOdvo().getOpvo().getProduct_name()}</strong>
		                                <div class="option">${osvo.getOdvo().getOpvo().getSize()} ${osvo.getOdvo().getOpvo().getColor()}</div>
		                            </td>
		                            <td>${osvo.getOs_qty()}</td>
		                            <td class="right">
		                            	<fmt:formatNumber value="${osvo.getOs_price()}" type="currency"/><br/>
		                            </td>
		                            <td>
                               			<c:if test="${osvo.getOs_option() eq 1 }">
                               			<strong>취소 제품</strong>
                               			</c:if>
                               			<c:if test="${osvo.getOs_option() eq 2 }">
                               			<strong>반품 제품</strong>
                               			</c:if>
                               			<c:if test="${osvo.getOs_option() eq 3 }">
                               			<strong>교환 제품</strong>
                               			</c:if>
		                            </td>
		                           </tr>
		                    </c:forEach>
	                	</tr>
		                <tr>
		                	<td>
		                	</td>
		                    <td colspan="6" class="order-summary">
		                        총[취소|환불|교환] 수량: ${total_qty}, 총 [취소|환불] 금액: <fmt:formatNumber value="${total_price}" type="currency"/>
		                    </td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		    </c:if>
		    <c:if test="${o_ar eq null }">
		    	<p class="message">취소/반품/교환 내역이 없습니다.</p>
		    </c:if>
		</div>
		</c:if>
		
		<div class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">

	<c:if test="${pvo.getNowPage() <= pvo.getPagePerBlock() }">
		<a href="#" class="last page disabled">
			<img src="/shop/product/img/btn_page_first.png" alt="첫 페이지"/>
		</a>
	</c:if>
	<c:if test="${pvo.getNowPage() > pvo.getPagePerBlock() }">
		<a href="Controller?type=orderList&selBd=${selBd}&listType=${listType}&os_option=${os_option}&delivery_key=${delivery_key}&start_date=${start_date}&end_date=${end_date}&cPage=1">
			<img src="/shop/product/img/btn_page_first.png" alt="첫 페이지"/>
		</a>
	</c:if>
	<c:if test="${pvo.getStartPage() < pvo.getPagePerBlock() }">
		<a href="#" class="last page disabled">
				<img src="/shop/product/img/btn_page_prev.png" alt="이전 페이지"/>
		</a>
	</c:if>
	<c:if test="${pvo.getStartPage() >= pvo.getPagePerBlock() }">
		<c:if test="${pvo.getEndPage()%pvo.getPagePerBlock() == 0 }">
				<a href="Controller?type=orderList&selBd=${selBd}&listType=${listType}&os_option=${os_option}&delivery_key=${delivery_key}&start_date=${start_date}&end_date=${end_date}&cPage=${pvo.getEndPage()-pvo.getPagePerBlock() }">
			</c:if>
			<c:if test="${pvo.getEndPage()%pvo.getPagePerBlock() != 0 }">
				<a href="Controller?type=orderList&selBd=${selBd}&listType=${listType}&os_option=${os_option}&delivery_key=${delivery_key}&start_date=${start_date}&end_date=${end_date}&cPage=${pvo.getEndPage()-(pvo.getEndPage()%pvo.getPagePerBlock()) }">
			</c:if>
	</c:if>
	<c:if test="${pvo.getStartPage() >= pvo.getPagePerBlock() }">
	<c:if test="${pvo.getEndPage()%pvo.getPagePerBlock() == 0 }">
		<a href="Controller?type=orderList&selBd=${selBd}&listType=${listType}&os_option=${os_option}&delivery_key=${delivery_key}&start_date=${start_date}&end_date=${end_date}&cPage=${pvo.getEndPage()-pvo.getPagePerBlock() }">
	</c:if>
	<c:if test="${pvo.getEndPage()%pvo.getPagePerBlock() != 0 }">
		<a href="Controller?type=orderList&selBd=${selBd}&listType=${listType}&os_option=${os_option}&delivery_key=${delivery_key}&start_date=${start_date}&end_date=${end_date}&cPage=${pvo.getEndPage()-(pvo.getEndPage()%pvo.getPagePerBlock()) }">
	</c:if>
	<img src="/shop/product/img/btn_page_prev.png" alt="이전 페이지"/>
		</a>
	</c:if>

	<ol class="bbsPage">
		<c:forEach begin="${pvo.getStartPage() }" end="${pvo.getEndPage()}" varStatus="i">
			<li class="xans-record-">
				<c:if test="${pvo.getNowPage().equals(i.index)}">
					<a href="#" class="this">${i.index }</a>
				</c:if>
				<c:if test="${!pvo.getNowPage().equals(i.index)}">
					<a href="Controller?type=orderList&selBd=${selBd}&listType=${listType}&os_option=${os_option}&delivery_key=${delivery_key}&start_date=${start_date}&end_date=${end_date}&cPage=${i.index }" class="other">${i.index }</a>
				</c:if>
			</li>
		</c:forEach>
	</ol>
	<c:if test="${pvo.getEndPage() >= pvo.getTotalPage() }">
		<a href="#" class="last page disabled">
			<img src="/shop/product/img/btn_page_next.png" alt="다음 페이지"/>
		</a>
	</c:if>
	<c:if test="${pvo.getEndPage() < pvo.getTotalPage() }">
		<a href="Controller?type=orderList&selBd=${selBd}&listType=${listType}&os_option=${os_option}&delivery_key=${delivery_key}&start_date=${start_date}&end_date=${end_date}&cPage=${pvo.getStartPage()+pvo.getPagePerBlock()}">
			<img src="/shop/product/img/btn_page_next.png" alt="다음 페이지"/>
		</a>
	</c:if>
	
	<c:if test="${pvo.getTotalPage() == 0 || pvo.getNowPage() > pvo.getTotalPage() - (pvo.getTotalPage()%pvo.getPagePerBlock()) }">
		<a href="#" class="last page disabled">
			<img src="/shop/product/img/btn_page_last.png" alt="마지막 페이지"/>
		</a>
	</c:if>
	<c:if test="${pvo.getTotalPage() > 0 && pvo.getNowPage() <= pvo.getTotalPage()- (pvo.getTotalPage()%pvo.getPagePerBlock()) }">
		<a href="Controller?type=orderList&selBd=${selBd}&listType=${listType}&os_option=${os_option}&delivery_key=${delivery_key}&start_date=${start_date}&end_date=${end_date}&cPage=${getTotalPage()}" class="last">
			<img src="/shop/product/img/btn_page_last.png" alt="마지막 페이지"/>
    	</a>
	</c:if>

	</div>
		<!-- 여기까지 -->
		
		
		
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script>

	if("${start_date == null}" == "true"){
		let today = new Date();
		let sevenDaysAgo = new Date();
		sevenDaysAgo.setDate(today.getDate() - 7);
		document.getElementById('end_date_ol').value = today.toISOString().substring(0, 10);
		document.getElementById('start_date_ol').value = sevenDaysAgo.toISOString().substring(0, 10);
	} else {
		document.getElementById('end_date_ol').value = "${end_date}";
		document.getElementById('start_date_ol').value = "${start_date}";
	}
	
	
	
$(function(){
	$("a.btnDate").click(function(){
		let end_date = new Date($("#end_date_ol").val());
		let minus_date = $(this).data("days");
		let tmp = new Date();
		tmp.setDate(end_date.getDate() - minus_date);
		let start_date = tmp.toISOString().substring(0, 10);
		$("#start_date_ol").val(start_date);
		
		$("a.btnDate").removeClass("selected");
		$("a.btnDate img").each(function() {
			$(this).attr("src",$(this).data("offimage"));
		});
		$(this).addClass("selected");
		$("a.btnDate.selected img").attr("src",$("a.btnDate.selected img").data("onimage"));
	})	

	$("#order_search_btn_ol").click(function(){
		let start_date = $("#start_date_ol").val();
		let end_date = $("#end_date_ol").val();
		let key = $("#order_status").val();
		let listType = ${listType};
		let os_option = null;
		let delivery_key = null;
		if(key == 0){
			os_option = 0;
			delivery_key = 0;
		} else if(key>4){
			listType = 2;
			os_option = key - 4;
		} else if(key<=4){
			listType = 1;
			delivery_key = key;
		}
		
		
		location.href="Controller?type=orderList&cPage=1&selBd="+$("a.btnDate.selected").data('val')+"&listType="+listType+"&os_option="+os_option+"&delivery_key="+delivery_key+"&start_date="+start_date+"&end_date="+end_date;
		
	});

})

function cancelAllOrder(od_qty,order_key){
	if(confirm("해당 주문("+od_qty+")건을 취소하시겠습니까?")){
		if(confirm("취소 시 번복이 불가합니다.\r\n취소를 진행하시겠습니까?")){
			$.ajax({
				url:"/shop/user/myshop/orderList/updateIO.jsp",
				type:"post",
				data: {
					"type": "cancel_all",
					"order_key": order_key,
				},
			}).done(function(data) {
				location.reload();
			});
		}
	}
}

function refundAllOrder(od_qty,order_key){
	if(confirm("해당 주문("+od_qty+")건을 반품하시겠습니까?")){
		if(confirm("반품 시 번복이 불가합니다.\r\n반품을 진행하시겠습니까?")){
			$.ajax({
				url:"/shop/user/myshop/orderList/updateIO.jsp",
				type:"post",
				data: {
					"type": "refund_all",
					"order_key": order_key,
				},
			}).done(function(data) {
				location.reload();
			});
		}
	}
}

function confirmBuy(od_key){
	if(confirm("해당 상품에 대해 구매확정하시겠습니까?")){
		if(confirm("구매확정 시 취소나 반품이 불가합니다.\r\n구매확정을 진행하시겠습니까?")){
			$.ajax({
				url:"/shop/user/myshop/orderList/updateIO.jsp",
				type:"post",
				data: {
					"type": "confirm",
					"od_key": od_key,
				},
			}).done(function(data) {
				location.reload();
			});
		}
	}
}

</script>