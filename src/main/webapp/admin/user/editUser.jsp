<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link rel="stylesheet" type="text/css" href="/shop/admin/css/crudProduct.css" media="all" charset="utf-8" />
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
		                        <li class="hasChild show">
		                			<a id="QA_Lnb_Menu2056" href="Controller?type=adproduct" class="link product" name="상품">상품</a>
		            			</li>
		                        <li class="hasChild ">
		                			<a id="QA_Lnb_Menu6" href="Controller?type=aduser" class="link member" name="고객">고객</a>
		            			</li>
		                        <li class="hasChild ">
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
                                	<li class="">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=aduser" class="link ">
				                            <span class="ellips">회원 조회</span>
				                        </a>
                    				</li>                                                                     
                                	<li class="selected ">
				                   		<a id="QA_Lnb_Menu10394" href="Controller?type=edituser" class="link ">
				                            <span class="ellips">회원 정보</span>
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
       	<div class="headingArea">
	        <div class="mTitle">
	        	<c:if test="${requestScope.mode eq 'edit'}">
	        		<h1>상품 수정</h1>
	        		<input type="hidden" value="edit" name="editMode"/>
	        	</c:if>
	        	<c:if test="${requestScope.mode ne 'edit'}">
	            	<h1>회원 정보</h1>
	            	<input type="hidden" value="add" name="editMode"/>
	        	</c:if>
	        </div>
        </div>
<%--         <form name="eProductRegisterForm" id="eProductRegisterForm"> --%>
        	<input type="hidden" name="u_idx" value="${sessionScope.u_vo.u_idx}"/>
    		
			<div class="section" id="QA_register2">
			    <div class="mToggleBar eToggle selected" id="basic">
			        <h2 class="eToggleTitle">기본 정보</h2>
			    </div>
				<div class="toggleArea" style="display:block;">
				    <div class="mBoard typeProduct">
				    	<form id="editForm" name="editForm" action="Controller?type=edituser2" method="post">
				        <table border="1" summary="">
					        <caption>상품 기본 정보</caption>
					        <colgroup>
					            <col class="product">
					            <col style="width:auto">
					        </colgroup>
					        <c:set var="uvo" value="${sessionScope.u_vo }" ></c:set>
					        <tbody>
	                        	<tr>
                					<th scope="row">유저번호</th>
					                <td>
					                    <div class="gIcoShop">
					                        <div class="overlapTip">
					                            <input type="text" name="u_idx" readonly="readonly" class="fText eMarketChecker eHasModifyProductAuth" style="width:400px;" value="${uvo.u_idx}"/>
					                        </div>
					                    </div>
					                </td>
            					</tr>
	                        	<tr>
                					<th scope="row">유저등급</th>
					                <td>
					                    <div class="gIcoShop">
					                        <div class="overlapTip">
					                            <input type="text" name="ug_idx" class="fText eMarketChecker eHasModifyProductAuth" style="width:400px;" 
					                            value="${uvo.ug_idx}"/>
					                        </div>
					                    </div>
					                </td>
            					</tr>
					            <tr>
					                <th scope="row">관리자 여부 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="admin" class="fText eMarketChecker" style="width:400px;" value="${uvo.admin}"/>
					                    </div>
					                </td>
					            </tr>
		                        
					            <tr>
					                <th scope="row">아이디 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="id" class="fText eMarketChecker" style="width:400px;" value="${uvo.id}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">비밀번호 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="pw" class="fText eMarketChecker" style="width:400px;" value="${uvo.pw}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">이름 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="name" class="fText eMarketChecker" style="width:400px;" value="${uvo.name}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">주소 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="addr" class="fText eMarketChecker" style="width:400px;" value="${uvo.addr}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">상세주소 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="addr_detail" class="fText eMarketChecker" style="width:400px;" value="${uvo.addr_detail}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">우편번호 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="zip_code" class="fText eMarketChecker" style="width:400px;" value="${uvo.zip_code}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">성별 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="sex" class="fText eMarketChecker" style="width:400px;" value="${uvo.sex}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">생일 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="btd" class="fText eMarketChecker" style="width:400px;" value="${uvo.btd}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">이메일 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="email" class="fText eMarketChecker" style="width:400px;" value="${uvo.email}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">전화번호 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="phone" class="fText eMarketChecker" style="width:400px;" value="${uvo.phone}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">전체마일리지 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="total_mile" class="fText eMarketChecker" style="width:400px;" value="${uvo.total_mile}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">총사용 마일리지 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="total_spend" class="fText eMarketChecker" style="width:400px;" value="${uvo.total_spend}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">사용가능한 마일리지 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="avail_mile" class="fText eMarketChecker" style="width:400px;" value="${uvo.avail_mile}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">등록일 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="reg_dtm" readonly="readonly" class="fText eMarketChecker" style="width:400px;" value="${uvo.reg_dtm}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">삭제여부 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="del" class="fText eMarketChecker" style="width:400px;" value="${uvo.del}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">삭제일 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="del_dtm" class="fText eMarketChecker" style="width:400px;" value="${uvo.del_dtm}"/>
					                    </div>
					                </td>
					            </tr>
					            <tr>
					                <th scope="row">삭제사유 </th>
					                <td>
					                    <div class="gIcoShop">
					                        <input type="text" name="del_reason" class="fText eMarketChecker" style="width:400px;" value="${uvo.del_reason}"/>
					                    </div>
					                </td>
					            </tr>
        					</tbody>
				        </table>
				        </form>
			        </div>
			    </div>
			</div>
			
			<div class="mButton gCenter">
					<c:if test="${uvo!=null }">
	           		<a  onclick="editUser()" class="btnSubmit" id="eProductRegister"><span>회원수정</span></a>
					<a onclick="deleteUser();" class="btnEm btnPreview" id="eProductRegister"><span>회원탈퇴</span></a>
					</c:if>
		    </div>
	    
		<!-- 여기까지 content -->
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script>
	function editUser() {
	    let chk = confirm("선택한 사용자의 정보를 수정하시겠습니까?");
	    if (!chk)
	        return;
	
	    let form = document.forms['editForm'];
	    
 		let requiredFields = ['ug_idx', 'admin', 'id', 'pw', 'name', 'phone'];
        
        for (let field of requiredFields) {
            if (!form.elements[field].value) {
                alert(field + " 필드를 입력해주세요.");
                return;
            }
        }
        
        requiredFields.forEach(field => {
            if (form.elements[field].value.trim() === '') {
                form.elements[field].value = null;
            }
        });
	    
	    
	    form.elements['total_mile'].value = form.elements['total_mile'].value || "0";
	    form.elements['total_spend'].value = form.elements['total_spend'].value || "0";
	    form.elements['avail_mile'].value = form.elements['avail_mile'].value || "0";
		
	    alert("정보 수정이 완료되었습니다.");
	    form.submit();
	}
	
	// 사용자 탈퇴하기 
	function deleteUser() {
	    let chkDel = confirm("선택한 사용자를 탈퇴 처리하시겠습니까?");
	    if (!chkDel)
	    	return;
	    
        let uidx = $("input[name=u_idx]").val(); 
	
	    $.ajax({
	            url: "/shop/admin/user/userIO.jsp",  
	            type: "post",
	            data: { 
	            	"u_idx": uidx,  
               },
        }).done(function (data) {
        	alert("탈퇴 처리가 완료되었습니다.");
        	location.href="Controller?type=aduser";
        });
	    
	}
</script>
</body>
</html>