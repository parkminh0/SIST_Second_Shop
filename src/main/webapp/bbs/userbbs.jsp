<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
	<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
		<div class="path">
	  		<span>현재 위치</span>
	  		<ol>
			<li><a href="Controller?type=index">홈</a></li>
			<li><a href="Controller?type=bbs">게시판</a></li>
			<li title="현재 위치"><strong>내 게시물</strong></li>
			</ol>
		</div>
	<div class="titleArea">
		<h2><font color="#555555">내 게시물</font> </h2>
		<p>내 게시물입니다.</p>
	</div>
	</div>
	<c:set var="pvo" value="${requestScope.page }"/>
	<c:set var="ub_ar" value="${requestScope.ub_ar}" />
<div class="ec-base-table typeList gBorder right">
	<table style="text-align: center;" border="1" summary="">
		<caption>상품 게시판 목록</caption>
		<colgroup class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
			<col style="width:64px;">
			<col style="width:auto;">
			<col style="width:114px;">
			<col style="width:150px;">
			<col style="width:64px;">
			<col style="width:64px;">
		</colgroup>

		<thead class="xans-element- xans-board xans-board-listheader-4 xans-board-listheader xans-board-4 ">
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회</th>
				<th scope="col">추천</th>
			</tr>
		</thead>
       
	    <tbody>
			<c:forEach var="bvo" items="${ub_ar}" varStatus="idx">
				<tr ondblclick="javascript:location.href='Controller?type=view&bc_key=<%=bc_key %>&b_idx=${bvo.getB_idx()}&cPage=${pvo.getNowPage() }'">
					<td>${pvo.getTotalRecord() - ((pvo.getNowPage()-1) * pvo.getNumPerPage() + idx.index)}</td>
					<td>
						<a class="bbsClick" href="Controller?type=view&bc_key=<%=bc_key %>&b_idx=${bvo.getB_idx()}&cPage=${pvo.getNowPage() }">
						${bvo.getTitle()}
						<c:if test="${bvo.getC_list().size() > 0}">(${bvo.getC_list().size() })</c:if>
						</a>
					</td>
					<td>${bvo.getUvo().getName()}</td>
					<td>${bvo.getCrt_dtm()}</td>
					<td>${bvo.getHit()}</td>
					<td>${bvo.getUp()}</td>
				</tr>
			</c:forEach>
	    </tbody>
	</table>

	<c:if test="${ub_ar == null }">
		<p class="xans-element- xans-board xans-board-empty-4 xans-board-empty xans-board-4 message  ">검색결과가 없습니다.</p>
	</c:if>
</div>
<div class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">
	<c:if test="${pvo.getNowPage() <= pvo.getPagePerBlock() }">
		<a href="#" class="last page disabled">
			<img src="/shop/product/img/btn_page_first.png" alt="첫 페이지"/>
		</a>
	</c:if>
	<c:if test="${pvo.getNowPage() > pvo.getPagePerBlock() }">
			<a href="Controller?type=userbbs&bc_key=<%=bc_key %>&cPage=1">
				<img src="/shop/product/img/btn_page_first.png" alt="첫 페이지">
			</a>
	</c:if>
	<c:if test="${pvo.getStartPage() < pvo.getPagePerBlock() }">
		<a href="#" class="last page disabled">
				<img src="/shop/product/img/btn_page_prev.png" alt="이전 페이지"/>
		</a>
	</c:if>
		<c:if test="${pvo.getStartPage() >= pvo.getPagePerBlock() }">
			<c:if test="${pvo.getEndPage()%pvo.getPagePerBlock() == 0 }">
				<a href="Controller?type=userbbs&bc_key=<%=bc_key %>&cPage=${pvo.getEndPage()-pvo.getPagePerBlock() }">
			</c:if>
			<c:if test="${pvo.getEndPage()%pvo.getPagePerBlock() != 0 }">
				<a href="Controller?type=userbbs&bc_key=<%=bc_key %>&cPage=${pvo.getEndPage()-pvo.getPagePerBlock() }">
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
						<a href="Controller?type=userbbs&bc_key=<%=bc_key %>&cPage=${i.index }" class="other">${i.index }</a>
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
			<a href="Controller?type=userbbs&bc_key=<%=bc_key %>&cPage=${pvo.getStartPage()+pvo.getPagePerBlock()}">
				<img src="/shop/product/img/btn_page_next.png" alt="다음 페이지"/>
			</a>
		</c:if>
		<c:if test="${pvo.getTotalPage() == 0 || pvo.getNowPage() > pvo.getTotalPage() - (pvo.getTotalPage()%pvo.getPagePerBlock()) }">
			<a href="#" class="last page disabled">
				<img src="/shop/product/img/btn_page_last.png" alt="마지막 페이지"/>
			</a>
		</c:if>
		<c:if test="${pvo.getTotalPage() > 0 && pvo.getNowPage() <= pvo.getTotalPage()- (pvo.getTotalPage()%pvo.getPagePerBlock()) }">
			<a href="Controller?type=userbbs&bc_key=<%=bc_key %>&cPage=${pvo.getTotalPage()}">
				<img src="/shop/product/img/btn_page_last.png" alt="마지막 페이지"/>
			</a>
		</c:if>
		
	</div>
</div>
