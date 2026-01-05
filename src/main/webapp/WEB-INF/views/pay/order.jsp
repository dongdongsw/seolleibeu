<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <title>결제하기</title>
   <link href="/css/payment.css" rel="stylesheet">
    <script src="https://js.tosspayments.com/v1"></script>
  </head>
  <body>
    <section>
      <span>총 주문금액</span>
      <span>15,000 원</span>
      <button id="payment-button">15,000원 결제하기</button>
    </section>
    <script>
      var clientKey = 'test_ck_nRQoOaPz8L5MqlJGaZ9P3y47BMw6'
      var tossPayments = TossPayments(clientKey)

      var button = document.getElementById('payment-button') // 결제하기 버튼

      button.addEventListener('click', function () {
        tossPayments.requestPayment('카드', {
          amount: 15000,
          orderId: 'zUo_E9x6JfRS46bqXbvLh',
          orderName: '토스 티셔츠 외 2건',
          customerName: '박토스',
          successUrl: 'http://localhost:8080/success',
          failUrl: 'http://localhost:8080/fail',
        })
      })
    </script>
  </body>
</html>