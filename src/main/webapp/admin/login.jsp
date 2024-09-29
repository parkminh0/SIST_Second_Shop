<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="/shop/admin/css/login.css">
</head>
<body>
<c:if test="${param.fail == 1}">
	<script>
		alert("로그인에 실패했습니다.");
	</script>
</c:if>
<form id="loginForm" action="Controller?type=adlogin" method="post">
    <div class="login-container">
        <div class="login-box">
            <div class="avatar"></div>
            <form action="login" method="post">
               	<span class="icon">ID</span>
                <div class="input-group">
                    <label for="email">
                        <input type=text id="user_id" name="user_id" placeholder="ID" required>
                    </label>
                </div>
                <span class="icon">PW</span>
                <div class="input-group">
                    <label for="password">
                        <input type="password" id="user_pw" name="user_pw" onkeyup="enterkey()" placeholder="Password" required>
                    </label>
                </div>
                <button type="submit" class="login-btn">LOGIN</button>
            </form>
        </div>
    </div>
</form>
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