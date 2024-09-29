<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/shop/layout/css/common.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-ui.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-tooltip.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-help.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-paginate.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-tab.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-button.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-box.css"/>
<link rel="stylesheet" href="/shop/layout/css/ec-base-desc.css"/>
<link rel="stylesheet" href="/shop/bbs/css/ec-base-table.css" />
<link rel="stylesheet" href="/shop/bbs/css/style.css" />
<link rel="stylesheet" href="/shop/bbs/css/board.css" />
<link rel="stylesheet" href="/shop/bbs/css/commentPackage.css"/>
<link rel="stylesheet" href="/shop/bbs/css/summernote-lite.css"/>
<link rel="stylesheet" href="/shop/layout/css/xeicon.css" />
<jsp:include page="/layout/base.jsp"/>
</head>
<c:set var="vvar" value="${requestScope.vvar }"/>
<c:set var="vvar2" value="${requestScope.vvar2 }"/>
<body>
<jsp:include page="/layout/header/header.jsp"/>
	<div id="container" class="left">
		<jsp:include page="/layout/login_side/login_side.jsp" />
		<div id="contents" class="left">

			<div class="path">
				<span>현재 위치</span>
				<ol>
					<li><a href="/skin-skin5">홈</a></li>
					<li title="현재 위치"><strong>커뮤니티</strong></li>
				</ol>
			</div>

			<div class="titleArea">
				<h2>커뮤니티</h2>
			</div>
			<div class="titleImg" style="text-align:center;">
				<!-- 타이틀 이미지 -->
				<img src="/shop/layout/header/img/logo_off_new.png" alt="" width="400" height="200" style="width:50%; height:170px"/>
			</div>

			<div class="board_list">
				<!-- 공지사항 -->
				<c:forEach var="car" items="${vvar2 }" varStatus="status">
					<div class="xans-element- xans-board xans-board-listpackage-1 xans-board-listpackage xans-board-1 board_part ">
						<h3 class="xans-element- xans-board xans-board-title-1 xans-board-title xans-board-1 ">
							<i class="xi-ellipsis-v"></i> ${car.getBc_option1() }</h3>
						<div class="xans-element- xans-board xans-board-list-1 xans-board-list xans-board-1">
							<c:forEach var="bvo" items="${vvar }">
								<c:if test="${car.getBc_key() == bvo.getBc_key()}">
									<ul class="xans-record-">
										<li class="subject"><a
											href="http://localhost:8080/shop/Controller?type=view&bc_key=${status.index+1 }&b_idx=${bvo.getB_idx()}"><i
												class="xi-angle-right-min"></i>${bvo.getTitle()}</a></li>
										<li class="date ">${bvo.getCrt_dtm()}</li>
									</ul>
								</c:if>
							</c:forEach>
						</div>
						<a href="http://localhost:8080/shop/Controller?type=bbs&bc_key=${status.index+1 }" class="more"><i class="xi-bars"></i></a>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="divClear"></div>
	</div>
<jsp:include page="/layout/footer/footer.jsp"/>
<jsp:include page="/layout/side/side.jsp"/>
</body>
</html>