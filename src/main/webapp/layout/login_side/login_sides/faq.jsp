<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--------------------------------------------------------------------------------------------------------------------------------------

    ### XEICON 아이콘 변경방법 ###
    
    • http://webgood.co.kr/board/free/read.html?no=33479&board_no=3 에서 확인해주세요.

--------------------------------------------------------------------------------------------------------------------------------------->
<ul class="JS_faq">
    
    <h4>자주묻는 질문 - FAQ</h4>
    <more><a href="/board/free/list.html?board_no=3"><img src="/shop/layout/login_side/img/btn_+_b_15.gif" alt="more"></a></more>
    
    <li class="arrow" id="arrow1"><a href="#none"><i class="xi-user-o"></i>회원관리</a>
    	<ul>
            <li><a href="#none">가입/탈퇴</a></li>
        	<li><a href="#none">정보확인/수정</a></li>
            <li><a href="#none">회원등급안내</a></li>
            <li><a href="#none">적립금/예치금</a></li>
            <li><a href="#none">쿠폰</a></li>
        </ul>
    </li>
    
    <li class="arrow" id="arrow2"><a href="#none"><i class="xi-credit-card"></i>주문/결제/영수증</a>
    	<ul>
            <li><a href="#none">주문/배송조회</a></li>
            <li><a href="#none">무통장입금</a></li>
            <li><a href="#none">카드결제</a></li>
        	<li><a href="#none">영수증/매출전표</a></li>
        </ul>
    </li>
    
    <li class="arrow" id="arrow3"><a href="#none"><i class="xi-truck"></i>배송/상품/상품평</a>
    	<ul>
            <li><a href="#none">배송진행상태</a></li>
        	<li><a href="#none">배송정보 확인/변경</a></li>
            <li><a href="#none">배송비/기타문의</a></li>
            <li><a href="#none">해외직구</a></li>
            <li><a href="#none">상품/상품평</a></li>
            <li><a href="#none">상품/판매자정보</a></li>
            <li><a href="#none">상품평가/상품평</a></li>
        </ul>
    </li>

    <li class="arrow" id="arrow4"><a href="#none"><i class="xi-box"></i>취소/반품/교환</a>
    	<ul>
            <li><a href="#none">취소 환불정보</a></li>
            <li><a href="#none">취소 신청/철회</a></li>
            <li><a href="#none">반품</a></li>
            <li><a href="#none">반품 신청/철회</a></li>
            <li><a href="#none">반품 배송비/무료반품</a></li>
            <li><a href="#none">반품 환불문의</a></li>
            <li><a href="#none">교환</a></li>
            <li><a href="#none">교환 신청/철회</a></li>
        	<li><a href="#none">교환 배송비/진행상태</a></li>
        </ul>
    </li>

    <li class="arrow" id="arrow5"><a href="#none"><i class="xi-gift-o"></i>이벤트/제휴/기타</a>
    	<ul>
			<li><a href="#none">이벤트</a></li>
			<li><a href="#none">제휴 혜택</a></li>
        	<li><a href="#none">기타</a></li>
        </ul>
    </li>

</ul>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script>
	$(function(){
		$('#arrow1').hover(function(){
		    $('#arrow1').addClass('on');
		    $('#arrow1 > ul').css('display', 'block');
	    }, function(){
		    $('#arrow1').removeClass('on');
		    $('#arrow1 > ul').css('display', 'none');
	    });
		
		$('#arrow2').hover(function(){
		    $('#arrow2').addClass('on');
		    $('#arrow2 > ul').css('display', 'block');
	    }, function(){
		    $('#arrow2').removeClass('on');
		    $('#arrow2 > ul').css('display', 'none');
	    });
		
		$('#arrow3').hover(function(){
		    $('#arrow3').addClass('on');
		    $('#arrow3 > ul').css('display', 'block');
	    }, function(){
		    $('#arrow3').removeClass('on');
		    $('#arrow3 > ul').css('display', 'none');
	    });
		
		$('#arrow4').hover(function(){
		    $('#arrow4').addClass('on');
		    $('#arrow4 > ul').css('display', 'block');
	    }, function(){
		    $('#arrow4').removeClass('on');
		    $('#arrow4 > ul').css('display', 'none');
	    });
		
		$('#arrow5').hover(function(){
		    $('#arrow5').addClass('on');
		    $('#arrow5 > ul').css('display', 'block');
	    }, function(){
		    $('#arrow5').removeClass('on');
		    $('#arrow5 > ul').css('display', 'none');
	    });
	})
</script>
