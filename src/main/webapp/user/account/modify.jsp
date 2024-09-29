<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- PG크로스브라우징필수내용 -->
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <meta http-equiv="Pragma" content="no-cache" />
    <!-- // PG크로스브라우징필수내용 -->

    <title>기본 레이아웃</title>
	<link rel="stylesheet" href="/shop/layout/css/common.css"/>
    <!-- <link rel="stylesheet" href="/shop/layout/css/layout.css"/> 사용안함 -->
	<!-- <link rel="stylesheet" href="/shop/layout/css/xeicon.css"/> -->
	<link rel="stylesheet" href="/shop/layout/css/ec-base-ui.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-tooltip.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-help.css"/><!-- 
	<link rel="stylesheet" href="/shop/layout/css/ec-base-product.css"/> -->
	<link rel="stylesheet" href="/shop/layout/css/ec-base-paginate.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-tab.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-button.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-box.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-table.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-desc.css"/>
	
    <jsp:include page="/layout/base.jsp"/>
    <!--@css(/css/module/member/edit.css)-->
	 <link rel="stylesheet" href="/shop/user/account/css/edit.css"/>
	<link rel="stylesheet" href="/shop/user/account/css/SignUp.css"/> 
</head>
<body>
<div id="wrap">
    <!-- 상단 디자인 -->
    <!--@import(/_wg/import/header.html)-->
    <jsp:include page="/layout/header/header.jsp"/>

	<div id="container" class="left">
	    <!-- 왼쪽 사이드 디자인 -->
		<jsp:include page="/layout/login_side/login_side.jsp"/>
	    <div id="contents" class="left">
	    	<!--  여기부터 콘텐츠 -->
			<div class="path">
		    <span>현재 위치</span>
		    <ol>
		        <li><a href="/">홈</a></li>
		        <li title="현재 위치"><strong>회원 정보 수정</strong></li>
		    </ol>
		</div>
		
		<div class="titleArea">
		    <h2>회원 정보 수정</h2>
		</div>
		<form id="editForm" name="editForm" action="Controller?type=modify" method="post">
			<input type="hidden" name="u_idx" value="${sessionScope.user_vo.u_idx}"/>
			<input type="hidden" name="chk_modify" value="1"/>
			<div class="xans-element- xans-member xans-member-edit">
			    <h3 class="{$display_base_column_title|display}">기본정보</h3>
			    <p class="required {$display_base_column_title|display}"><img src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif" alt="필수" /> 필수입력사항</p>
			    <div class="ec-base-table typeWrite">
			        <table border="1">
			        <caption>회원 기본정보</caption>
			        <colgroup>
			            <col style="width:150px;" />
			            <col style="width:auto;" />
			        </colgroup>
			        <tbody>
			            <tr class="{$display_use_id|display}">
			                <th class="info" scope="row">아이디 <img src="/shop/user/account/img/ico_required_blue.gif" alt="필수" /></th>
			                <td>
			                	<input id="u_id" name="u_id" readonly="readonly" type="text" value="${sessionScope.user_vo.id}"/>
			                </td>
			            </tr>
			            <tr>
			                <th scope="row">비밀번호 <img src="/shop/user/account/img/ico_required_blue.gif" class="{$display_is_none_certification|display}" alt="필수" /></th>
			                <td>
			                    <div class="eTooltip">
			                    	<input id="passwd1" name="passwd1" autocomplete="off" maxlength="16" value="${sessionScope.user_vo.pw}" type="password">
			                    </div>
			                </td>
			            </tr>
			            <tr class="{$display_is_none_certification|display}">
			                <th scope="row">비밀번호 확인 <img src="/shop/user/account/img/ico_required_blue.gif" alt="필수" /></th>
			                <td>
			                	<input id="passwd" name="passwd" autocomplete="off" maxlength="16" value="" type="password">
			                	<span id="box2"></span>
		                	</td>
			            </tr>
			            <tr class="{$display_name|display}">
			                <th scope="row" id="{$name_title}">이름 <img src="/shop/user/account/img/ico_required_blue.gif" alt="필수" /></th>
			                <td><input id="name" name="name" class="ec-member-name" placeholder="" maxlength="30" value="${sessionScope.user_vo.name}" type="text"></td>
			            </tr>
			            <tr class="{$display_birthday|display}">
			                <th scope="row">생년월일<img src="/shop/user/account/img/ico_required_blue.gif" class="{$display_required_is_birthday|display}" alt="필수" /></th>
							<td>
								
								<input id="birth_year" name="btd" class="inputTypeText" placeholder="" maxlength="4" value="${f:substring(sessionScope.user_vo.btd, 0, 4)}" type="text"> 년 
								<input id="birth_month" name="btd" class="inputTypeText" placeholder="" maxlength="2" value="${f:substring(sessionScope.user_vo.btd, 5, 7)}" type="text"> 월 
								<input id="birth_day" name="btd" class="inputTypeText" placeholder="" maxlength="2" value="${f:substring(sessionScope.user_vo.btd, 8, 10)}" type="text"> 일 
							</td>		            
						</tr>
						<tr class="{$display_is_sex|display}">
			                <th scope="row">성별 <img src="/shop/user/account/img/ico_required_blue.gif" class="{$display_required_sex|display}" alt="필수" /></th>
			                <td>
			                	<c:if test="${sessionScope.user_vo.sex eq null or sessionScope.user_vo.sex eq '0' }">
									<input id="sex1" name="sex" value="0" type="radio" checked="checked">
									<label for="is_solar_calendar0">남성</label>
									<input id="sex2" name="sex" value="woman" type="radio">
									<label for="is_solar_calendar1">여성</label>
			                	</c:if>
			                	<c:if test="${sessionScope.user_vo.sex eq '1'}">
									<input id="sex1" name="sex" value="man" type="radio">
									<label for="is_solar_calendar0">남성</label>
									<input id="sex2" name="sex" value="woman" type="radio" checked="checked">
									<label for="is_solar_calendar1">여성</label>
			                	</c:if>
							</td>
			            </tr>
			            
			            <tr class="{$display_mobile|display}">
			                <th scope="row">휴대전화 <img src="/shop/user/account/img/ico_required_blue.gif" class="{$display_required_cell|display}" alt="필수" /></th>
			                <td>
			                    <input id="phone" name="phone" maxlength="11" placeholder="" value="${sessionScope.user_vo.phone}" type="text">
			               </td>
			            </tr>
			            <tr>
			                <th scope="row">이메일 <img src="/shop/user/account/img/ico_required_blue.gif" alt="필수" /></th>
			                <td>
			                    <input id="s_email" name="email" placeholder="" value="${sessionScope.user_vo.email }" type="text">
			                    <span id="{$emailMsg_id}"></span>
			                </td>
			            </tr>
			            <tr class="{$display_addr|display}">
			                <th scope="row">주소 <img src="/shop/user/account/img/ico_required_blue.gif" alt="필수" /></th>
			                <td>
			                	<ul class="ec-address">
			                		<li id="fmodify_zipcode_wrap" class="ec-address-zipcode">
						                <input id="zip_code" name="zip_code" placeholder="우편번호" type="text" maxlength="14" value="${sessionScope.user_vo.zip_code}"/> 
						                <button id="postBtn" class="btnBasic" onclick="checkPost()" type="button" style="cursor: pointer;">주소검색</button>
						            </li>
						            <li id="fmodify_baseAddr_wrap" class="" style="">
						                <input id="addr" name="addr" placeholder="기본주소" class="inputTypeText" type="text" size="60" maxlength="100" value="${sessionScope.user_vo.addr}">
						            </li>
						            <li id="fmodify_detailAddr_wrap" class="" style="">
						                <input id="addr_detail" name="addr_d" placeholder="상세 주소" class="inputTypeText" type="text" size="60" maxlength="255" value="${sessionScope.user_vo.addr_detail}">
						            </li>
			                	</ul>
			                </td>
			            </tr>
			            
			        </tbody>
			        </table>
			    </div>
			
			    <div class="ec-base-button justify">
			        <a href="#" class="btnSubmitFix sizeM" onclick="edit()">회원정보수정</a>
			        <a href="${sessionScope.prevPage}" class="btnEmFix sizeM">취소</a>
			        <span class="gRight">
			            <a href="#none" class="btnNormal sizeS" onclick="del()">회원탈퇴</a>
			        </span>
			    </div>
			
			    <div class="del_div" id="del_div" style="display: none;">
			       <!--@css(/layout/basic/css/ec-base-layer.css)-->
			        <div class="header">
			            <h3>회원탈퇴</h3>
			        </div>
			        <div class="content" style="padding: 2px 0 ;">
			            <div class="ec-base-box typeMember">
			                <div class="information">
			                    <strong class="title">혜택 내역</strong>
			                    <div class="description">
			                        <ul>
			                            <li id="{$leave_layer_text_id}">탈퇴시 보유하고 있는 적립금은 모두 삭제됩니다.</li>
			                            <li>현재 적립금 : <strong id="mile" class="txtEm">${sessionScope.user_vo.total_mile}</strong></li>
			                        </ul>
			                    </div>
			                </div>
			            </div>
			            <h4 style="margin: 20px 0 10px 0;">회원탈퇴 사유</h4>
			            <div class="ec-base-table typeWrite">
			                <table border="1" summary="">
			                    <caption>회원탈퇴 사유</caption>
			                    <colgroup>
			                        <col style="width:140px;" />
			                        <col style="width:auto;" />
			                    </colgroup>
			                    <tbody>
			                        <tr>
			                            <th scope="row">선택</th>
			                            <td>
			                            	<input type="text" id="del_reason" name="del_reason">
											<select id="sel_reason">
												<option>::선택하세요::</option>
												<option value="탈퇴 후 재가입">탈퇴 후 재가입</option>
												<option value="배송불만">배송불만</option>
												<option value="상품의 다양성/가격 품질 불만">상품의 다양성/가격 품질 불만</option>	
												<option value="">직접 입력</option>
											</select>
			                            </td>
			                        </tr>
			                    </tbody>
			                </table>
			            </div>
			        </div>
			        <div class="ec-base-button">
			            <a href="#none" class="btnSubmitFix sizeS" id="bye">탈퇴</a>
			            <a href="#none" class="btnNormalFix sizeS" id="cancel">취소</a>
			        </div>
			    </div>
			</div>
		</form>
			<!-- 여기까지 -->
        </div>
    </div>
	<!-- 오른쪽 사이드 -->
	<jsp:include page="/layout/side/side.jsp"/>
	<!-- 하단 디자인 -->
    <!--@import(/_wg/import/footer.html)-->
    <jsp:include page="/layout/footer/footer.jsp"/>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
 	
 	
	$("#sel_reason").change(function () {
		//이메일 선택을 변경할 때 
		let thisVal = $(this).val(); //현재 선택된 값
		let thisText = $("#sel_reason option:selected").text();
		$("#del_reason").val(thisVal);
	})

 	$(function(){
 		$("#passwd").bind("keyup",function(){
			let str1 = $("#passwd1").val().trim();
			let str2 = $("#passwd").val().trim();

			
			if(str2.length ==0){
				$("#box2").html("");
			}else if(str1!=str2){
				$("#box2").html("비밀번호가 서로 다릅니다.");
				$("#box2").css('color', 'red');
			}else{
				$("#box2").html("사용 가능한 비밀번호 입니다.");
				$("#box2").css('color', 'blue');
				
			}	
		});
 	});
 	
	//정보수정 함수
 	function edit(){
		let str1 = $("#passwd1").val().trim();
		let str2 = $("#passwd").val().trim();
 		if(str1==''||str2==''){
 			alert("비밀번호를 입력해주세요.");
 			
 			
 		} else if (str1 != str2) {
 			alert("비밀번호를 확인해주세요.")
 			
 		} else {
 			alert("정보 수정이 완료되었습니다.")
 			document.editForm.submit();
 		}
 		
 	}
 	
 	//주소 api
 	 function checkPost() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
// 	                    document.getElementById("addr_extra").value = extraAddr;
	                
	                } else {
// 	                    document.getElementById("addr_extra").value = '';
						console.log("else");
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zip_code').value = data.zonecode;
	                document.getElementById("addr").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("addr_detail").value='';
	                document.getElementById("addr_detail").focus();
	            }
	        }).open();
	    }
 	
 	//회원 탈퇴
 	function del() {
 		let str1 = $("#passwd1").val().trim();
		let str2 = $("#passwd").val().trim();
 		if(str1==''||str2==''){
 			alert("비밀번호를 입력해주세요.");
 			
 			
 		} else if (str1 != str2) {
 			alert("비밀번호를 확인해주세요.")
 			
 		} else {
 		 	$("#del_div").css('display', 'block');
 		 	$("#cancel").click(function () {
 				$("#del_div").css('display', 'none');
			});
 		 	$("#bye").click(function () {
	 			document.editForm.action="Controller?type=signout"
	 			document.editForm.submit();
	 			alert("탈퇴 완료");
			});
 		 	
 		}
 		
 		
 		
	}
 	
</script>	
</body>
</html>