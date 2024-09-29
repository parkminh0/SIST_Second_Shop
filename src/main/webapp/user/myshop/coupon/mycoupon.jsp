<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="xans-element- xans-board xans-board-mycouponpackage-1002 xans-board-mycouponpackage xans-board-1002 ">
	<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
		<div class="path">
	  		<span>현재 위치</span>
	  		<ol>
			<li><a href="Controller?type=index">홈</a></li>
			<li><a href="Controller?type=bbs">마이 쇼핑</a></li>
			<li title="현재 위치"><strong>쿠폰</strong></li>
			</ol>
		</div>
	<div class="titleArea">
		<h2><font color="#555555">쿠폰</font> </h2>
		<p>내 쿠폰 목록</p>
	</div>
	</div>
	<c:set var="pvo" value="${requestScope.page }"/>
	<c:set var="mc_ar" value="${requestScope.mc_ar}" />
<div class="ec-base-table typemycoupon gBorder right">
	<table style="text-align: center;" border="1" summary="">
		<caption>상품 게시판 목록</caption>
		<colgroup class="xans-element- xans-board xans-board-mycouponheader-4 xans-board-mycouponheader xans-board-4 ">
			<col style="width:64px;">
			<col style="width:auto;">
			<col style="width:150px;">
			<col style="width:114px;">
			<col style="width:114px;">
			<col style="width:114px;">
			<col style="width:100px;">
			<col style="width:64px;">
		</colgroup>

		<thead class="xans-element- xans-board xans-board-mycouponheader-4 xans-board-mycouponheader xans-board-4 ">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">쿠폰명</th>
				<th scope="col">쿠폰적용 가능 카테고리</th>
				<th scope="col">할인</th>
				<th scope="col">최대할인금액</th>
				<th scope="col">최소 주문 금액</th>
				<th scope="col">사용기한</th>
				<th scope="col">보유수량</th>
			</tr>
		</thead>
       
	    <tbody>
	    	<c:forEach var="cvo" items="${mc_ar }">
	    		<tr>
		    		<td>${cvo.getRnum() }</td>
					<td>${cvo.getC_list().getC_name()}</td>
					<td>${cvo.getC_list().getCategory_key()}</td>
					<td>${cvo.getC_list().getD_price()}${cvo.getC_list().getD_type() }</td>
					<td>${cvo.getC_list().getMax_discount()}</td>
					<td>${cvo.getC_list().getMin_order_price()}</td>
					<td>${cvo.getC_list().getDue_date()}</td>
					<td>${cvo.getC_qty()}</td>
				</tr>
			</c:forEach>
	    </tbody>
	</table>
	</div>
</div>
<c:if test="${mc_ar == null }">
		<p class="xans-element- xans-board xans-board-empty-4 xans-board-empty xans-board-4 message  ">검색결과가 없습니다.</p>
	</c:if>
</div>
  	<p class="right">
  		<a href="javascript:location.href='Controller?type=mycoupon&cPage=${pvo.getNowPage()}&u_idx=${u_idx}'"></a>
  	</p>
<div class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
	<c:if test="${pvo.getNowPage() == 1 }">
	<img class="bbsPage" src="/shop/bbs/img/btn_page_first_dis.png" alt="첫 페이지">
</c:if>
<c:if test="${pvo.getNowPage() != 1 }">
		<a href="Controller?type=mycoupon&u_idx=${u_idx}&cPage=1">
		<img class="bbsPage" src="/shop/bbs/img/btn_page_first.png" alt="첫 페이지">
	</a>
</c:if>
<c:if test="${pvo.getStartPage() < pvo.getPagePerBlock() }">
	<img class="bbsPage" src="/shop/bbs/img/btn_page_prev_dis.png" alt="이전 페이지">
</c:if>
<c:if test="${pvo.getStartPage() >= pvo.getPagePerBlock() }">
		<a href="Controller?type=mycoupon&u_idx=${u_idx}&cPage=${pvo.getEndPage()-pvo.getPagePerBlock() }">
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
		<a href="Controller?type=mycoupon&u_idx=${u_idx}&cPage=${i.index }">${i.index }</a>
			</c:if>
		</li>
	</c:forEach>
</ol>
<c:if test="${pvo.getEndPage() >= pvo.getTotalPage() }">
	<img class="bbsPage" src="/shop/bbs/img/btn_page_next_dis.png" alt="다음 페이지">
</c:if>
<c:if test="${pvo.getEndPage() < pvo.getTotalPage() }">
		<a href="Controller?type=mycoupon&u_idx=${u_idx}&cPage=${pvo.getStartPage()+pvo.getPagePerBlock()}">
		<img class="bbsPage" src="/shop/bbs/img/btn_page_next.png" alt="다음 페이지">
	</a>
</c:if>
<c:if test="${pvo.getNowPage() == pvo.getTotalPage() }">
	<img class="bbsPage" src="/shop/bbs/img/btn_page_last_dis.png" alt="다음 페이지">
</c:if>
<c:if test="${pvo.getNowPage() != pvo.getTotalPage() }">
		<a href="Controller?type=mycoupon&u_idx=${u_idx}&cPage=${pvo.getTotalPage()}">
				<img class="bbsPage" src="/shop/bbs/img/btn_page_last.png" alt="마지막 페이지">
			</a>
		</c:if>
		
	</div>
</div>
