<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="left_main_wrap" class="main">    
    <div id="left_main">
		<div class="left_main_inner">
            <!-- 메뉴생성하기 -->
            <ul class="nav categorySub m02 menuOver">
            	<c:set var="c_list" value="${applicationScope.category_list}"/>
				<c:forEach var="category" items="${c_list}" varStatus="idx">
					<c:if test="${category.category_name ne '미분류'}">
					<li class="arrow" id="arrow-${idx.index+1}">
						<a href="Controller?type=product&category=${category.category_key}&depth=1" class="cate">링크</a>${category.category_name} <!-- 대분류(남자,여자,키즈) -->
						<ul>
						<c:forEach var="category_1" items="${category.category_list}" varStatus="idx1">
			            	<li class="arrow" id="arrow-${idx.index+1}-${idx1.index+1}">
				            	<a href="Controller?type=product&category=${category_1.category_key}&depth=2">링크</a>${category_1.category_name} <!-- 중분류(신발,의류,용품) -->
			            		<ul>
			            		<c:forEach var="category_2" items="${category_1.category_list}" varStatus="idx2">
			            			<li>
			            				<a href="Controller?type=product&category=${category_2.category_key}&depth=3">링크</a>${category_2.category_name}
		            				</li>
			                    </c:forEach>
			            		</ul>
			            	</li>
						</c:forEach>
						</ul>
					</li>
					</c:if>
				</c:forEach>
			</ul>
            
            <!-- 화살표 -->
            <div class="more mColor">
            	<i class="xi-angle-down-thin"></i>
            </div>
        </div>
        <!-- 아래 4개 -->
        <div class="left_dummy"></div>
                        
        <!-- 좌측 배너 -->
        <!--@import(/_wg/import/nav_bnr_01.html)-->
        <jsp:include page="/layout/left_main/nav_bnr_01.jsp"/>         

    </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
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