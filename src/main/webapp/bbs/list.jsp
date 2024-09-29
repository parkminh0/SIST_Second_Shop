<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="xans-element- xans-board xans-board-listpackage-1002 xans-board-listpackage xans-board-1002 ">
	<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
		<div class="path">
	  		<span>현재 위치</span>
	  		<ol>
			<li><a href="Controller?type=index">홈</a></li>
			<li><a href="Controller?type=bbs">게시판</a></li>
			<%if(bc_key.equals("1")){%>
			<li title="현재 위치"><strong>자유게시판</strong></li>
			<%} else if(bc_key.equals("2")){ %>
			<li title="현재 위치"><strong>공지사항</strong></li>
			<%} else if(bc_key.equals("3")){ %>
			<li title="현재 위치"><strong>상품 사용후기</strong></li>
			<%} else if(bc_key.equals("4")){ %>
			<li title="현재 위치"><strong>상품 Q&A</strong></li>
			<%}%>
			</ol>
		</div>
	<div class="titleArea">
		<%if(bc_key.equals("1")){%>
		<h2><font color="#555555">자유게시판</font> </h2>
		<p>자유게시판입니다.</p>
		<%} else if(bc_key.equals("2")){ %>
		<h2><font color="#555555">공지사항</font> </h2>
		<p>공지사항입니다.</p>
		<%} else if(bc_key.equals("3")){ %>
		<h2><font color="#555555">상품 사용후기</font> </h2>
		<p>상품 사용후기입니다.</p>
		<%} else if(bc_key.equals("4")){ %>
		<h2><font color="#555555">상품 Q&A</font> </h2>
		<p>상품 Q&A입니다.</p>
		<%} %>
	</div>
	</div>
	
   	<%if(type.equals("list")){ %>
		<c:set var="pvo" value="${requestScope.page }"/>
		<c:set var="b_ar" value="${requestScope.b_ar}" />
	<%}else if(type.equals("search")){ %>
		<c:set var="pvo" value="${requestScope.s_page }"/>
		<c:set var="b_ar" value="${requestScope.s_ar}" />
	<%} %>
<div class="xans-element- xans-board xans-board-search-4 xans-board-search xans-board-4 path">
	<fieldset class="boardSearch">
	<legend>게시물 검색</legend>
    <p class="category displaynone"></p>
    <p class="right">
		<select id="search_key" name="search_key" value="content" fw-filter="" fw-label="" fw-msg="">
			<option value="title" ${param.searchType == 'title' ? 'selected' : ''} >제목</option>
			<option value="content" ${param.searchType == 'content' ? 'selected' : ''} >내용</option>
			<option value="name" ${param.searchType == 'name' ? 'selected' : ''} >글쓴이</option>
		</select>
		<input id="search" name="search" fw-filter="" fw-label="" fw-msg="" class="inputTypeText" placeholder="" value="<%if(keyword!=null){%><%=keyword%><%}; %>" type="text"/>
		<a href="javascript:search(1)" class="btnEmFix">찾기</a>
		</p>
	    </fieldset>
	</div>
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
			<c:forEach var="bvo" items="${b_ar}" varStatus="idx">
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

	<c:if test="${b_ar == null }">
	<%-- 	<h1>bc_key: <%=request.getParameter("bc_key") %></h1> --%>
		<p class="xans-element- xans-board xans-board-empty-4 xans-board-empty xans-board-4 message  ">검색결과가 없습니다.</p>
	</c:if>
</div>
	<c:if test="${sessionScope.user_vo != null}">
		<c:if test="${param.bc_key != 2 }">
		  	<p class="right">
		  		<a href="javascript:location.href='Controller?type=write&cPage=${pvo.getNowPage()}&bc_key=<%= bc_key%>'" class="btnEmFix">글쓰기</a>
		  	</p>
	  	</c:if>
		<c:if test="${param.bc_key == 2 && sessionScope.user_vo.getAdmin() == 1}">
		  	<p class="right">
		  		<a href="javascript:location.href='Controller?type=write&cPage=${pvo.getNowPage()}&bc_key=<%= bc_key%>'" class="btnEmFix">글쓰기</a>
		  	</p>
	  	</c:if>
  	</c:if>
