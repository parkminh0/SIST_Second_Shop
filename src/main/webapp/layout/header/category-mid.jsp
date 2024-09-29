<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--------------------------------------------------------------------------------------------------------------

	### 라인메뉴 ###

	- 수정전 반드시 해당 소스코드를 복사 또는 백업해두시고 수정하시기 바랍니다.
	- 링크가 #none 는 샘플 쇼핑몰이라 없는겁니다. 페이지를 생성하신 뒤 해당 주소를 넣어주시면 되겠습니다.
	- 페이지는 상품분류, 게시글, html 페이지등 다양하게 연결이 가능하십니다.

-------------------------------------------------------------------------------------------------------------->

<ul class="lineMenu menuOver">
	<c:set var="c_list" value="${applicationScope.category_list}"/>
	<c:forEach var="category" items="${c_list}" varStatus="idx">
		<c:if test="${category.category_name ne '미분류' }">
		<li class="arrow" id="arrow-${idx.index+1}">
			<a href="Controller?type=product&category=${category.category_key}&depth=1" class="cate">링크</a>${category.category_name} <!-- 대분류(남자,여자,키즈) -->
			<ul>
			<c:forEach var="category_1" items="${category.category_list}" varStatus="idx1">
	            <li class="arrow" id="arrow-${idx.index+1}-${idx1.index+1}">
	            	<a href="Controller?type=product&category=${category_1.category_key}&depth=2">링크</a>${category_1.category_name} <!-- 중분류(신발,의류,용품) -->
	            	<ul>
	            		<c:forEach var="category_2" items="${category_1.category_list}" varStatus="idx2">
	            			<li><a href="Controller?type=product&category=${category_2.category_key}&depth=3">링크</a>${category_2.category_name}</li>
	                    </c:forEach>
	                </ul>
	            </li>
			</c:forEach>
			</ul>
		</li>
		</c:if>
	</c:forEach>
    <li><a href="Controller?type=bbs&bc_key=4" class="cate">링크</a>상품문의</li>
    <li><a href="Controller?type=bbs&bc_key=3" class="cate">링크</a>구매후기</li>
</ul>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" 
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" 
		crossorigin="anonymous"></script>	
<script>
	$(function(){
		$('.arrow').hover(function(){
		    $(this).addClass('on');
		    $(this).children("ul").css('display', 'block');
	    }, function(){
		    $(this).removeClass('on');
		    $(this).children("ul").css('display', 'none');
	    });
	})
</script>