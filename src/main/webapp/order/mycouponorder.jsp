<%@page import="vo.CouponlistVO"%>
<%@page import="dao.UserDAO"%>
<%@page import="util.Paging"%>
<%@page import="service.PagingService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body> 
<%
	PagingService.setPage(100, 3);
	Paging page1 = PagingService.getPage();
	String cPage = request.getParameter("cPage");
	String u_idx = request.getParameter("u_idx");
	String send_price = request.getParameter("send_price");
	String category_key = request.getParameter("category_key"); // 상품의 카테고리 키를 가져옴
	String category_name = UserDAO.mycouponcatename(category_key); // 그렇게 가져온 카테고리 키로 분류를 가져옴
	
	switch (category_name) {
	case "전체":
	    category_name = "0";
	    break;
	case "신발":
	    category_name = "1";
	    break;
	case "의류":
	    category_name = "2";
	    break;
	case "용품":
	    category_name = "3";
	    break;
	default:
	    break;
	    }
	
	page1.setTotalRecord(UserDAO.mycouponcount(u_idx, category_name));
	
	if(cPage != null) {
	
		page1.setNowPage(Integer.parseInt(cPage));
		//이때!
		//게시물을 추출할 때 사용되는 begin과 end가 구해지고
		//시작페이지(startPage)와 끝페이지(endPage)도 구해졌다.
	}else
		page1.setNowPage(1);
	
	// category_name은 분류, 분류와 쿠폰의 카테고리키를 비교해야 원하는 쿠폰만 띄울 수 있다.
	int j = 0;
	CouponlistVO[] mycoupon = UserDAO.mycoupon(u_idx,1, 1000);
	CouponlistVO[] couponlist = null;
	for(CouponlistVO cvo :mycoupon) {
		if(category_name.equals(cvo.getC_list().getCategory_key())) {
			couponlist = UserDAO.mycouponorder(u_idx,category_name,page1.getBegin(), page1.getEnd());
			break;
		}
	}
	
	
	CouponlistVO[] mycouponlist = couponlist;
	
	String c_idx = request.getParameter("c_idx");
	String isApply = request.getParameter("isApply");
	
	request.setAttribute("category_name", category_name);
	request.setAttribute("send_price", send_price);
	request.setAttribute("couponlist", mycouponlist);
	request.setAttribute("u_idx", u_idx);
	request.setAttribute("page", page1);
	request.setAttribute("category_key", category_key);
%>
<div class="modal fade" id="couponModal" tabindex="-1" aria-labelledby="couponModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="couponModalLabel">쿠폰</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- 기존의 쿠폰 테이블 HTML 코드 -->
        <div class="ec-base-table typemycoupon gBorder right">
            <table style="text-align: center;" border="1" summary="">
                <caption>상품 게시판 목록</caption>
                <thead class="xans-element- xans-board xans-board-mycouponheader-4 xans-board-mycouponheader xans-board-4 ">
                    <tr>
                        <th scope="col">번호</th>
                        <th scope="col">쿠폰명</th>
                        <th scope="col">쿠폰적용 가능 카테고리</th>
                        <th scope="col">할인</th>
                        <th scope="col">최대할인금액</th>
                        <th scope="col">최소 주문 금액</th>
                        <th scope="col">사용기한</th>
                        <th scope="col">보유수량</th>
                        <th scope="col">적용/해제</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- JSP 코드 삽입 -->
                    <c:forEach var="cvo" items="${couponlist }" varStatus="status">
                        <c:if test="${not empty cvo.getC_list().getC_idx()}">
                            <tr>
                                <td>${cvo.getRnum() }</td>
                                <td>${cvo.getC_list().getC_name()}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${cvo.getC_list().getCategory_key() == 0}">전체</c:when>
                                        <c:when test="${cvo.getC_list().getCategory_key() == 1}">신발</c:when>
                                        <c:when test="${cvo.getC_list().getCategory_key() == 2}">의류</c:when>
                                        <c:when test="${cvo.getC_list().getCategory_key() == 3}">용품</c:when>
                                    </c:choose>
                                </td>
                                <td>${cvo.getC_list().getD_price()}${cvo.getC_list().getD_type() }</td>
                                <td>${cvo.getC_list().getMax_discount()}</td>
                                <td>${cvo.getC_list().getMin_order_price()}</td>
                                <td>${cvo.getC_list().getDue_date()}</td>
                                <td>${cvo.getC_qty()}</td>
                                <td>
                                    <c:if test="${cvo.getC_qty() > 0 }">
                                        <button id="${status.index }" onclick="toggleCoupon(this, true,${status.index },${cvo.getC_list().getC_idx() })" class="coupon apply" value="${cvo.getC_list().getC_idx() }">적용</button>
                                        <button id="${status.index+1 }" onclick="toggleCoupon(this, false,${status.index },${cvo.getC_list().getC_idx() })" class="coupon cancel" value="${cvo.getC_list().getC_idx() }" style="display: none;">해제</button>
                                        <input type="hidden" id="coupon_status_${status.index }" value="${cvo.getStatus() }"/>
                                        <input type="hidden" data-min="${cvo.getC_list().getC_idx() }" id="coupon_min_${status.index }" value="${cvo.getC_list().getMin_order_price() }"/>
                                        <input type="hidden" data-max="${cvo.getC_list().getC_idx() }" id="coupon_max_${status.index }" value="${cvo.getC_list().getMax_discount() }"/>
                                        <input type="hidden" id="coupon_dis_${status.index }" value="${cvo.getC_list().getD_price() }"/>
                                        <input type="hidden" id="coupon_type_${status.index }" value="${cvo.getC_list().getD_type() }"/>
                                    </c:if>
                                    <c:if test="${cvo.getC_qty() < 1 }">
                                        <button onclick="toggleCoupon(this, true,${status.index },${cvo.getC_list().getC_idx() })" class="coupon apply" value="${cvo.getC_list().getC_idx() }" style="display: none;">적용</button>
                                        <button onclick="toggleCoupon(this, false, ${status.index },${cvo.getC_list().getC_idx() })" class="coupon cancel" value="${cvo.getC_list().getC_idx() }" >해제</button>
                                        <input type="hidden" id="coupon_status_${status.index }" value="${cvo.getStatus() }"/>
                                        <input type="hidden" id="coupon_min_${status.index }" value="${cvo.getC_list().getMin_order_price() }"/>
                                        <input type="hidden" id="coupon_max_${status.index }" value="${cvo.getC_list().getMax_discount() }"/>
                                        <input type="hidden" id="coupon_dis_${status.index }" value="${cvo.getC_list().getD_price() }"/>
                                        <input type="hidden" id="coupon_type_${status.index }" value="${cvo.getC_list().getD_type() }"/>
                                    </c:if>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>
            <table style="text-align: center;" border="1" summary="">
                <caption>상품 게시판 목록</caption>
                <thead class="xans-element- xans-board xans-board-mycouponheader-4 xans-board-mycouponheader xans-board-4 ">
                </tbody>
            </table>
        </div>
      </div>
    </div>
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

	
</script>
</body>
</html>