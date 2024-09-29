<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<form id="findInfoForm" name="findInfoForm" action="Controller?type=findInfo" method="post" target="_self">
	<input type="hidden" name="f_type" value="true"/>
	<input type="hidden" name="info" value="${param.info }"/>
	<div class="findPw">
		<c:if test="${param.info == 'id' }">
			<h2 class="boxTitle">아이디 찾기</h2>
	  	</c:if>
		<c:if test="${param.info == 'pw' }">
   			<h2 class="boxTitle">비밀번호 찾기</h2>
	 	</c:if>
   		<fieldset class="getInfo">
			<legend>비밀번호 찾기 1단계 정보 입력</legend>
			<ul class="ec-base-desc">
	         	<li class="gBlank20 "></li>
				<c:if test="${param.info == 'pw' }">
	            <li class="id_view ">
					<strong class="term">아이디</strong>
					<span class="desc">
						<input id="id" name="id" class="lostInput" type="text">
					</span>
				</li>
				</c:if>
	            <li id="name_view" class="name" style="">
					<strong class="term" id="name_lable">이름</strong>
					<span class="desc">
						<input id="name" name="name" class="lostInput ec-member-name" type="text" />
					</span>
				</li>
	           	<li id="email_view" class="email" style="">
					<strong class="term">이메일</strong>
					<span class="desc">
						<input id="email" name="email" class="lostInput" type="text" />
					</span>
				</li>
           	</ul>
			<div class="ec-base-button gColumn">
               	<a href="javascript:findInfo()" class="btnSubmit sizeM">확인</a>
           	</div>
       	</fieldset>
	</div>
</form>