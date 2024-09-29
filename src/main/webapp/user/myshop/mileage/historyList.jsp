<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	<c:set var="pvo" value="${requestScope.page }"/>
	<c:set var="o_ar" value="${requestScope.mile_ar}" />
	<c:if test="${param.tab_type == null }">
		<c:set var="tab_type" value="history" />
	</c:if>
	<c:if test="${param.tab_type != null }">
		<c:set var="tab_type" value="${param.tab_type}" />
	</c:if>
	
	<c:set var="uvo" value="${sessionScope.user_vo}" />
   	<!--  여기부터 콘텐츠 -->
	<div class="xans-element- xans-myshop xans-myshop-head path" module="Myshop_Head">
	    <span>현재 위치</span>
	    <ol>
	        <li><a href="/">홈</a></li>
	        <li><a href="/myshop/index.html">마이 쇼핑</a></li>
	        <li title="현재 위치">적립금</li>
	    </ol>
	</div>
	
	<div>
	    <div class="xans-element- xans-myshop xans-myshop-head titleArea">
	        <h2>적립금</h2>
	        <p>고객님의 사용가능 적립금 금액 입니다.</p>
	    </div>
	
	    <div class="xans-element- xans-myshop xans-myshop-summary ec-base-box gHalf">
	        <ul>
	            <li><strong class="title">총 구매금액</strong> <span class="data">${uvo.getTotal_spend()}원</span></li>
	        </ul>
	        <hr/>
	        <ul>    
	            <li><strong class="title">총 적립금</strong> <span class="data">${uvo.total_mile}원</span></li>
	            <li><strong class="title">사용가능 적립금</strong> <span class="data">${uvo.avail_mile}원</span></li>
	            <li><strong class="title">사용된 적립금</strong> <span class="data">${uvo.used_mile}원</span></li>
	            <li><strong class="title">미가용 적립금</strong> <span class="data">${uvo.unavail_mile}원</span></li>
	        </ul>
	    </div>
	
	    <div class="ec-base-tab">
	        <ul class="menu">
            <c:if test="${tab_type == 'history' }">
	            <li class="selected">
	        </c:if>
            <c:if test="${tab_type != 'history' }">
	            <li>
	        </c:if>
	            	<a href="Controller?type=myshopmileage&tab_type=history&getMile=true">적립내역보기</a>
            	</li>
            <c:if test="${tab_type == 'unavail' }">
	            <li class="selected">
	        </c:if>
            <c:if test="${tab_type != 'unavail' }">
	            <li>
	        </c:if>
	            	<a href="Controller?type=myshopmileage&tab_type=unavail&getMile=true">미가용적립내역보기</a>
            	</li>
	        </ul>
	    </div>
	
	    <div class="xans-element- xans-myshop xans-myshop-historylist">
	        <!--
	            $only_html = no
	            $count = 10
	            $login_page = /member/login.html
	        -->
	        <div class="ec-base-table typeList">
	            <table border="1" summary="">
	                <caption>적립금 내역</caption>
	                <colgroup>
	                    <col style="width:10%" />
	                    <col style="width:10%" />
	                    <col style="width:15%" />
	                    <col style="width:300px" />
	                    <col style="width:15%%" />
	                    <col style="width:10%%" />
	                    <col style="width:10%%" />
	                </colgroup>
	                <thead>
	                    <tr>
	                        <th scope="col">번호</th>
	                        <th scope="col">주문번호</th>
	                        <th scope="col">주문날짜</th>
	                        <th scope="col">주문정보</th>
	                        <th scope="col">주문금액</th>
	                        <th scope="col">적립율</th>
	                        <th scope="col">적립금</th>
	                    </tr>
	                </thead>
		            <c:if test="${o_ar != null }">
	                <tbody class="{$display_history|display} center">
	                <!-- <tbody class="displaynone center"> -->
	                    <!-- for문으로 하나씩 넣어주기 -->
	                    	<c:if test="${tab_type == 'history' }">
	                    		<c:forEach var="ovo" items="${o_ar }" varStatus="idx">
			                    	<tr>
				                        <td>${pvo.getTotalRecord() - ((pvo.getNowPage()-1) * pvo.getNumPerPage() + idx.index)}</td>
				                        <td>${ovo.getOrder_key() }</td>
				                        <td>${ovo.getOrder_dtm() }</td>
				                        <td>${ovo.getProduct_summ() }</td>
			                        	<td>${ovo.getFinal_price() }원</td>
				                        <td>${ovo.getRatio_mile() }%</td>
				                        <td>${ovo.getMile() }원</td>
			                    	</tr>
	                    		</c:forEach>
		                    </c:if>
	                    	<c:if test="${tab_type == 'unavail' }">
	                    		<c:forEach var="ovo" items="${o_ar }" varStatus="idx">
			                    	<tr>
				                        <td>${pvo.getTotalRecord() - ((pvo.getNowPage()-1) * pvo.getNumPerPage() + idx.index)}</td>
				                        <td>${ovo.getOrder_key() }</td>
				                        <td>${ovo.getOrder_dtm() }</td>
				                        <td>${ovo.getProduct_summ() }</td>
			                        	<td>${ovo.getPrimary_price() }원</td>
				                        <td>${ovo.getRatio_mile() }%</td>
				                        <td>${ovo.getMile() }원</td>
			                    	</tr>
	                    		</c:forEach>
		                    </c:if>
	                </tbody>
		        	</c:if>
	            </table>
	            <c:if test="${o_ar == null }">
	            	<p class="message {$display_history_none|display}">적립금 내역이 없습니다.</p>
	        	</c:if>
	        </div>
	    </div>
	</div>
			
	<div class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
		<c:if test="${pvo.getNowPage() <= pvo.getPagePerBlock() }">
			<a href="#">
				<img class="bbsPage" src="/shop/bbs/img/btn_page_first_dis.png" alt="첫 페이지">
			</a>
		</c:if>
		<c:if test="${pvo.getNowPage() > pvo.getPagePerBlock() }">
			<a href="Controller?type=myshopmileage&tab_type=${tab_type }&cPage=1&getMile=true">
				<img class="bbsPage" src="/shop/bbs/img/btn_page_first.png" alt="첫 페이지">
			</a>
		</c:if>
		<c:if test="${pvo.getStartPage() <= pvo.getPagePerBlock() }">
			<a href="#">
				<img class="bbsPage" src="/shop/bbs/img/btn_page_prev_dis.png" alt="이전 페이지">
			</a>
		</c:if>
		<c:if test="${pvo.getStartPage() > pvo.getPagePerBlock() }">
				<a href="Controller?type=myshopmileage&tab_type=${tab_type }&cPage=${pvo.getEndPage()-pvo.getPagePerBlock() }&getMile=true">
					<img class="bbsPage" src="/shop/bbs/img/btn_page_prev.png" alt="이전 페이지">
				</a>
		</c:if>

		<ol class="bbsPage">
			<c:forEach begin="${pvo.getStartPage() }" end="${pvo.getEndPage()}" varStatus="i">
				<li class="xans-record-">
					<c:if test="${pvo.getNowPage().equals(i.index)}">
						<a href="#" class="this">${i.index }</a>
					</c:if>
					<c:if test="${!pvo.getNowPage().equals(i.index)}">
						<a href="Controller?type=myshopmileage&tab_type=${tab_type }&cPage=${i.index }&getMile=true" class="other">${i.index }</a>
					</c:if>
				</li>
			</c:forEach>
		</ol>
		<c:if test="${pvo.getEndPage() >= pvo.getTotalPage() }">
			<a href="#">
				<img class="bbsPage" src="/shop/bbs/img/btn_page_next_dis.png" alt="다음 페이지">
			</a>
		</c:if>
		<c:if test="${pvo.getEndPage() < pvo.getTotalPage() }">
			<a href="Controller?type=myshopmileage&tab_type=${tab_type }&cPage=${pvo.getStartPage()+pvo.getPagePerBlock()}&getMile=true">
				<img class="bbsPage" src="/shop/bbs/img/btn_page_next.png" alt="다음 페이지">
			</a>
		</c:if>
		<c:if test="${pvo.getNowPage() > pvo.getTotalPage()-pvo.getPagePerBlock() }">
			<a href="#">
				<img class="bbsPage" src="/shop/bbs/img/btn_page_last_dis.png" alt="마지막 페이지">
			</a>
		</c:if>
		<c:if test="${pvo.getNowPage() <= pvo.getTotalPage()-pvo.getPagePerBlock() }">
			<a href="Controller?type=myshopmileage&tab_type=${tab_type }&cPage=${pvo.getTotalPage()}&getMile=true" class="last">
				<img class="bbsPage" src="/shop/bbs/img/btn_page_last.png" alt="마지막 페이지">
			</a>
		</c:if>
		
	</div>
			
	<div class="ec-base-help">
	    <h3>적립금 안내</h3>
	    <div class="inner">
	        <ol>
	            <li class="item1">주문으로 발생한 적립금은 구매확정이후 실제 사용 가능한 적립금으로 전환됩니다. 구매확정이전 동안은 미가용 적립금으로 분류됩니다. </li>
	            <li class="item2">미가용 적립금은 반품, 구매취소 등을 대비한 임시 적립금으로 사용가능 적립금으로 전환되기까지 상품구매에 사용하실 수 없습니다.</li>
	            <li class="item3">사용가능 적립금(총적립금 - 사용된적립금 - 미가용적립금)은 상품구매 시 바로 사용가능합니다.</li>
	        </ol>
	    </div>
	</div>