<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 작성</title>
<link rel="stylesheet" href="css/ec-base-button.css"/>
</head>
<body>
<div class="xans-element- xans-board xans-board-commentwrite-1002 xans-board-commentwrite xans-board-1002">
    <fieldset>
        <div class="input">
            <strong>댓글달기</strong>
        </div>
        <div class="commentTop">
            <form id="commentForm" action="Controller" method="post">
                <input type="hidden" name="type" value="commadd">
                <input type="hidden" name="b_idx" value="${param.b_idx}">
                <input type="hidden" name="bc_key" value="${param.bc_key}">
                <input type="hidden" name="writer" value="${uvo.getId()}">
                <div class="view">
                     <textarea id="content" name="content" fw-filter="isFill" fw-label="댓글내용" fw-msg="" style="height: 106px; width: 619px;"></textarea>
                    <button type="submit" class="btnEm sizeL">확인</button>
                </div>
            </form>
        </div>
        <p class="grade displaynone"></p>
    </fieldset>
    </script>
</div>
</body>
</html>