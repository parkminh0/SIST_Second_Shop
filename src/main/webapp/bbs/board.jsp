<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="/shop/layout/css/common.css"/>

	<link rel="stylesheet" href="/shop/layout/css/ec-base-ui.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-tooltip.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-help.css"/>

	<link rel="stylesheet" href="/shop/layout/css/ec-base-paginate.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-tab.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-button.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-box.css"/>
	<link rel="stylesheet" href="/shop/layout/css/ec-base-desc.css"/>
	
	<link rel="stylesheet" href="/shop/bbs/css/ec-base-table.css" />
	<link rel="stylesheet" href="/shop/bbs/css/style.css" />
	<link rel="stylesheet" href="/shop/bbs/css/commentPackage.css"/>
	<link rel="stylesheet" href="/shop/bbs/css/summernote-lite.css"/>
	<link rel="stylesheet" href="/shop/layout/css/xeicon.css" />
	
	<style type="text/css">
	</style>
 <%
 	String bc_key = request.getParameter("bc_key");
 	String type = request.getParameter("type");
 	String searchType = request.getParameter("searchType");
 	String keyword = request.getParameter("keyword");
 	
 	if(bc_key.equals("1")){
 		%>
 		<title>자유게시판</title>
 		<%
 	} else if(bc_key.equals("2")){
 		%>
 		<title>공지사항</title>
 		<%
 	} else if(bc_key.equals("3")){
 		%>
 		<title>상품후기</title>
 		<%
 	} else if(bc_key.equals("4")){
 		%>
 		<title>Q&A</title>
 		<%
 	} else if(bc_key.equals("5")){
 		%>
 		<title>내 게시물</title>
	<%} %>
	<jsp:include page="/layout/base.jsp"/>
</head>



<body>
    <jsp:include page="/layout/header/header.jsp"/>
    <div id="container" class="left">
		<jsp:include page="/layout/login_side/login_side.jsp"/>
		<div id="contents" class="left">
		
	    <% if(type.equals("list") || type.equals("search")){ %>
	    	<%@include file='/bbs/list.jsp' %>
		<%} else if(type.equals("view")){%>
	    	<%@include file='/bbs/view.jsp' %>	
		<%} else if(type.equals("write")){%>
	    	<%@include file='/bbs/write.jsp' %>
		<%} else if(type.equals("edit")){%>
	    	<%@include file='/bbs/edit.jsp' %>
		<%} else if(type.equals("userbbs")){%>
	    	<%@include file='/bbs/userbbs.jsp'%>
	    <%} %>
		</div>
	</div>
    <jsp:include page="/layout/footer/footer.jsp"/>
    <jsp:include page="/layout/side/side.jsp"/>



</body>
</html>