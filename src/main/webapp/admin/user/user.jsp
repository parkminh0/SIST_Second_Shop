<%@page import="dao.UgradeDAO"%>
<%@page import="vo.UgradeVO"%>
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
<link rel="stylesheet" type="text/css" href="/shop/admin/css/user.css" media="all" charset="utf-8" />
<style>
.logo{
	margin : 20% 0%;
}
</style>
</head>
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
		                        <li class="hasChild show">
		                			<a id="QA_Lnb_Menu6" href="Controller?type=aduser" class="link member" name="고객">고객</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu7" href="Controller?type=adbbs" class="link board" name="게시판">게시판</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu1250" href="Controller?type=adcoupon" class="link promotion" name="프로모션">쿠폰</a>
		            			</li>
		                       	<li class="hasChild ">
		                			<a id="QA_Lnb_Menu2060" href="#none" class="link calculate" name="통계">통계</a>
		            			</li>
		                        </div>
					</div>
				</div>
				<div class="subMenu eClone eCustomScrollbar mCustomScrollbar _mCS_3 mCS-autoHide mCS_no_scrollbar">
					<div id="mCSB_3" class="mCustomScrollBox mCS-light mCSB_vertical mCSB_inside" style="max-height: 1016px;">
						<div id="mCSB_3_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position:relative; top:0; left:0;" dir="ltr">
            				<div class="depthList">
                				<ul class="depth2">
                                	<li class="selected ">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=aduser" class="link ">
				                            <span class="ellips">회원 조회</span>
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
                    <h1>고객관리</h1>
                   </div>
            </div>
            <div class="dashMain">
                <div class="mDashPannel">
                    <div class="header">
                        <div class="title">
                            <h2>회원현황</h2>
                        </div>
                    </div>
                    <div class="content">
                        <table border="1" summary="">
                            <caption>회원현황</caption>
                            <colgroup>
                                <col style="width:25%;">
                                <col style="width:25%;">
                                <col style="width:25%;">
                            </colgroup>
                            <thead>
	                            <tr>
	                                <th scope="col">회원
									    <div class="tooltip" style="z-index : 1; ">
									        <div class="content"></div>
									        <span class="edge"></span>
									    </div>
	                                </th>
	                                <th scope="col">탈퇴회원
									    <div class="tooltip" style="z-index : 1; ">
									        <div class="content"></div>
									        <span class="edge"></span>
									    </div>
	                                </th>
	                                <th scope="col">TOTAL
									    <div class="tooltip" style="z-index : 1; ">
									        <div class="content"></div>
									        <span class="edge"></span>
									    </div>
								    </th>
	                            </tr>
                            </thead>
                            <tbody class="right">
	                            <tr>
	                                <td><strong class="underline txtEm"><a>${requestScope.ucvo.cntNotDel}</a></strong> 명</td>
	                                <td><strong class="underline txtEm"><a>${requestScope.ucvo.cntDel}</a></strong> 명</td>
	                                <td><strong class="underline txtEm"><a>${requestScope.ucvo.cntAll}</a></strong> 명</td>
	                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
			</div>
            <form name="mform" method="post" action="">
            	<div class="headingArea">
                    <div class="mTitle">
                    	<h1>회원정보 조회</h1>
                     </div>
                </div>
                <div class="section" id="QA_profile1">
                    <div class="optionArea">
                        <div class="mOption" style="display: block;">
                            <table border="1" summary="">
                                <caption>회원정보 조회</caption>
                                <colgroup>
                                    <col style="width:145px;"/>
                                    <col style="width:auto;"/>
                                    <col style="width:145px;"/>
                                    <col style="width:auto;"/>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th scope="row">개인정보</th>
                                    <td colspan="3">
                                        <select name="search_type" class="fSelect">
                                            <option value="name" selected="selected">이름</option>
                                            <option value="id" >아이디</option>
                                            <option value="email">이메일</option>
                                            <option value="phone">전화번호</option>
                                            <option value="addr">주소</option>
                                        </select>
                                        <input type="text" name="type" value="" class="fText" style="width:130px;"/>
                                    </td>
                               	</tr>
                                <tr>
	                                <th scope="row">회원등급</th>
	                                <td colspan="3">
                                            <select name="grade" class="fSelect">
                                                <option value="0" selected="selected">전체</option>
                                                <c:forEach var="rank" items="${requestScope.ugvo_list}" varStatus="idx">
	                                                <option value="${idx.index+1}">${rank.grade}</option>
                                                </c:forEach>
                                            </select>
                                    </td>
                           		</tr>
 								<tr>
	                                <th scope="row">가입일</th>
	                                <td>
									    <div style="float:left">
									        <span class="gLabel" style="float:left;margin-left:5px;">
										        <input type="date" id="regist_start_date" name="regist_start_date" class="fText gDate" value="" style="width:100px;"/>  
												<span class="ec-mode-common-period-area">~</span>
												<input type="date" id="regist_end_date" name="regist_end_date" class="fText gDate" value="" style="width:100px;"/>
									        </span>
									    </div>
									</td>
									<th scope="row">탈퇴여부</th>
                                    <td>
                                        <label class="gLabel"><input type="radio" name="del" value="2"  class="fChk"/> 전체</label>
                                        <label class="gLabel"><input type="radio" name="del" value="0" checked="checked" class="fChk"/> 탈퇴 X</label>
                                        <label class="gLabel"><input type="radio" name="del" value="1" class="fChk"/> 탈퇴 O</label>
                                    </td>
                           		</tr>
                                <tr>
                                	<th scope="row">나이</th>
									<td>
									    <input type="number" name="age1" value="" class="numberic fText right" style="width:40px;" maxlength="2" min="1"/> 세 
									    <span class="ec-mode-common-period-area">~</span> 
									    <input type="number" name="age2" value="" class="numberic fText right" style="width:40px;" maxlength="2" max="99"/> 세
									</td>                                                                                
									<th scope="row">성별</th>
                                        <td>
                                            <label class="gLabel"><input type="radio" name="gender" value="2" checked="checked" class="fChk"/> 전체</label>
                                            <label class="gLabel"><input type="radio" name="gender" value="0" class="fChk"/> 남</label>
                                            <label class="gLabel"><input type="radio" name="gender" value="1" class="fChk"/> 여</label>
                                        </td>
                                    </tr>
                                    <tr>
	                                    <th scope="row">구매금액/건수</th>
                                        <td colspan="3">
                                            <div style="float:left;">
                                                <select name="sales_type" class="fSelect">
                                                    <option value="" selected="selected">전체</option>
                                                    <option value="1">총 주문금액</option>
                                                    <option value="2">총 주문건수</option>
                                                </select>
                                            </div>
                                            <div id="sales_type_length" style="float:left;margin-left:5px;display:none;">
                                            	<input type="text" name="min_sales_amount" value="" size="8" class="fText right" style="width:65px;"/>
                                                <span class="sales_unit_key" style="display:none">건</span>
                                                <span class="sales_unit_price">원</span>
                                                <span class="ec-mode-common-period-area">~</span>
												<input type="text" name="max_sales_amount" value="" size="8" class="fText right" style="width:65px;"/>
                                                <span class="sales_unit_key" style="display:none">건</span>
                                                <span class="sales_unit_price">원</span>
                                            </div>
                                        </td>
                                   	</tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="mButton gCenter">
                            <a href="#" onclick="doSrchFrm(0);" class="btnSearch"><span>검색</span></a>
                        </div>
                    </div>
                </div>
            </form>
            <div class="section" id="QA_profile2">
                <div class="mTitle">
                    <h2>회원 목록</h2>
                </div>
                <div class="mState">
                    <div class="gLeft">
                        <p class="total">
                            검색결과 <strong>0</strong>건
                        </p>
                    </div>
                </div>
                <div class="mCtrl typeHeader">
                    <div class="gLeft">
                    	<a href="#none" onclick="delete_choice()" class="btnNormal"><span><em class="icoDel"></em> 탈퇴</span></a>
                    </div>
                </div>
                <div id="searchResult" class="searchResult">
	                <!-- 일반보기 -->
	                <div class="mBoard gScroll gCellNarrow typeList">
	                    <table border="1" summary="" class="eChkColor">
	                        <caption>회원 목록</caption>
	                        <colgroup>
	                            <col class="chk"/>
	                            <col class="date"/>
	                            <col style="width:70px"/>
	                            <col style="width:100px;"/>
	                            <col style="width:100px;"/>                                                                                                
	                            <col style="width:120px"/>
	                            <col style="width:60px"/>
	                            <col style="width:60px; "/>
	                            <col style="width:70px"/>                                                                                            
	                            <col style="width:235px"/>
	                        </colgroup>
	                        <thead>
	                        <tr>
	                            <th scope="col"><input id="allChk" type="checkbox" class="allChk"/></th>
	                            <th scope="col">등록일</th>                                                                
								<th scope="col">이름</th>
	                            <th scope="col">아이디</th>
	                            <th scope="col">등급</th>
	                            <th scope="col">전화번호</th>
	                            <th scope="col">성별</th>
	                            <th scope="col">나이</th>
	                            <th scope="col">지역</th>
                                <th scope="col">관련 내역 보기</th>
	                       	</tr>
	                        </thead>
	                        <tbody class="center">
	                                                    
	                        </tbody>
	                    </table>
	                    <p class="empty" style="display:block;">검색된 회원 내역이 없습니다.</p>
	                </div>
	                <div class="mCtrl typeFooter">
	                    <div class="gLeft">
                        	<a href="#" onclick="delete_choice()" class="btnNormal"><span><em class="icoDel"></em> 탈퇴</span></a>
                    	</div>
	                </div>
					<div class="mPaginate">
						<ol>
                            <li><strong title="현재페이지">1</strong></li>
	                    </ol>
					</div>
					<!-- 선택칸 -->
					<div class="section" id="QA_level3">
						<div class="mTile">
							<h2>추가설정</h2>
						</div>
				
						<div class="mBoard gSmall">
							<table border="1" summary="">
								<caption>추가 설정</caption>
								<tbody>
									<tr style="">
										<th scope="row">
											회원등급변경										
										</th>
										<td>
											 선택된 회원을  
											<select id="ugvo_select">
												<c:forEach var="ugvo" items="${requestScope.ugvo_list}">
												<option value="${ugvo.ug_idx }" >${ugvo.grade }</option>
												</c:forEach>
											</select>
											 으로 
											<a onclick="cg()" class="btnNormal">
												<span>등급변경</span>
											</a>
											 합니다. 	
										</td>
									
									</tr>
								</tbody>
							</table>	
						</div>
					
					</div>
				</div>
            </div>
		<!-- 여기까지 content -->
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script>
	$(function(){
		$("select[name=sales_type]").on('change', function(){
			if ($(this).val() == null || $(this).val().length == 0){
				$("div#sales_type_length").css('display', 'none');
			} else if ($(this).val() == 1){
				$("div#sales_type_length").css('display', '');
				$("span.sales_unit_key").css('display', 'none');
				$("span.sales_unit_price").css('display', '');
			} else {
				$("div#sales_type_length").css('display', '');
				$("span.sales_unit_key").css('display', '');
				$("span.sales_unit_price").css('display', 'none');
			}
		});
		
		// 전체 체크박스 체크
	    $("#searchResult").on('click', '#allChk', function() {
	        let p = $(this).closest("th");
	        let idx = $("table.eChkColor thead tr th").index(p);
	        let ar = $("table.eChkColor tbody td:nth-child(" + (idx + 1) + ") input:checkbox");
	        ar.prop("checked", this.checked);
	    });

	    // 밑에 있는 체크박스가 모두 선택되면 전체 체크박스 체크
	    $("#searchResult").on('click', 'tbody input:checkbox', function() {
	        let ar = $("tbody").find(":checkbox");

	        let chk = true;
	        for (let i = 0; i < ar.length; i++) {
	            if (!ar.eq(i).is(":checked")) {
	                chk = false;
	                break;
	            }
	        }
	        $("#allChk").prop("checked", chk);
	    });
	})
	
	function doSrchFrm(cPage){
		var srchFrm = $("form").serialize();
		var now = cPage;
		$.ajax({
			type : 'post',
			url : '/shop/admin/user/searchUser.jsp?cPage='+now,
			data : srchFrm,
		}).done(function(data){
			$("#searchResult").html(data);
			$("p.total strong").text($("input[name=user_cnt]").val());
		});
	}
	
	// 체크한 상품을 삭제하기 
	function delete_choice() {
	    let chk_box = $("tbody input:checkbox:checked");  // 체크된 체크박스들 찾기
	    let u_idx = [];

	    if (chk_box.length == 0)
	    	return;
	    
	    let chkDel = confirm("선택한 사용자를 탈퇴 처리하시겠습니까?");
	    if (!chkDel)
	    	return;
	    
	    chk_box.each(function() {
	        let uidx = $(this).closest("tr").find(".u_idx").val();  // 체크된 체크박스의 부모 tr에서 product_key 값 찾기
	        u_idx.push(uidx);
	    });
	
	    u_idx.forEach(function(uidx) {
	        $.ajax({
	            url: "/shop/admin/user/userIO.jsp",  
	            type: "post",
	            data: { 
	            	"u_idx": uidx,  
                },
	        }).done(function (data) {
	        });
	    });
	    
    	alert("탈퇴 처리가 완료되었습니다.");
    	doSrchFrm(0);
	}
	
	//선택한 회원 등급 변경
	function cg() {
	    let chk_box = $("tbody input:checkbox:checked");
	    let u_idx = [];
	    let ug_idx = $("#ugvo_select").val(); // 선택된 옵션의 값
	    
	    if (chk_box.length == 0)
	    	return;
	    let chkchg = confirm("선택한 사용자의 등급을 변경하시겠습니까?");
	    if (!chkchg)
	    	return;
	    chk_box.each(function() {
	        let uidx = $(this).closest("tr").find(".u_idx").val();  // 체크된 체크박스의 부모 tr에서 product_key 값 찾기
	        u_idx.push(uidx);
	    });
	    u_idx.forEach(function(uidx) {
	        $.ajax({
	            url: "/shop/admin/user/userIO.jsp",  
	            type: "post",
	            data: { 
	                "u_idx": uidx,  
	                "ug_idx": ug_idx ,
	                "type":"cg",
	            },
	        }).done(function (data) {   


	        }).fail(function (jqXHR, textStatus, errorThrown) {
	           
	        });
	    });
	    alert("등급 변경이 완료되었습니다.");
	    doSrchFrm(0);
	    
}
	
</script>
</body>
</html>