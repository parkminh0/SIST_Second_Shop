<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/functions" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/shop/user/account/css/Login.css"/>    
<!--@css(/_wg/css/login.css)-->

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
	<link rel="stylesheet" href="/shop/layout/css/ec-base-desc.css"/>
	
    <jsp:include page="/layout/base.jsp"/>
</head>
<body>
<c:if test="${param.fail == 1 }">
	<script>
		alert("로그인에 실패했습니다.");
	</script>
</c:if>
<div id="wrap">
    <!-- 상단 디자인 -->
    <!--@import(/_wg/import/header.html)-->
    <jsp:include page="/layout/header/header.jsp"/>
	
	<div id="container" class="left">
	    <!-- 왼쪽 사이드 디자인 -->
		<jsp:include page="/layout/login_side/login_side.jsp"/>
	    <div id="contents" class="left">
	    	<!--  여기부터 콘텐츠 -->
			<div id="titleArea">
			    <h2>로그인</h2>
<!-- 			    <span> -->
<%-- 			        <a href="${sessionScope.prevPage}"><img src="/shop/user/account/img/btn_historyGo.png" width="33" alt="뒤로가기"></a> --%>
<!-- 			    </span> -->
			</div>

			<div class="login_form">
			    <!--
			        $defaultReturnUrl = /index.html
			        $forbidIpUrl = member/adminFail.html
			    -->
			    <div class="user-login">
			    <form id="loginForm" action="Controller?type=login" method="post">
			        <fieldset>
			            <legend>회원로그인</legend>
			            
			            <label class="id ePlaceholder" title="{$login_id_type_text}">
			            	<input id="user_id" name="user_id" class="inputTypeText" type="text" placeholder="아이디"></input>
			            </label>
			            <label class="password ePlaceholder" title="비밀번호" >
			            	<input id="user_pw" name="user_pw" class="inputTypeText" type="password" placeholder="비밀번호" onkeyup="enterkey()"></input>
			            </label>
			            
			            <div class="option">
			                <span class="ssl"><i class="xi-lock-o"></i>보안접속</span>
			            </div>
			            
			            <a  onclick="exe()" class="-btn -block -xl -black" ><i class="xi-fingerprint"></i>로그인</a>
			
			            <ul class="btn">
			                <li><a href="Controller?type=findInfo&info=id" class="-btn -inline -md -white">아이디찾기</a></li>
			                <li><a href="Controller?type=findInfo&info=pw" class="-btn -inline -md -white">비밀번호찾기</a></li>
			                <li><a href="/shop/user/account/SignUp.jsp" class="-btn -inline -md -white">회원가입</a></li>
			            </ul>
			        </fieldset>
			        </form> 
			    </div>
			</div>
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
<script type="text/javascript">
	//로그인 버튼 눌렀을 때 로그인
 	function exe() {
		var id =$("#user_id");
		var pw =$("#user_pw");
		
		if(id.val().trim().length<=0){
			alert("아이디를 입력하세요.");
			id.focus();
			return;
		}
		if(pw.val().trim().length<=0){
			alert("비밀번호를 입력하세요.");
			pw.focus();
			return;
		}
		
		document.forms[0].submit();
	}
 	//엔터키 눌렀을 때 로그인
 	function enterkey() {
 		if (window.event.keyCode == 13) {
 			var id =$("#user_id");
 			var pw =$("#user_pw");
 			
 			if(id.val().trim().length<=0){
 				alert("아이디를 입력하세요.");
 				id.focus();
 				return;
 			}
 			if(pw.val().trim().length<=0){
 				alert("비밀번호를 입력하세요.");
 				pw.focus();
 				return;
 			}
 			
 			document.forms[0].submit();
 	    }
 	}
 	
 	
</script>	
</body>
</html>