<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script type="text/javascript">
	function sendData(){
		for(var i=0 ; i<document.forms[0].elements.length ; i++){
			if(i>1)
				break;//에디터에 있는 컴포넌트들에 대한 유효성검삭 피하기 위해
					// 탈출한다.
			if(document.forms[0].elements[i].value == ""){
				alert(document.forms[0].elements[i].dataset.str+
						"을 입력하세요");
				document.forms[0].elements[i].focus();
				return;//수행 중단
			}
			document.forms[0].submit();
		}
//		document.forms[0].action = "test.jsp";
		document.forms[0].submit();
	}
</script>
</head>
<body>
	<div class="xans-element- xans-board xans-board-title-1002 xans-board-title xans-board-1002 ">
		<div class="titleArea">
			<%if(bc_key.equals("1")){%>
			<h2><font color="#555555">자유게시판</font> </h2>
			<%} else if(bc_key.equals("2")){ %>
			<h2><font color="#555555">공지사항</font> </h2>
			<%} else if(bc_key.equals("3")){ %>
			<h2><font color="#555555">상품 사용후기</font> </h2>
			<%} else if(bc_key.equals("4")){ %>
			<h2><font color="#555555">상품 Q&A</font> </h2>
			<%} %>
		</div>
	</div>
	<c:set var="uvo" value="${sessionScope.user_vo }"/>
	<div id="bbs">
	<form action="Controller?type=write&bc_key=<%=bc_key %>&cPage=<%=request.getParameter("cPage") %>" method="post" encType="multipart/form-data">

		<table summary="게시판 글쓰기">
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><input type="text" name="title" data-str="제목" size="45"/></td>
				</tr>
				<tr>
					<th>이름:</th>
					<td><input style="background: rgb(215,215,215)" value="${uvo.getName() }" type="text" name="u_idx" data-str="이름" readonly size="12"/></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><textarea name="content" cols="50" data-str="내용" 
							id="content" rows="8"></textarea></td>
				</tr>
				

				<tr>
					<th>첨부파일:</th>
					<td><input type="file" name="file" data-str="첨부파일"/></td>
				</tr>
<!--
				<tr>
					<th>비밀번호:</th>
					<td><input type="password" name="pwd" size="12"/></td>
				</tr>
-->
				<tr>
					<td colspan="2">
						<input type="button" value="보내기" onclick="success();"/>
						<input type="button" value="목록" onclick="javascript:location.href='Controller?type=list&cPage=<%=request.getParameter("cPage") %>&bc_key=<%=request.getParameter("bc_key") %>'"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	<div id="dialog-message" title="게시판 글" style="display:none">
  <p>
    <span class="ui-icon ui-icon-circle-check" style="float:left; margin:0 7px 50px 0;"></span>
    저장 완료!
  </p>
</div>

<script src="bbs/js/summernote-lite.js"></script>
<script src="bbs/js/lang/summernote-ko-KR.js"></script>
<script>
function success() {
    $( "#dialog-message" ).dialog({
      modal: true,
      buttons: {
        Ok: function() {
          $( this ).dialog( "close" );
          sendData();
        }
      }
    });
  }

	$(function(){
		$("#content").summernote({
			lang: "ko-KR",
			width: 750,
			height: 300,
			maxHeight: 400,
			minHeight: 200,
			
			callbacks:{
				onImageUpload:function(files, editor){
					//이미지가 에디터에 추가될 때마다 수행하는 곳!
					//이미지를 첨부하면 배열로 인식된다.
					//이것을 서버로 비동기식 통신을 수행하면
					//서버에 업로드를 시킬 수 있다.
					//console.log("**");
					for(let i=0; i<files.length; i++)
						sendImage(files[i], editor);//이미지를 서버로 보낸다.
				}
			}
		});
		
		$("#content").summernote("lineHeight", 0.7);
	});

	
	function sendImage(file, editor){
		//서버로 파일을 보내기 위해 폼객체 준비
		let frm = new FormData();
		
		//보내고자 하는 자원을 폼에 파라미터 값으로 등록!(추가)
		frm.append("upload",file);//폼 안에 "upload"라는 이름으로
					//전달하고자 하는 파일이 등록되었다.
		
		$.ajax({
			url: "Controller?type=saveImg",
			type: "post",
			data: frm,
			contentType: false,
			processData: false, //위의 내용을 지정해야 일반적인 
								//데이터 전송이 아니라 파일이 첨부됨을
								//증명한다.
			dataType: "json",//서버로부터 받는 자원이 JSON이다.
		}).done(function(data){
			//서버로부터 응답이 도착한 경우
			// 반드시 JSON자료로 받아야 한다.
			//console.log(data.img_url);
			//let image = $("<img>").attr("src",data.img_url);
			//$("#content").summernote("insertNode", image[0]);
			
			//또 다른 방법
			$("#content").summernote(
				"editor.insertImage",data.img_url);
			
		});
	}
</script>
</body>
</html>