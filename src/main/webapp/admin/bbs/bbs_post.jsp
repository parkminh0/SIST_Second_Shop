<%@page import="dao.BbsDAO"%>
<%@page import="vo.BoardCategoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!--@layout(/layout/basic/main.html)-->
 <%-- <%@ include file="/layout/main.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "//www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" >
<meta http-equiv="Pragma" content="no-cache" >
<meta http-equiv="Expires" content="-1" >
<title>관리자 페이지</title>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/layout_beta.css?vs=2406261322" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/reset_front.css?vs=2406261322" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/suio.css?vs=2406261322" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/dashboard_v3.css?vs=2406261322" charset="utf-8"/>
 <link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/plugin/jquery.mCustomScrollbar.min.css" media="all" charset="utf-8" />
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css"/>
<link rel="stylesheet" type="text/css" href="/shop/admin/css/index.css" media="all" charset="utf-8" />
<link rel="stylesheet" type="text/css" href="/shop/admin/css/productCate.css" media="all" charset="utf-8" />
<style>
.logo{
	margin : 20% 0%;
}
.mTab.typeNav {
    position: relative;
    /* height: 60px; */
    /* padding: 0 24px; */
    border: 1px solid #e2e5ea;
    border-radius: 4px 4px 0 0;
    background-color: #fff;
}

.mTab {
    position: relative;
    zoom: 1;
    margin: 0 0 8px;
}

.mTab.typeNav ul {
    display: flex;
    list-style: none;

    border-bottom: 2px solid #ccc; /* 하단 보더 추가 */
}

.mTab.typeNav ul li {
    flex: 1;
    text-align: center;
    position: relative; /* 자식 요소 중앙 정렬을 위해 position 설정 */
}

.mTab.typeNav ul li a {
    display: block;
    padding: 10px 0;
    color: #1b1e26;
    text-decoration: none;
    line-height: normal; /* 텍스트의 라인 높이를 정상으로 설정 */
    height: 100%;
    box-sizing: border-box; /* 패딩 포함한 높이 계산 */
    position: absolute; /* 자식 요소 중앙 정렬을 위해 position 설정 */
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%); /* 중앙 정렬을 위한 transform */
}

.mTab.typeNav ul li.selected {
    border-bottom: 2px solid blue; /* 선택된 항목 하단 보더 */
}

.mTab.typeNav ul li.selected a {
    color: blue;
}

html, body, div, dl, dt, dd, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, input, textarea, p, blockquote, th, td, img {
    margin: 0;
    padding: 0;
}

body, code {
    font-size: 12px;
    font-family: "Noto Sans KR", "맑은 고딕", "malgun gothic", "Apple SD Gothic Neo", sans-serif;
    color: #1b1e26;
    background-color: #f4f5f8;
    -webkit-text-size-adjust: none;
}

html {
    font-size: 62.5%;
    height: 100%;
}

</style>
</head>
<%
		BoardCategoryVO[] bbbar = null;
		bbbar = BbsDAO.bbscategorysearch();
		
		request.setAttribute("bbbar", bbbar);
