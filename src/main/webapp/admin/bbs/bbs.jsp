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
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/ec/v4/dashboard_v4.css?vs=2406261322" charset="utf-8"/>
<link rel="stylesheet" type="text/css" href="//img.echosting.cafe24.com/css/plugin/jquery.mCustomScrollbar.min.css" media="all" charset="utf-8" />

<link rel="stylesheet" type="text/css" href="/shop/admin/css/index.css" media="all" charset="utf-8" />
<link rel="stylesheet" type="text/css" href="/shop/admin/css/productCate.css" media="all" charset="utf-8" />
<style>
.logo{
	margin : 20% 0%;
}
body #content {
    padding-top: 20px;
}
#content {
    width: 100%;
    height: 100%;
    min-height: 750px;
    min-width: 960px;
    padding: 24px 24px 100px;
    vertical-align: top;
    box-sizing: border-box;
}
.mCtrl.typeHeader {
    position: relative;
    z-index: 1;
    margin-bottom: -1px;
}

.mCtrl {
    min-height: 46px;
    padding: 8px;
    border: 1px solid #d9dadc;
    box-sizing: border-box;
    text-align: center;
    background-color: #fff;
}
html:lang(ko) .btnCtrl span {
    font-size: 13px;
}
.btnCtrl span {
    padding: 0 8px;
    border: 1px solid transparent;
    font-size: 12px;
    line-height: 26px;
    color: #fff;
    font-weight: normal;
    background-color: #444b59;
}
.btnCtrl, .btnCtrl span {
    height: 28px;
}
.btnCtrl em.icoLink {
    width: 4px;
    height: 4px;
    margin: -3px 0 0 3px;
    border-top: 1px solid #fff;
    border-right: 1px solid #fff;
    vertical-align: middle;
    -webkit-transform: rotate(45deg);
    -moz-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg);
}
.mBoard.gScroll {
    position: relative;
    overflow: auto;
    border-right: 1px solid #d9dadc;
    border-left: 1px solid #d9dadc;
    background-color: #fff;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    unicode-bidi: isolate;
    border-color: inherit;
}
.mTab.typeNav > ul {
    position: relative;
    height: 44px;
    border: 1px solid #d6dae1;
}
.mTab {
    position: relative;
    zoom: 1;
    margin: 0 0 8px;
}
.mTab.typeNav > ul > li.selected {
    border-top: 2px solid #3971ff;
    background-color: #fff;
    margin: -1px 0 0 0;
}
.mTab.typeNav > ul > li, .mTab.typeNav > ul > li > ul > li {
    float: left;
}
.mTab.typeNav > ul > li, .mTab.typeNav > ul > li > ul > li {
    float: left;
}
.mTab.typeNav > ul > li {
    border-right: 1px solid #d6dae1;
    box-sizing: border-box;
}
</style>
</head>
<%
	BoardCategoryVO[] vvar = null;
	vvar = BbsDAO.bbscategorysearch();
	int[] vvar2 = new int[vvar.length];
	for(int i = 0; i < vvar.length; i++){
		vvar2[i] = BbsDAO.getCount(String.valueOf(i+1));
	}
	
	request.setAttribute("vvar", vvar);
	request.setAttribute("vvar2", vvar2);
