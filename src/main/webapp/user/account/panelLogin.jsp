<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/user/account/Login.css"/>        
<div class="loadhtml">

	<div fix id="p_box" ax="main">
		<ul class="login_box">
			<li>
				<h1 class="titlebox"><em></em>로그인이필요합니다.<span ax="boxclose"></span></h1>
				<div class="tab_box" data-target="panel_tab_loginbox">
					<ul class="-clear">
						<li class="active">일반 로그인</li>
						<li>비회원 주문조회</li>
					</ul>
				</div>
				<div class="scrollbar-inner -login">
					<div class="tab_container" data-target="panel_tab_loginbox">
						<ul>
							<li class="active">
								<!-- 회원로그인 -->
								<table class="-panel-tablebox" module="member_login">
									<!--
										$defaultReturnUrl = /index.html
										$forbidIpUrl = member/adminFail.html
									-->
									<caption>회원로그인</caption>
									<colgroup>
										<col style="width:200px !important;"/>
										<col style="width:290px;" />
									</colgroup>
									<tbody>
										<tr>
											<th><i class="fa xi-check-min"></i>아이디</th>
											<td class="-c1"><span><label for="member_id" class="ePlaceholder" title="아이디">{$form.member_id}</label></span></td>
										</tr>
										<tr>
											<th><i class="fa xi-check-min"></i>비밀번호</th>
											<td class="-c1"><span><label for="member_passwd" class="ePlaceholder" title="비밀번호">{$form.member_passwd}</label></span></td>
										</tr>
										<tr>
											<th>&nbsp;</th>
											<td>
												<button class="-btn -black -lg -block" onclick="{$action_func_login}"><i class="fa fa-power-off"></i> &nbsp; 로그인</button>
											</td>
										</tr>
										<tr>
											<th>&nbsp;</th>
											<td>
												<p class="-panel-sns-icons">
													<a href="#none" onclick="{$naver_func_login}" class="{$display_naver|display}"><span class="naver"><i class="xi-naver"></i></span></a>
													<a href="#none" onclick="{$facebook_func_login}" class="{$display_facebook|display}"><span class="facebook"><i class="xi-facebook"></i></span></a>
                                                    <a href="#none" onclick="{$kakao_func_login}" class="{$display_kakao|display}"><span class="kakao"><i class="xi-kakaotalk"></i></span></a>
													<a href="#none" onclick="{$google_func_login}" class="{$display_google|display}"><span class="google"><i class="xi-google-plus"></i></span></a>
													<a href="#none" onclick="{$kakao_func_login}" class="{$display_kakao|display}"><span class="line"><i class="xi-line-messenger"></i></span></a>
												</p>
												<a href="/member/join.html" class="-btn -white -xs">회원가입</a>
												<a href="/member/id/find_id.html" class="-btn -white -xs">아이디찾기</a>
												<a href="/member/passwd/find_passwd_info.html" class="-btn -white -xs">비밀번호 찾기</a>
											</td>
										</tr>
										<tr>
											<th>&nbsp;</th>
											<td class="lock_wr">
												<p>
													{$form.check_save_id}
													{$form.member_check_secret_connect|replace:src="//img.echosting.cafe24.com/design/skin/default/member/ico_access.gif",src="/_wg/img/_ico/ico_lock.gif"}
												</p>
											</td>
										</tr>
										
										<tr>
											<th>&nbsp;</th>
											<td>
												<p class="-text">
													회원가입을 하시면 다양하고 특별한 혜택이 준비되 있습니다.<br />
													즐거운 쇼핑 되시길 바랍니다. 감사합니다.
												</p>
											</td>
										</tr>
									</tbody>
								</table>
							</li>
							<li>
								<!-- 비회원 주문조회 -->
								<table class="-panel-tablebox" module="MyShop_OrderHistoryNologin">
									<!--
										$orderDetailUrl = /myshop/order/detail.html
									-->
									<caption>비회원 주문조회</caption>
									<colgroup>
										<col style="width:200px !important;"/>
										<col style="width:300px;" />
									</colgroup>
									<tbody>
										<tr>
											<th><i class="xi-check-min"></i>{$form_label.order_name}</th>
											<td class="-c1">{$form.order_name}</td>
										</tr>
										<tr>
											<th><i class="xi-check-min"></i>{$form_label.order_id}</th>
											<td class="-c2 -uitrick">
												{$form.order_id}
											</td>
										</tr>
										<tr>
											<th><i class="xi-check-min"></i>{$form_label.order_password}</th>
											<td class="-c1">{$form.order_password}</td>
										</tr>
										<tr>
											<th>&nbsp;</th>
											<td>
												<button type="submit" class="-btn -black -lg -block" ><i class="fa fa-truck"></i> &nbsp; 비회원 주문 조회</button>
											</td>
										</tr>
										<tr>
											<th>&nbsp;</th>
											<td>
												<p class="-text">
													비회원의 경우, 주문시의 주문번호로 주문조회가 가능합니다.<br />
													주문번호는 주문당시 이메일로도 발송되었습니다.
												</p>
											</td>
										</tr>
									</tbody>
								</table>
							</li>
						</ul>
					</div>
				</div>
			</li>
			<p class="-panelBtn displaynone">
				<a href="/member/login.html" class="-btn -black"><i class="fa fa-power-off"></i> &nbsp; 로그인</a>
				<a href="/member/join.html" class="-btn -black">회원가입</a>
				<a href="/member/id/find_id.html" class="-btn -white">아이디찾기</a>
				<a href="/member/passwd/find_passwd_info.html" class="-btn -white">비밀번호 찾기</a>
			</p>
		</ul>
	</div>

</div>

<p class="zabal">으악</p>