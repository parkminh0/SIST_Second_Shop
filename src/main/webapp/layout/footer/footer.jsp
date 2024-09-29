<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/shop/layout/footer/css/footer.css"/>
<div class="footer_wrap">
    <div id="footer">
    	<jsp:include page="/layout/footer/footers/footer_menu.jsp"/>
    	<jsp:include page="/layout/footer/footers/oper_info.jsp"/>
    	<jsp:include page="/layout/footer/footers/bank_info.jsp"/>
    	<jsp:include page="/layout/footer/footers/deli_info.jsp"/>

        <line/>
        
		<div class="company_map_container">
		    <div class="company">
		        <div class="listBox">
		            <div class="title">
		                <h4>회사정보</h4>
		            </div>
		            <p class="h4_line"></p>
		            <ul>
		                <li><strong>회사명</strong><span>쇼핑몰</span></li>
		                <li><strong>대표</strong><span>허준우</span></li>
		                <li><strong>대표전화</strong><span>01035217803</span></li>
		                <li><strong>팩스</strong><span>01035217803</span></li>
		                <li><strong>주소</strong><span>서울특별시 강남구 테헤란로 134-2(한독빌딩) 8층</span></li>
		            </ul>
		            <ul>
		                <li><strong>사업자 등록번호</strong><span>1234567890</span></li>
		                <li><strong>통신판매업 신고</strong><span>제 2024-쌍용센터-0001호</span></li>
		                <li><strong>개인정보관리책임자</strong><span>허준우 (<a href="#">asher@github.com</a>)</span></li>
		                <li><strong>이메일</strong><span><a href="#"><i class="xi-mail-o"></i> asher@github.com</a></span></li>
		            </ul>   
		        </div>
		    </div>
		    <div class="divider"></div>
		    <div class="map">
		        <div class="title">
		            <h4>오시는 길</h4>
		        </div>
		        <a href="https://www.google.com/maps/place/%ED%95%9C%EB%8F%85%EB%B9%8C%EB%94%A9/data=!4m6!3m5!1s0x357ca1563e76bc39:0x438fa7c6bd828a18!8m2!3d37.499294!4d127.0331883!16s%2Fg%2F1tdjtz7w?hl=ko&entry=ttu" target="_blank"><img src="/shop/layout/footer/img/map.PNG" style="width:600px; height:220px;" /></a>
		    </div>
		</div>
	    <div class="end">
	        <div class="end_inner -frame">
	            <p class="copyright"><i class="xi-copyright"></i> 2024 <strong>쌍용마켙</strong>. ALL RIGHTS RESERVED.</p>
	        </div>
	    </div>
</div>
</div>

