<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!------------------------------------------------------------------------------

	### cp794 (카테고리 전체보기) ###

------------------------------------------------------------------------------>

<!--@css(/_wg/_cPack/cp794/style.css)-->
<link rel = "stylesheet" href = "/shop/layout/header/css/category.css">

<div id="d_full_btn" class="category_full">
	<p class="mColor">카테고리 전체보기</p>
    <div id="category-full" class="xans-element- xans-layout xans-layout-category">
        <div class="scrollbar_box mCustomScrollbar _mCS_1 mCS_no_scrollbar">
            <div id="mCSB_1" class="mCustomScrollBox mCS-dark mCSB_vertical mCSB_inside">
            	<div id="mCSB_1_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y">
	            	<!-- 커뮤니티 -->
		            <span class="d1-wrap">
		            <c:set var="c_list" value="${applicationScope.category_list}"/>
					<c:forEach var="category" items="${c_list}" varStatus="idx">
						<c:if test="${category.category_name ne '미분류'}">
						<li class="d1 xans-record- be" style="z-index: 0;">
							<a href="Controller?type=product&category=${category.category_key}&depth=1" class="cate">${category.category_name}</a> <!-- 대분류(남자,여자,키즈) -->
							<div class="d2-wrap">
								<dl>
								<c:forEach var="category_1" items="${category.category_list}" varStatus="idx1">
					            	<dd class="d2 be" style="z-index: 0;">
						            	<a href="Controller?type=product&category=${category_1.category_key}&depth=2">${category_1.category_name}</a> <!-- 중분류(신발,의류,용품) -->
					            		<dl class="d3-wrap" style="display: none;">
						            		<c:forEach var="category_2" items="${category_1.category_list}" varStatus="idx2">
						            			<dd class="d3">
						            				<a href="Controller?type=product&category=${category_2.category_key}&depth=3">${category_2.category_name}</a>
					            				</dd>
						                    </c:forEach>
					            		</dl>
					            	</dd>
								</c:forEach>
								</dl>
							</div>
						</li>
						</c:if>
					</c:forEach>
		            </span>
		            
		            <%-- 기타메뉴 
		            <span class="categorySub etc">
		                <li><a href="/board/index.html">링크</a>기타메뉴
						    <ul>
						        <li><a href="/_wg/_cPack/cp572/dom.html">링크</a>브랜드</li>
						        <li><a href="/_wg/_cPack/cp574/dom.html">링크</a>타임세일</li>
						        <li><a href="/_wg/_cPack/cp570/dom.html">링크</a>카탈로그</li>
						        <li><a href="/_wg/_cPack/cp576/dom.html">링크</a>포토리뷰</li>
						        <li><a href="#none">링크</a>땡처리 특가세일</li>
						        <li><a href="#none">링크</a>금주의 핫아이템</li>
						        <li><a href="#none">링크</a>회원가입혜택</li>
						    </ul>
						</li>
		            </span>
		            --%>
            	</div>
            </div>
        </div><!-- //scrollbar_box -->
        <div class="close">닫기</div> 
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>	
<script>
	$(function(){
		$('#d_full_btn').hover(function(){
		    $('#d_full_btn').addClass('on');
		    $('#category-full').css('display', 'block');
	    }, function(){
		    $('#d_full_btn').removeClass('on');
		    $('#category-full').css('display', '');
	    });
		
		$('.d1').hover(function(){
		    $(this).addClass('on');
		    $(this).css('z-index', '1');
	    }, function(){
		    $(this).removeClass('on');
		    $(this).css('z-index', '0');
	    });
		
		$('dd.d2').hover(function(){
		    $(this).addClass('on');
			$(this).find("dl").css('display', 'block');
	    }, function(){
		    $(this).removeClass('on');
	    	$(this).find("dl").css('display', 'none');
	    });
		
		$('dd.d3').hover(function(){
			$(this).find("dl").css('display', 'block');
	    }, function(){
	    	$(this).find("dl").css('display', 'none');
	    });
	})
</script>