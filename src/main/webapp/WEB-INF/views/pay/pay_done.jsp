<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 완료</title>
    <link href="css/payment.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <div class="complete-message">
            <h1>결제 완료</h1>
            <p>주문이 정상적으로 완료되었습니다</p>
        </div>

        <div class="section">
            <div class="section-title">예약 상품</div>
            <div class="product-box">
                <div class="product-item">
                    <img src="../images/main_logo.png" style="width: 100px;height: 80px;">
                    <div class="product-info">
                        <div class="product-row">
                            <span class="label">상품</span>
                            <span class="value">남산타워 전망대</span>
                        </div>
                        <div class="product-row">
                            <span class="label">수량</span>
                            <span class="value">1</span>
                        </div>
                        <div class="product-row">
                            <span class="label">금액</span>
                            <span class="value">50,000원</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="section">
            <div class="section-title">주문자 정보</div>
            <div class="info-box">
                <div class="info-row">
                    <span class="label">예약 번호</span>
                    <span class="value">1234</span>
                </div>
                <div class="info-row">
                    <span class="label">예약일</span>
                    <span class="value">2025-12-15</span>
                </div>
                <div class="info-row">
                    <span class="label">이름</span>
                    <span class="value">홍길동</span>
                </div>
                <div class="info-row">
                    <span class="label">이메일</span>
                    <span class="value">1234@naver.com</span>
                </div>
            </div>
        </div>

        <div class="buttons">
            <button class="btn btn-primary">예약 상세보기</button>
            <button class="btn">홈으로</button>
        </div>
    </div>
</body>
</html>