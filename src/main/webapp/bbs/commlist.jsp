<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<link rel="stylesheet" href="css/commentPackage.css"/>
<body>
<div class="xans-element- xans-board xans-board-commentlist-1002 xans-board-commentlist xans-board-1002"><!--
            $delete_page_url = /board/free/comment_del.html
            $delete_success_url = /board/free/read.html
        -->
	<ul class="boardComment">
		<li class="first  xans-record-">
			<div class="commentTop">
				<strong class="name">${cvo.getWriterName() }</strong>
				<span class="date">${cvo.getWrite_date() }</span>
			</div>
			<c:if test="${cvo.getWriter() == uvo.getId()}">
			<span class="button">
				<a href="javascript:;" class="btnNormal " onclick="BOARD_COMMENT.comment_update('2','1',this);">수정</a>
				<a href="javascript:delComm('${cvo.getC_idx() }');" class="btnNormal " onclick="BOARD_COMMENT.comment_delete('/skin-skin5/board/free/comment_del.html?board_no=5&amp;no=2&amp;comment_no=1&amp;page=&amp;return_url=/skin-skin5/board/free/read.html');"><i class="icoDelete"></i> 삭제</a>
			</span>
			</c:if>
			<div class="comment">
				<span id="comment_contents1">${cvo.getContent() }</span>
			</div>
		</li>
	</ul>
</div>

<script>
	function delComm(c_idx){
			if(confirm("해당 댓글을 삭제하시겠습니까?")){
				$.ajax({
					url:"Controller?type=del",
					type:"post",
					data: {
						"c_idx": c_idx,
						"bc_key": <%=bc_key%>,
						"b_idx": <%=b_idx%>,
					},
				}).done(function(data) {
					location.reload();
				});
			}
			
	}
</script>