%>
<c:set var="bbs_list" value="${sessionScope.bbs_list }"/>
<body>
<div id="wrap" class=" beta">
    <hr class="layout" />
    <div id="container">
        <div id="sidebar">
			<div class="logo">
			    <h1>
			        <a href="Controller?type=adindex">
                    	<img src="/shop/layout/header/img/logo_off_new.png" alt="" class="off -mov" width="200"/>
	                </a>
			    </h1>
			</div>
			<div class="snbArea simple">
				<div id="menuList" class="eCustomScrollbar">
					<div id="mCSB_2" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside">
						<div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;">
							<ul class="menu">
		                    	<li class="">
		                			<a id="QA_Lnb_Menu10258" href="Controller?type=adindex" class="link home" name="홈">홈</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu1681" href="Controller?type=adorder" class="link order" name="주문">주문</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu2056" href="Controller?type=adproduct" class="link product" name="상품">상품</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu6" href="Controller?type=aduser" class="link member" name="고객">고객</a>
		            			</li>
		                        <li class="hasChild show">
		                			<a id="QA_Lnb_Menu7" href="Controller?type=adbbs" class="link board" name="게시판">게시판</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu1250" href="Controller?type=adcoupon" class="link promotion" name="프로모션">쿠폰</a>
		            			</li>
		                       	<li class="hasChild ">
		                			<a id="QA_Lnb_Menu2060" href="Controller?type=adstatistic" class="link calculate" name="통계">통계</a>
		            			</li>
						</div>
					</div>
				</div>
				<div class="subMenu eClone eCustomScrollbar mCustomScrollbar _mCS_3 mCS-autoHide mCS_no_scrollbar">
					<div id="mCSB_3" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 1016px;">
						<div id="mCSB_3_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
            				<div class="depthList">
                				<ul class="depth2">

                                    <li class="">
				                        <a id="QA_Lnb_Menu2031" href="Controller?type=adbbs" class="link">
				                            <span class="ellips">게시판 관리</span>
				                        </a>
                    				</li>
                                    <li class="selected">
				                        <a id="QA_Lnb_Menu10477" href="Controller?type=adbbs_post" class="link ">
				                            <span class="ellips">게시물 관리</span>
				                        </a>
                        			</li>                                                                
                 				</ul>
           					</div>
        				</div>
       				</div>
   				</div>
			</div>
        </div>
        <hr class="layout" />
        <div id="content">
       	<!-- 컨텐츠 시작 -->
           <div id="content">
            <form name="frm" id="frm" method="post">
                <div class="headingArea">
                    <div class="mTitle">
                        <h1>게시물 관리</h1>
                        </div>
                    <div class="mBreadcrumb">
						<ol>
							<li class="home">게시판관리</li>
							<li>게시판</li>
							<li class="now" title="현재 페이지">게시물 관리</li>
						</ol>
					</div>
                </div>

                <div class="mTab typeNav">
                    <ul>
                        <li class="selected"><a href="#none">전체 게시물 보기</a></li>
                    </ul>
                </div>
                

                <div class="section">
                    <div class="mBoard gSmall typeSearch">
                        <table border="1" summary="">
                            <caption>전체게시물 검색</caption>
                            <tbody>
                            <tr>
                                <th scope="row">작성일</th>
                                <td>
                                    <input type="text" id="startDate" class="fText gDate" name="start_date" value="2024-06-01" readonly="">
                                    <a href="javascript:;" id="eStartCalendar" class="btnIcon icoCal"><span>달력보기</span></a> ~
                                    <input type="text" id="endDate" class="fText gDate" name="end_date" value="2024-07-01" readonly="">
                                    <a href="javascript:;" id="eEndCalendar" class="btnIcon icoCal"><span>달력보기</span></a>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row">게시판 선택</th>
                                <td>
                                    <select class="fSelect" id="sel_board_no" name="sel_board_no">
											<option value="0">전체목록</option>
										<c:forEach var="bvo" items="${bbbar }" varStatus="status">
											<option value="${status.index }">${bvo.getBc_option1() }</option>
										</c:forEach>
									</select>
								</td>
                            </tr>
                            <tr>
                                <th scope="row">게시글 찾기</th>
                                <td>
                                    <select id="search" name="search" class="fSelect">
                                        <option value="subject">제목</option>
                                        <option value="content">내용</option>
                                        <option value="writer_name">작성자</option>
                                    </select>
                                    <input type="text" id="search_key" name="search_key" value="" class="fText" style="width:400px;"/>
                                    <span style="display:none;">
                                        <a onclick="searchProduct(0);" class="btnSearch"><span>검색</span></a>
                                    </span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="mButton gCenter">
                        <a id="eBtnSearch" onclick="searchProduct(0);" class="btnSearch"><span>검색</span></a>
                    </div>
                    <input type="hidden" name="page"/>
                </div>
				</form>
              

                <div class="section">
                    <div class="mTitle">
                        <h2>전체 게시물 목록</h2>
                    </div>
							<div class="mState">
								<div class="gRight">
									<select class="fSelect" id="eSearchSort" name="searchSort"
										onchange="view_board('submit');" align="absmiddle">
										<option value="" selected="selected">기본정렬</option>
										<option value="H">조회수많은순</option>
									</select> <select class="fSelect" id="list_limit" name="list_limit"
										onchange="view_board('submit');" align="absmiddle">
										<option value="10" selected="">10개씩보기</option>
										<option value="20">20개씩보기</option>
										<option value="30">30개씩보기</option>
										<option value="50">50개씩보기</option>
										<option value="100">100개씩보기</option>
									</select>
								</div>
							</div>
							<div class="mCtrl typeHeader setting">
								<div class="gLeft">
									<span class="txtLess"><blank></blank></span> <a href="#none"
										class="btnNormal"
										onclick="javascript:delete_choice('delete', '삭제할 게시물을 선택해 주세요.', 'P');"><span><em
											class="icoDel"></em> 삭제</span></a>
									<div class="cTip" code="BR.BO.BA.190">
										<div class="mTooltip gLarge">
											<button type="button" class="icon eTip">도움말</button>
											<div class="tooltip" style="z-index: 1;">
												<div class="content"></div>
												<button type="button" class="close eClose">닫기</button>
												<span class="edge"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="gRight">
                        </div>
                                                <div class="gSetting">
                            <div class="mOpen">
                                <div id="listSubject" class="open">
                                    <strong>목록 표시 설정</strong>
                                    <div class="wrap">
												<ul class="default">
													<li><label><input type="checkbox"
															name="COLUMN_mileage_date" class="fChk" /> 적립금 지급일</label></li>
													<li><label><input type="checkbox"
															name="COLUMN_product_name" class="fChk" /> 상품명</label></li>
													<li><label><input type="checkbox"
															name="COLUMN_order_date" class="fChk" /> 주문일</label></li>
													<li><label><input type="checkbox"
															name="COLUMN_refund_request_date" class="fChk"/>
																환불일</label></li>
												</ul>
											</div>
                                    <div class="footer">
                                        <a href="#none" id="eDisplayColumnSaveBtn" class="btnCtrl"><span>적용</span></a>
                                        <a href="#none" class="btnNormal eClose"><span>닫기</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mBoard gScroll gCell typeList">
                        <table border="1" summary="" class="eChkTr">
                            <caption>전체 게시물 목록</caption>
									<colgroup>
										<col class="chk" />
										<col style="width: 70px;" />
										<col style="width: 120px;" />
										<col style="width: 300px;" />
										<col style="width: 100px;" />
										<col class="date" />
										<col style="width: 100px;" />
									</colgroup>
									<thead>
										<tr>
											<th scope="col"><input type="checkbox" class="allChk"/></th>
											<th scope="col">번호</th>
											<th scope="col">분류</th>
											<th scope="col">제목</th>
											<th scope="col">작성자</th>
											<th scope="col">작성일</th>
											<th scope="col">조회</th>
										</tr>
									</thead>
										<tr>
										<c:forEach var="bbvo" items="${bbs_list }" varStatus="status">
											<tr>
												<td><input type="checkbox" class="rowChk"
													name="use_board[]" value="${status.index+1}" /></td>
												<td>${status.index+1}</td>
												<td>${bbbar[bbvo.getBc_key()-1].bc_option1 }</td>
												<td>${bbvo.getTitle() }</td>
												<td>${bbvo.getU_idx() }</td>
												<td>${bbvo.getCrt_dtm() }</td>
												<td>${bbvo.getHit() }</td>
											</tr>
										</c:forEach>
									</tr>
									</tbody>
								</table>
                                            </div>
							<div class="mCtrl typeFooter">
								<div class="gLeft">
									<span class="txtLess"><blank></blank></span> <a href="#none"
										class="btnNormal"
										onclick="javascript:delete_choice('delete','삭제할 게시물을 선택해 주세요.', 'P');"><span><em
											class="icoDel"></em> 삭제</span></a>
									<div class="cTip" code="BR.BO.BA.190">
										<div class="mTooltip gLarge">
											<div class="tooltip" style="z-index: 1;">
												<div class="content"></div>
												<button type="button" class="close eClose">닫기</button>
												<span class="edge"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="gRight"></div>
							</div>
							<c:set var="page" value="${sessionScope.page}"/>
							<div class="mPaginate">
								<c:if test="${page.getStartPage() >= page.getPagePerBlock()}">
								<a href="#" onclick="searchProduct('${page.getNowPage()-page.getPagePerBlock()}');" class="prev">이전 10페이지</a>
								</c:if>
								<ol>
								<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" varStatus="idx">
								<c:if test="${page.getNowPage() eq idx.index}">
								<li>
									<strong title="현재페이지">${idx.index}</strong>
								</li>
								</c:if>
								<c:if test="${page.getNowPage() ne idx.index}">
								<li>
									<a href="#" onclick="searchProduct('${idx.index}');">${idx.index}</a>
								</li>
								</c:if>
								</c:forEach>
								</ol>
								<c:if test="${page.getEndPage() < page.getTotalPage()}">
								<a href="#" onclick="searchProduct('${page.getNowPage()+page.getPagePerBlock()}');" class="next">다음 10페이지</a>
								</c:if>
							</div>
					</div>
                </div>
			
            <!--미리보기-->
            <div class="mLayer ui-draggable ui-resizable" style="display:none;width:auto;" id="layerPreview">
                <h2>게시글 내용 미리보기</h2>
                <div class="wrap" style="width:400px;height:400px;" id="eBulletinContentWrap">
                    <iframe id="eBulletinContent" frameborder="0" width="400px" height="400px" marginwidth="0" marginheight="0" scrolling="auto"></iframe>
                </div>
                <div class="footer">
                    <a href="#none" class="btnNormal eClose"><span>닫기</span></a>
                </div>
                <button type="button" class="btnClose eClose" id="layerPreviewClose">닫기</button>
            <div class="ui-resizable-handle ui-resizable-e" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-s" style="z-index: 90;"></div><div class="ui-resizable-handle ui-resizable-se ui-icon ui-icon-gripsmall-diagonal-se" style="z-index: 90;"></div></div>
        </div>
		<!-- 여기까지 content -->
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("#startDate").datepicker({
        dateFormat: "yy-mm-dd"
    });
	
	$("#endDate").datepicker({
        dateFormat: "yy-mm-dd"
    });
    
    
});

function searchProduct(cPage){
	//var frm = $("form").serialize();
	let bc_key = $('#sel_board_no').val();
    let search = $("#search_key").val();
    let search_type = $("#search").val();
    let start_date = $("#startDate").val();
    let end_date = $("#endDate").val();
    
    let param = {
        	bc_key: bc_key,
            search: search,
            search_type: search_type,
            start_date: start_date,
            end_date: end_date
        };
	$.ajax({
		type : 'post',
		url : '/shop/admin/bbs/bbsSearchIO.jsp?cPage='+cPage,
		data : param,
	}).done(function(data){
		 location.reload();
	});
}

function sendData() {
    let bc_key = $('#sel_board_no').val();
    let search = $("#search_key").val();
    let search_type = $("#search").val();
    let start_date = $("#startDate").val();
    let end_date = $("#endDate").val();

    let param = {
    	bc_key: bc_key,
        search: search,
        search_type: search_type,
        start_date: start_date,
        end_date: end_date
    };
    
     $.ajax({
        url: "/shop/admin/bbs/bbsSearchIO.jsp",
        type: "POST",
        data: param,
        success: function () {
            location.reload();
        }
    });
}
</script>
</body>
</html>