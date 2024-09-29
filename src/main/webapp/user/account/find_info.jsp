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
	<link rel="stylesheet" href="/shop/user/account/css/findInfo.css"/>
	
	
    <jsp:include page="/layout/base.jsp"/>
	</head>
	<body>
		<div id="wrap">
    
    		<jsp:include page="/layout/header/header.jsp"/>
	
			<div id="container" class="left">
	    <!-- 왼쪽 사이드 디자인 -->
				<jsp:include page="/layout/login_side/login_side.jsp"/>
		    	<div id="contents" class="left">
	    	<!--  여기부터 콘텐츠 -->
					<div class="titleArea">
						<c:if test="${param.info == 'id' }">
					    <h2>아이디 찾기</h2>
				    	</c:if>
						<c:if test="${param.info == 'pw' }">
					    <h2>비밀번호 찾기</h2>
				    	</c:if>
				    </div>
					<div class="formCss">
						<c:if test="${param.f_type == null }">
							<%@include file="/user/account/findInfo_inputs.jsp" %>
						</c:if>
						<c:if test="${param.f_type != null }">
							<%@include file="/user/account/findInfo_result.jsp" %>
						</c:if>
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
	

<script>
function findInfo(){
	
	if(${param.info == 'pw' }){
		id_e = document.getElementById("id");
		let id = id_e.value.trim();
		if(id.length<1 || id == ''){
			alert("아이디를 입력해주세요.");
			id_e.value = "";
			id_e.focus();
			return;
		}
	}

	name_e = document.getElementById("name");
	let name = name_e.value.trim();
	if(name.length<1 || name == ''){
		alert("이름을 입력해주세요.");
		name_e.value = "";
		name_e.focus();
		return;
	}
	
	let email_e = document.getElementById("name");
	let email = email_e.value.trim();
	if(email.length<1 || email == ''){
		alert("이메일을 입력해주세요.");
		email_e.value = "";
		email_e.focus();
		return;
	}
	
	document.findInfoForm.submit();
}

function change_pw(){
	

	let pw_e = document.getElementById("pw");
	let pw = pw_e.value.trim();
	if(pw.length<1 || pw == ''){
		alert("비밀번호를 입력해주세요.");
		pw_e.value = "";
		pw_e.focus();
		return;
	}
	
	let pw_chk_e = document.getElementById("pw_chk");
	let pw_chk = pw_chk_e.value.trim();
	if(pw_chk.length<1 || pw_chk == ''){
		alert("비밀번호 확인을 완료해주세요.");
		pw_chk_e.value = "";
		pw_chk_e.focus();
		return;
	}
	
	
	document.findInfoForm.submit();
}

</script>


</body>
</html>