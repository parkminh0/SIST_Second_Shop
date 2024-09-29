<%@page import="vo.OptionVO"%>
<%@page import="vo.ProductVO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="util.Paging"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="service.FactoryService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.CategoryVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
	
	String category_key = request.getParameter("category_key");
	
	SqlSession ss = FactoryService.getFactory().openSession();

	if (category_key != null){
		String cate1 = request.getParameter("cate1");
		String cate2 = request.getParameter("cate2");

		List<CategoryVO> list = ss.selectList("category.getList", category_key);
		if (list != null){
			pageContext.setAttribute("cate_list", list);
			if (cate2 != null && cate2.equals("yes")){
%>
				<option value="">- 소분류 전체 -</option> 
<%
			} else if (cate1 != null && cate1.equals("yes")) {
%>
				<option value="">- 중분류 전체 -</option> 
<%
			}
%>
			<c:set var="cate_list" value="${cate_list}"/>
			<c:forEach var="category" items="${cate_list}">
				<option value="${category.category_key}">${category.category_name}</option>
			</c:forEach>
<%
		}
	} 
	if (category_key == null) {
		String search_type = request.getParameter("search1");
		String search_text = request.getParameter("search1_text");
		String search2_1 = request.getParameter("search2_1");
		String search2_2 = request.getParameter("search2_2");
		String search2_3 = request.getParameter("search2_3");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String selling = request.getParameter("selling");
		String stock_min = request.getParameter("stock_min");
		String stock_max = request.getParameter("stock_max");
		String soldout_status = request.getParameter("soldout_status");
		String price = request.getParameter("price");
		String price_min = request.getParameter("price_min");
		String price_max = request.getParameter("price_max");
		
		Map<String, String> map = new HashMap<>();
		map.put("search_type", search_type.trim());
		map.put("search_text", search_text.trim());
		map.put("search2_1", search2_1.trim());
		map.put("search2_2", search2_2.trim());
		map.put("search2_3", search2_3.trim());
		map.put("start_date", start_date.trim());
		map.put("end_date", end_date.trim());
		map.put("selling", selling.trim());
		map.put("stock_min", stock_min.trim());
		map.put("stock_max", stock_max.trim());
		map.put("soldout_status", soldout_status.trim());
		map.put("price", price.trim());
		map.put("price_min", price_min.trim());
		map.put("price_max", price_max.trim());
		
		Paging p = new Paging(10, 10);
		String cPage = request.getParameter("cPage");
		//전체페이지 수를 구하기
		p.setTotalRecord(ProductDAO.searchForAdminPaging(map));

		if(cPage != null && !cPage.equals("0")) {
			p.setNowPage(Integer.parseInt(cPage));
		} else {
			p.setNowPage(1);
		}
		
		pageContext.setAttribute("page", p);
		map.put("begin", String.valueOf(p.getBegin()));
		map.put("end", String.valueOf(p.getEnd()));
		ProductVO[] ar = ProductDAO.searchForAdmin(map);
%>

<div class="mBoard typeList gScroll gCell">
	<table border="1" summary="" class="eChkColor">
		<caption>상품 목록</caption>
	 	<colgroup>
		     <col class="chk"/>
	         <col style="width:50px"/>
	         <col style="width:250px"/>
	         <col style="width:100px"/>
	         <col style="width:100px"/>
	         <col style="width:100px"/>
	         <col style="width:100px"/>
	         <col style="width:100px"/>
	         <col style="date"/>
	         <col style="width:50px"/>
   		</colgroup>
	 <thead id="product-list-header">
	     <tr>
	         <th scope="col"><input type="checkbox" id="allChk" class="allChk"/></th>
	         <th scope="col">No</th>
	         <th scope="col">상품명</th>
             <th scope="col">원가</th>
             <th scope="col">판매가</th>
             <th scope="col">분류</th>
             <th scope="col">제조사</th>
             <th scope="col">재고</th>
             <th scope="col">상품등록일</th>            
             <th scope="col">조회수</th>            
     	</tr>
	 </thead>
     <tbody class="center" id="product-list">
<%
		if(ar != null){
%>
		<input type="hidden" name="prod_cnt" value="<%=p.getTotalRecord()%>"/>
<%
			for(ProductVO pvo:ar){
%>
	 	<tr class="ec-product-manage-list">
        	<td>
        		<input type="hidden" class="product_key" value="<%=pvo.getProduct_key()%>"/>
         		<input type="checkbox" class="rowChk _product_no"/>
        	</td>
            <td><%=pvo.getProduct_key() %></td>
            <td>
            	<div class="gGoods gMedium">
                	<div class="mOpen">
	                    <span class="frame eOpenOver">
	                    	<img src="<%=pvo.getImg_url() %>" width="44" height="44" alt=""/>
	                   	</span>
                   	</div>
                    <p>
                    	<a href="Controller?type=adproductcrud&product_key=<%=pvo.getProduct_key()%>" title="새창 열림" class="txtLink eProductDetail ec-product-list-productname"><%=pvo.getProd_name()%></a>
                    </p>
                    <ul class="etc">
<%
						if(pvo.getOption_list() != null){
%>
							<li class="">옵션 <%=pvo.getOption_list().size()%>개</li>
<%
						}
%>
                    </ul>
                </div>
           	</td>
            <td class="right"><%=pvo.getOri_price() %></td>
	        <td class="right"><%=pvo.getCell_price() %></td>
	        <td class="left prdCate"><%=pvo.getCvo().getCategory_name() %></td>
	        <td><%=pvo.getFactory() %></td>
            <td class="right"><%=pvo.getStock() %></td>
            <td><%=pvo.getCreate_dtm() %></td>
            <td class="right"><%=pvo.getView_qty() %></td>
        </tr>
<%
			}
%>
	    </tbody>
	</table>
</div>
<div class="mCtrl typeFooter">
	<div class="gTop">
          	<a href="#" onclick="delete_choice(0)" class="btnNormal _manage_state"><span>판매함</span></a>
       		<a href="#" onclick="delete_choice(1)" class="btnNormal _manage_state"><span>판매안함</span></a>
            <a href="#" onclick="delete_choice(2)" class="btnNormal _manage_delete"><span><em class="icoDel"></em> 삭제</span></a>
            <a href="#" class="btnNormal _manage_category"><span>분류수정<em class="icoLink"></em></span></a>
              <a href="#" class="btnNormal _manage_main_display"><span>메인진열수정<em class="icoLink"></em></span></a>
     		</div>
       <div class="gBottom">
           <a href="Controller?type=adproductcrud" class="btnCtrl eRegProduct"><span>상품등록</span></a>
       </div>
</div>
<div class="mPaginate">
	<c:if test="${page.getStartPage() >= page.getPagePerBlock()}">
	<a href="#" onclick="searchProduct('${page.getNowPage()-page.getPagePerBlock()}');" class="prev">이전 10페이지</a>
	</c:if>
	<ol>
	<c:forEach begin="${page.getStartPage()}" end="${page.getEndPage()}" varStatus="idx">
	<c:if test="${page.getNowPage() eq idx.index}">
	<li>
		<strong title="현재페이지">${idx.index}</strong>
	</li>
	</c:if>
	<c:if test="${page.getNowPage() ne idx.index}">
	<li>
		<a href="#" onclick="searchProduct('${idx.index}');">${idx.index}</a>
	</li>
	</c:if>
	</c:forEach>
	</ol>
	<c:if test="${page.getEndPage() < page.getTotalPage()}">
	<a href="#" onclick="searchProduct('${page.getNowPage()+page.getPagePerBlock()}');" class="next">다음 10페이지</a>
	</c:if>
</div>
<%
		}
	}
	
	ss.close();
%>
