<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<form id="findInfoForm" name="findInfoForm" action="Controller?type=findInfo" method="post" target="_self">
	<input type="hidden" name="f_type" value="true"/>
	<input type="hidden" name="info" value="${param.info }"/>
	<div class="findPw">
		<c:if test="${result_id ne null }">
		<h2 class="boxTitle">아이디 확인</h2>
	  	</c:if>
		<c:if test="${result_pw eq 'Success' }">
		<h2 class="boxTitle">비밀번호 변경</h2>
	 	</c:if>
		<c:if test="${result_pw eq 'Fail' }">
		<h2 class="boxTitle">비밀번호 찾기</h2>
	 	</c:if>
   		<fieldset class="getInfo">
			<legend>비밀번호 변경</legend>
			<ul class="ec-base-desc">
	         	<li class="gBlank20 "></li>
				<c:if test="${param.info eq 'id' }">
					<c:if test="${requestScope.result_id ne null }">
						<li class="id_view ">
							<span class="desc findInfo">
							회원님의 아이디는
								<strong>${requestScope.result_id }</strong>
							입니다.
							</span>
						</li>
					</c:if>
					<c:if test="${requestScope.result_id eq null }">
						<li class="id_view ">
							<span class="desc findInfo">
								해당 정보로 등록된 회원이 없습니다.
							</span>
						</li>
					</c:if>
					
				</c:if>
				<c:if test="${param.info eq 'pw' }">
					<c:if test="${requestScope.pw_change eq null }">
						<c:if test="${requestScope.result_pw eq 'Success' }">
						<input id="pw" name="id" class="lostInput" type="hidden" value="${param.id }"/>
			            <li class="id_view ">
							<strong class="term">비밀번호 변경</strong>
							<span class="desc">
								<input id="pw" name="changePw" class="lostInput" type="password">
							</span>
						</li>
			            <li id="name_view" class="name" style="">
							<strong class="term" id="name_lable">비밀번호 확인</strong>
							<span class="desc">
								<input id="pw_chk" name="pw" class="lostInput" type="password">
							</span>
						</li>
						</c:if>
						<c:if test="${requestScope.result_pw eq 'Fail' }">
			            <li class="id_view ">
							<span class="desc findInfo">
								해당 정보로 등록된 회원이 없습니다.
							</span>
						</li>
						</c:if>
					</c:if>
					<c:if test="${requestScope.pw_change eq 'Success' }">
			            <li class="id_view ">
							<span class="desc">
								비밀번호 변경 완료!
							</span>
						</li>
					</c:if>
				</c:if>
           	</ul>
				<c:if test="${param.info eq 'id' }">
		           	<c:if test="${requestScope.result_id ne null }">
					<div class="ec-base-button gColumn">
		               	<a href="Controller?type=login" class="btnSubmit sizeM">확인</a>
		           	</div>
					</c:if>
		           	<c:if test="${requestScope.result_id eq null }">
						<div class="ec-base-button gColumn">
		               	<a href="Controller?type=index" class="btnSubmit sizeM">확인</a>
		           	</div>
					</c:if>
	           </c:if>
				<c:if test="${param.info eq 'pw' }">
					<c:if test="${requestScope.pw_change eq null }">
						<c:if test="${requestScope.result_pw eq 'Fail' }">
							<div class="ec-base-button gColumn">
				               	<a href="Controller?type=index" class="btnSubmit sizeM">확인</a>
				           	</div>
			            </c:if>
						<c:if test="${requestScope.result_pw eq 'Success' }">
							<div class="ec-base-button gColumn">
				               	<a href="javascript:change_pw()" class="btnSubmit sizeM">변경</a>
				           	</div>
			            </c:if>
		            </c:if>
					<c:if test="${requestScope.pw_change eq 'Success' }">
						<div class="ec-base-button gColumn">
			               	<a href="Controller?type=login" class="btnSubmit sizeM">확인</a>
			           	</div>
		           </c:if>
	           </c:if>
       	</fieldset>
	</div>
</form>