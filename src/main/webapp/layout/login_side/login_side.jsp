<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/shop/layout/login_side/css/login_side.css"/>

<div id="left">
    <div class="topBg">고객센터</div>
    
    <!-- 고객센터 -->
    <jsp:include page="/layout/login_side/login_sides/oper_time.jsp"/>
    
    <!-- FAQ -->
<%--     <jsp:include page="/layout/login_side/login_sides/faq.jsp"/> --%>
    
    <!-- 좌측메뉴 -->
    <jsp:include page="/layout/login_side/login_sides/leftMenu.jsp"/>
   
</div>