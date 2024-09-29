<%@page import="vo.OptionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <c:set var="u_idx" value="${sessionScope.user_vo.getU_idx()}" />
    <link rel="icon" href="https://static.toss.im/icons/png/4x/icon-toss-logo.png" />
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>토스페이먼츠 샘플 프로젝트</title>
    <!-- 결제위젯 SDK 추가 -->
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
  </head>
  
<%
	String price= request.getParameter("totalPrice");
	String optionKeysParam = request.getParameter("option_keys");
	String bQtysParam = request.getParameter("b_qtys");
	String u_idx = request.getParameter("u_idx");
    String delivery_msg = request.getParameter("delivery_msg");
    String delivery_price = request.getParameter("delivery_price");
    String d_price = request.getParameter("d_price");
    String destination = request.getParameter("destination");
    String receiver = request.getParameter("receiver");
    String zip_code = request.getParameter("zip_code");
    String receiver_tel = request.getParameter("receiver_tel");
    String order_qty = request.getParameter("order_qty");
    String final_price = request.getParameter("final_price");
    String totalPrice = request.getParameter("totalPrice");
    
    request.setAttribute("u_idx", u_idx);
    request.setAttribute("delivery_msg", delivery_msg);
    request.setAttribute("delivery_price", delivery_price);
    request.setAttribute("d_price", d_price);
    request.setAttribute("destination", destination);
    request.setAttribute("receiver", receiver);
    request.setAttribute("zip_code", zip_code);
    request.setAttribute("receiver_tel", receiver_tel);
    request.setAttribute("order_qty", order_qty);
    request.setAttribute("final_price", final_price);
    request.setAttribute("totalPrice", totalPrice);
	request.setAttribute("option_keys",optionKeysParam);
	request.setAttribute("b_qtys",bQtysParam);
	
%>
<span id="price" style="display: none;"><%=price %></span>
  <body>
    <!-- 주문서 영역 -->
    <div class="wrapper">
      <div class="box_section" style="padding: 40px 30px 50px 30px; margin-top: 30px; margin-bottom: 50px">
        <!-- 결제 UI -->
        <div id="payment-method"></div>
        <!-- 이용약관 UI -->
        <div id="agreement"></div>
        <!-- 결제하기 버튼 -->
		<button class="button" id="payment-button" style="margin-top: 30px" disabled>결제하기</button>
      </div>
    </div>
  </body>

<script>
    const button = document.getElementById("payment-button");
    const generateRandomString = () => window.btoa(Math.random()).slice(0, 20);
    var amount = document.getElementById("price").innerText;
    // ------  결제위젯 초기화 ------
    // TODO: clientKey는 개발자센터의 결제위젯 연동 키 > 클라이언트 키로 바꾸세요.
    // TODO: 구매자의 고유 아이디를 불러와서 customerKey로 설정하세요. 이메일・전화번호와 같이 유추가 가능한 값은 안전하지 않습니다.
    // @docs https://docs.tosspayments.com/reference/widget-sdk#sdk-설치-및-초기화
    const clientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
    const customerKey = generateRandomString();
    const paymentWidget = PaymentWidget(clientKey, customerKey); // 회원 결제
    // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS); // 비회원 결제

    // ------  결제 UI 렌더링 ------
    // @docs https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods선택자-결제-금액-옵션
    paymentMethodWidget = paymentWidget.renderPaymentMethods(
      "#payment-method",
      { value: amount },
      // 렌더링하고 싶은 결제 UI의 variantKey
      // 결제 수단 및 스타일이 다른 멀티 UI를 직접 만들고 싶다면 계약이 필요해요.
      // @docs https://docs.tosspayments.com/guides/payment-widget/admin#멀티-결제-ui
      { variantKey: "DEFAULT" }
    );
    // ------  이용약관 UI 렌더링 ------
    // @docs https://docs.tosspayments.com/reference/widget-sdk#renderagreement선택자-옵션
    paymentWidget.renderAgreement("#agreement", { variantKey: "AGREEMENT" });

    //  ------  결제 UI 렌더링 완료 이벤트 ------
    paymentMethodWidget.on("ready", function () {
      button.disabled = false;
    });

    // ------  결제 금액 업데이트 ------

    // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
    // @docs https://docs.tosspayments.com/reference/widget-sdk#requestpayment결제-정보
    button.addEventListener("click", function () {
    	let option_keys = "${option_keys}";
    	let b_qtys = "${b_qtys}";
    	let u_idx = "${u_idx}";
        let delivery_msg = "${delivery_msg}";
        let delivery_price = "${delivery_price}";
        let d_price = "${d_price}";
        let destination = "${destination}";
        let receiver = "${receiver}";
        let zip_code = "${zip_code}";
        let receiver_tel = "${receiver_tel}";
        let order_qty = "${order_qty}";
        let final_price = "${final_price}";
        let totalPrice = "${totalPrice}";
        let successUrl = "http://localhost:8080/shop/Controller?type=ordersuccess" +
					        "&option_keys=" + encodeURIComponent(option_keys) +
					        "&b_qtys=" + encodeURIComponent(b_qtys) +
					        "&u_idx=" + encodeURIComponent(u_idx) +
					        "&delivery_msg=" + encodeURIComponent(delivery_msg) +
					        "&delivery_price=" + encodeURIComponent(delivery_price) +
					        "&d_price=" + encodeURIComponent(d_price) +
					        "&destination=" + encodeURIComponent(destination) +
					        "&receiver=" + encodeURIComponent(receiver) +
					        "&zip_code=" + encodeURIComponent(zip_code) +
					        "&receiver_tel=" + encodeURIComponent(receiver_tel) +
					        "&order_qty=" + encodeURIComponent(order_qty) +
					        "&final_price=" + encodeURIComponent(final_price) +
					        "&totalPrice=" + encodeURIComponent(totalPrice);
      paymentWidget.requestPayment({
        orderId: generateRandomString(),
        orderName: "토스 티셔츠 외 2건",
        successUrl: successUrl,
        failUrl: "http://localhost:8080/shop/order/toss/fail.jsp",
        customerEmail: "customer123@gmail.com",
        customerName: "김토스",
        customerMobilePhone: "01012341234",
      });
    });
    
  </script>
</html>
