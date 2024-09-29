<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="header_search">
    <!--
    $product_page=/product/detail.html
    $category_page=/product/list.html
    -->
	<fieldset>
		<legend>검색</legend>
		<input id="keyword" name="keyword" onkeyup="enter()" type="text"/>
		<input type="button" alt="검색" onclick="javascript:search()"/>
	</fieldset>
</div>

<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script>
	function search(){
		let keyword = $("#keyword").val().trim().replace(/^\s+|\s+|\s+$/g,"");
		if(keyword.length == 0 || keyword == ""){
			alert("검색어를 입력하세요.");
			$("#keyword").val("");
			$("#keyword").focus();
			return;
		}
		let viewpath = "Controller?type=searchProd&keyword="+keyword;
		location.href = viewpath;
		
	}
	function enter(){

		if (window.event.keyCode == 13) {
			search();
		}
	}
</script>