<div class="xans-element- xans-board xans-board-paging-1002 xans-board-paging xans-board-1002 ec-base-paginate">

	<c:if test="${pvo.getNowPage() <= pvo.getPagePerBlock() }">
		<a href="#" class="last page disabled">
			<img src="/shop/product/img/btn_page_first.png" alt="첫 페이지"/>
		</a>
	</c:if>
	<c:if test="${pvo.getNowPage() > pvo.getPagePerBlock() }">
		<%if(type.equals("search")){ %>
			<a href="javascript:search(1)">
		<%} else if(type.equals("list")){ %>
			<a href="Controller?type=list&bc_key=<%=bc_key %>&cPage=1">
		<%} %>
				<img src="/shop/product/img/btn_page_first.png" alt="첫 페이지"/>
			</a>
	</c:if>
	<c:if test="${pvo.getStartPage() < pvo.getPagePerBlock() }">
		<a href="#" class="last page disabled">
				<img src="/shop/product/img/btn_page_prev.png" alt="이전 페이지"/>
		</a>
	</c:if>
	<c:if test="${pvo.getStartPage() >= pvo.getPagePerBlock() }">
		<%if(type.equals("search")){ %>
			<c:if test="${pvo.getEndPage()%pvo.getPagePerBlock() == 0 }">
				<a href="javascript:search(${pvo.getEndPage()- pvo.getPagePerBlock() })">
			</c:if>
			<c:if test="${pvo.getEndPage()%pvo.getPagePerBlock() != 0 }">
				<a href="javascript:search(${pvo.getEndPage()-(pvo.getEndPage()%pvo.getPagePerBlock()) })">
			</c:if>
		<%} else if(type.equals("list")){ %>
			<c:if test="${pvo.getEndPage()%pvo.getPagePerBlock() == 0 }">
				<a href="Controller?type=list&bc_key=<%=bc_key %>&cPage=${pvo.getEndPage()-pvo.getPagePerBlock() }">
			</c:if>
			<c:if test="${pvo.getEndPage()%pvo.getPagePerBlock() != 0 }">
				<a href="Controller?type=list&bc_key=<%=bc_key %>&cPage=${pvo.getEndPage()-(pvo.getEndPage()%pvo.getPagePerBlock()) }">
			</c:if>
		<%} %>
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
				<%if(type.equals("search")){ %>
					<a href="javascript:search(${i.index })" class="other">${i.index }</a>
				<%} else if(type.equals("list")){ %>
					<a href="Controller?type=list&bc_key=<%=bc_key %>&cPage=${i.index }" class="other">${i.index }</a>
				<%} %>
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
		<%if(type.equals("search")){ %>
			<a href="javascript:search(${pvo.getStartPage()+pvo.getPagePerBlock()})">
		<%} else if(type.equals("list")){ %>
			<a href="Controller?type=list&bc_key=<%=bc_key %>&cPage=${pvo.getStartPage()+pvo.getPagePerBlock()}">
		<%} %>
			<img src="/shop/product/img/btn_page_next.png" alt="다음 페이지"/>
		</a>
	</c:if>
	
	<c:if test="${pvo.getTotalPage() == 0 || pvo.getNowPage() > pvo.getTotalPage() - (pvo.getTotalPage()%pvo.getPagePerBlock()) }">
		<a href="#" class="last page disabled">
			<img src="/shop/product/img/btn_page_last.png" alt="마지막 페이지"/>
		</a>
	</c:if>
	<c:if test="${pvo.getTotalPage() > 0 && pvo.getNowPage() <= pvo.getTotalPage()- (pvo.getTotalPage()%pvo.getPagePerBlock()) }">
		<%if(type.equals("search")){ %>
			<a href="javascript:search(${pvo.getTotalPage()})" class="last">
		<%} else if(type.equals("list")){ %>
			<a href="Controller?type=list&bc_key=<%=bc_key %>&cPage=${pvo.getTotalPage()}" class="last">
		<%} %>
				<img src="/shop/product/img/btn_page_last.png" alt="마지막 페이지"/>
	    	</a>
	</c:if>

	</div>
</div>

<script>
 function search(tar_page){
	 let searchType = document.getElementById("search_key").value;
	 let keyword = document.getElementById("search").value;
	 location.href = "Controller?type=search&bc_key="+<%=bc_key%>+"&cPage="+tar_page+"&searchType="+searchType+"&keyword="+keyword;
 }
</script>