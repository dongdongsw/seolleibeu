<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="https://static.toss.im/icons/png/4x/icon-toss-logo.png"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="/css/pay/success.css" rel="stylesheet">
    <title></title>
  </head>
  <body>
    <div class="result wrapper">
      <div class="box_section">
        <h2 style="margin: 0px auto;">
          <img width="35px" src="https://static.toss.im/3d-emojis/u1F389_apng.png"/>결제 성공
        </h2>
        <p id="paymentKey">결제 키 : ${paymentKey}</p>
        <p id="orderId">주문 번호: ${orderId}</p>
        <p id="amount">가격 : ${amount}원</p>
        <button class="button" onclick="location.href='/'">홈으로</button>
        <button class="button" onclick="location.href='/mypage/my_reserve'">마이페이지</button>
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="/vuejs/axios.js"></script>
	<script src="/vuejs/pay/success.js"></script>
  </body>
</html>
