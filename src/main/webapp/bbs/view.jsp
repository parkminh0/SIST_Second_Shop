<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/shop/bbs/css/ec-base-table.css" />
<link rel="stylesheet" href="/shop/bbs/css/readPackage.css" />
<link rel="stylesheet" href="/shop/bbs/css/layout.css" />
<link rel="stylesheet" href="/shop/bbs/css/ec-base-button.css" />



</head>
<%
	String b_idx = request.getParameter("b_idx");
	String cPage = request.getParameter("cPage");
	UserVO uvo = (UserVO)session.getAttribute("user_vo");
 %>
	<c:set var="uvo" value="<%=uvo %>" />
<body>
	<div class="xans-element- xans-board xans-board-readpackage-1002 xans-board-readpackage xans-board-1002 ">
		<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
			<div class="path">
				<span>현재 위치</span>
				<ol>
					<li><a href="/skin-skin5">홈</a></li>
			    	<li><a href="/skin-skin5/board/index.html">게시판</a></li>
			    	<c:if test="${param.bc_key == 1 }">
			    		<li title="현재 위치"><strong>자유게시판</strong></li>
			    	</c:if>
			    	<c:if test="${param.bc_key == 2 }">
			    		<li title="현재 위치"><strong>공지사항</strong></li>
			    	</c:if>
			    </ol>
			</div>
			<div class="titleArea">
		    	<c:if test="${param.bc_key == 1 }">
					<h2><font color="#555555">자유게시판</font></h2>
				    <p>자유게시판입니다.</p>
		    	</c:if>
		    	<c:if test="${param.bc_key == 2 }">
					<h2><font color="#555555">공지사항</font></h2>
				    <p>공지사항입니다.</p>
		    	</c:if>
			</div>
		</div>
		<div class="xans-element- xans-board xans-board-read-1002 xans-board-read xans-board-1002">
			<div class="ec-base-table typeWrite ">
				<table border="1" summary="" class="ec-base-table">
					<caption>내용 테이블</caption>
					<colgroup>
						<col style="width:130px;">
						<col style="width:auto;">
					</colgroup>
	
					<tbody>
						<c:set var="b_ar" value="${requestScope.sear}" />
						<c:forEach var="bvos" items="${b_ar }">	
							<c:set var="bvo" value="${bvos }" />
						</c:forEach>
						<tr>
							<th scope="row">제목</th>
							<td>${bvo.getTitle() }</td>
						</tr>
						<tr>
							<th scope="row">작성자</th>
							<td>
								${bvo.getUvo().getName() }
								<span class="displaynone"></span>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<ul class="etcArea">
									<li class="displaynone">
									<li class="">
										<strong>작성일</strong> <span class="txtNum">${bvo.getCrt_dtm() }</span>
									</li>
									<li class="displaynone">
										<strong>추천</strong> <span class="txtNum"> ${bvo.getUp() }<a href="Controller?type=up&b_idx=${bvo.getB_idx() }&cPage=<%=cPage %>&bc_key=${param.bc_key}" class="btnNormal"><img src="//img.echosting.cafe24.com/skin/base/common/btn_icon_recommend.gif" alt=""> 추천하기</a></span>
									</li>
									<li class="">
										<strong>조회수</strong> <span class="txtNum">${bvo.getHit() }</span>
									</li>
								</ul>
								<div class="detail">
									<div class="fr-view fr-view-article">
										<p>${bvo.getContent() }</p>
									</div>
								</div>
							</td>
						</tr>
						<tr class="attach">
							<th scope="row">첨부파일</th>
							<td>
								<c:forEach var="bfvo" items="${bvo.getB_list() }">
									<a href="javascript:down('${bfvo.getF_name()}','${bfvo.getO_name()}')"> ${bfvo.getO_name()} </a>
								</c:forEach>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="ec-base-button ">
				<span class="gLeft">
					<span class="displaynone"></span>
					<a href="Controller?type=bbs&bc_key=<%=bc_key %>&cPage=<%=cPage %>" class="btnNormalFix sizeS">목록</a>
				</span>
				<c:set var="b_ar" value="${requestScope.sear}" />
				<%request.setAttribute("bvo", request.getAttribute("sear")); %>
				<c:if test="${bvo.getU_idx() eq sessionScope.user_vo.getU_idx() }">
					<span class="gRight">
						<a href="javascript:del()" class="btnNormalFix sizeS ">삭제</a>
						<a href="Controller?type=edit&b_idx=${bvo.getB_idx() }&bc_key=<%=bc_key %>&cPage=<%=cPage %>" class="btnEmFix sizeS ">수정</a>
		    		</span>
		    	</c:if>
	    		<c:if test="${sessionScope.user_vo.getAdmin() eq 1 and bvo.getU_idx() ne sessionScope.user_vo.getU_idx() }">
		    		<span class="gRight">
						<a href="javascript:del()" class="btnEmFix sizeS ">삭제</a>
		    		</span>
	    		</c:if>
			</div>
		</div>
		<hr/>
		<c:forEach var="cvo" items="${bvo.getC_list() }">
			<%@include file="/bbs/commlist.jsp" %>
		</c:forEach>
		<div class="ec-base-button typeBG spam displaynone"></div>
	</div>
	<c:if test="${uvo != null }">
		<%@include file='/bbs/commentadd.jsp'%>
	</c:if>
	<form name="frm" action="Controller" method="post">
		<input type="hidden" name="type" value="down" />
		<input type="hidden" name="fname"/>
		<input type="hidden" name="oname"/>
		<input type="hidden" name="source" value="view"/>
		<input type="hidden" name="bc_key" value="<%=bc_key%>" />
		<input type="hidden" name="b_idx" value="<%=b_idx %>" />
		<input type="hidden" name="cPage" value="<%=cPage %>" />
	
	</form>
	
	
	
	<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
	<script>
		function del(){
			location.href = "Controller?type=del&bc_key=<%=bc_key%>&b_idx=<%=b_idx %>&cPage=<%=cPage %>"
		}
		
		function down(fname, oname){
			console.log(fname);
			console.log(oname);
			document.frm.fname.value = fname;
			document.frm.oname.value = oname;
			document.frm.submit();
		}
	</script>
</body>
</html>