%>
<c:set var="ar" value="${requestScope.ar }"/>
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
		            		</ul>
						</div>
					</div>
				</div>
				<div class="subMenu eClone eCustomScrollbar mCustomScrollbar _mCS_3 mCS-autoHide mCS_no_scrollbar">
					<div id="mCSB_3" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 1016px;">
						<div id="mCSB_3_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
            				<div class="depthList">
                				<ul class="depth2">

                                    <li class="selected">
				                        <a id="QA_Lnb_Menu2031" href="Controller?type=adbbs" class="link">
				                            <span class="ellips">게시판 관리</span>
				                        </a>
                    				</li>
                                    <li class="">
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
				<div class="headingArea gSubmain">
					<div class="mTitle">
						<h1>게시판관리</h1>
					</div>
				</div>
				<div class="dashMain">
					<div class="mTitle">
						<h2>서비스 이용 현황</h2>
					</div>
					<div class="mDashGrid gFlex3">
						<div class="grid">
							<div class="mBoard">
								<table border="1" summary="">
									<caption>서비스 이용 현황</caption>
									<colgroup>
										<col style="width: 125px;" />
										<col style="width: auto;" />
									</colgroup>
									<tbody class="right">
										<c:forEach var="bvo" items="${vvar }" varStatus="status">
											<tr>
												<th scope="row">${bvo.getBc_option1() }</th>
												<td><strong class="txtEm">${vvar2[status.index] }</strong><span class="txtLight">개</span></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<div class="section">
					<div class="mTitle">
						<h2>게시판목록</h2>
						<div class="cTip" code="BR.BO.BE.BS.30">
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
					<div class="mState">
                        <div class="gLeft">
							<p class="total">추가 게시판 <strong>0</strong>개 / 총 <strong>0</strong>개</p>
                        </div>
                    </div>
							<div class="mCtrl typeHeader">
                            <div class="gLeft">
								<a href="#none" class="btnNormal" onclick="sendData()"><span><em class="icoDel"></em>삭제</span></a>
                            </div>
                        </div>
                                        <div class="mBoard gScroll gCell">
                        <table border="1" summary="" class="eChkTr">
                            <caption>게시판 목록</caption>
                            <colgroup>
                                <col class="chk"/>
                                <col style="width:90px;"/>
                                <col style="width:230px;"/>
                                <col style="width:80px;"/>
                                <col style="width:110px;"/>
                                <col style="width:90px;"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col"><input type="checkbox" class="allChk" onclick="javascript:check_all('use_board[]', this);"/></th>
                                <th scope="col">대분류</th>
                                <th scope="col">게시판제목</th>
                                <th scope="col">게시판 ID</th>
                                <th scope="col">권한(쓰기/읽기) <div class="cTip eSmartMode" code="BD.BE.220"></div></th>
                                <th scope="col">총 게시글 수</th>
                            </tr>
                            </thead>
							<tbody class="center">
								<c:forEach var="bvo" items="${vvar }" varStatus="status">
									<tr>
										<td><input type="checkbox" class="rowChk" name="use_board[]" value="${status.index+1}"/></td>
										<td>${bvo.getBc_option1() }</td>
										<td class="left"><a href="javascript:open_board_info('1');" class="txtLink">${bvo.getBc_option1() }</a>
										</td>
										<td>${bvo.getBc_key() }</td>
										<c:if test="${bvo.getBc_option1() == '공지사항'}">
											<td>관리자</td>
										</c:if>
										<c:if test="${bvo.getBc_option1() != '공지사항'}">
											<td>관리자/고객</td>
										</c:if>
										<td>${vvar2[status.index] }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
                    </div>
                                            <div class="mCtrl typeFooter">
                            <div class="gLeft">
                                <a href="#none" class="btnNormal" onclick="sendData()"><span><em class="icoDel"></em>삭제</span></a>
                            </div>
                        </div>
                    
                    <span id="admngDebug"><script id="admngEffectScript" type="text/javascript" charset="utf-8" src="https://ad.cafe24.com/adManager/util/javascript/adMngEffect.js?ver=1.0.0"></script><script id="cookieScript" type="text/javascript" charset="utf-8" src="https://ad.cafe24.com/adManager/util/javascript/adMngCookie.js?ver=1.0.0"></script><script id="admngLayerScript" type="text/javascript" charset="utf-8" src="https://ad.cafe24.com/adManager/util/javascript/adMngLayer.js?ver=1.0.0"></script><link id="admngCSS" type="text/css" rel="stylesheet" href="https://ad.cafe24.com/adManager/util/javascript/admngCSS.css?ver=1.0.0"><script id="admngURLLog" type="text/javascript" src="https://ad.cafe24.com/adManager/controller/ConclusionURLAD.php?siteType=malladmin&amp;url=https%3A%2F%2Fsist001.cafe24.com%2Fadmin%2Fphp%2Fshop1%2Fb%2Fboard_admin_l.php"></script><script type="text/javascript" src="https://ad.cafe24.com/adManager/controller/ConclusionAD.php?siteType_ADParam=malladmin&amp;userID_ADParam=sist001&amp;ckStr=&amp;ckAllStr=169,171&amp;ckByMulti=false&amp;ssl=true&amp;admngAreaView=false&amp;charset=utf-8&amp;admngValue=0&amp;dummy=1719812102044&amp;groupIdx_ADParam=2059"></script><script type="text/javascript" src="https://ad.cafe24.com/adManager/controller/ConclusionAD.php?siteType_ADParam=malladmin&amp;userID_ADParam=sist001&amp;ckStr=&amp;ckAllStr=169,171&amp;ckByMulti=false&amp;ssl=true&amp;admngAreaView=false&amp;charset=utf-8&amp;admngValue=0&amp;dummy=1719812102044&amp;groupIdx_ADParam=2060"></script></span><span id="admngSide_2"></span><script id="admng" type="text/javascript" src="//ad.cafe24.com/adManager/logic/WebAnalysis.js?siteType=malladmin&amp;userID=sist001&amp;groupIdx=2059"></script>
                    <span id="admngDebug"></span><span id="admngSide_9"></span><script id="admng" type="text/javascript" src="//ad.cafe24.com/adManager/logic/WebAnalysis.js?siteType=malladmin&amp;userID=sist001&amp;groupIdx=2060"></script>
                </div>
		<!-- 여기까지 content -->
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script type="text/javascript">
function sendData() {
			let items =  document.querySelectorAll('input[name="use_board[]"]:checked');
			
			if(items.length == 0){
				alert("항목을 선택해주세요.");
				return;
			}
			
			let bc_key = [];
			
			items.forEach(function(item) {
				        let bckeys = item.value;
				        bc_key.push(bckeys);
				    });
			
			console.log(bc_key);
			let newUrl = 'Controller?type=adbbsdel&bc_key='+bc_key;
			location.replace(newUrl);
	}
</script>
</body>
</html>