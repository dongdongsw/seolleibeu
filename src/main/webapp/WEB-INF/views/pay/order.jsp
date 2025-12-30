<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>주문내역</title>
    <link href="css/payment.css" rel="stylesheet">
</head>
<body>
    <div class="container order-container">
        <div class="complete-message">
            <h1>주문내역</h1>
            <p>상품을 확인하고 결제를 진행해주세요</p>
        </div>
        <div class="order-layout">
            <div class="order-left">
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
                                    <span class="label">예약일</span>
                                    <span class="value">2025-12-15</span>
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
                            <span class="label">이름</span>
                            <span class="value">전성환</span>
                        </div>
                        <div class="info-row">
                            <span class="label">이메일</span>
                            <span class="value">imagirl@naver.com</span>
                        </div>
                        <div class="info-row">
                            <span class="label">연락처</span>
                            <span class="value">010-1234-5678</span>
                        </div>
                    </div>
                </div>
            </div>

            <div class="order-right">
                <div class="section">
                    <div class="section-title">결제 동의</div>
                    <div class="payment-agree-box">
                        <div class="payment-agree-item payment-agree-all">
                            <input type="checkbox" id="allAgree">
                            <label for="allAgree">전체 동의</label>
                        </div>
                        
                        <div class="payment-agree-item">
                            <input type="checkbox" class="agree-check">
                            <label>개인정보 수집 및 이용 동의(필수)</label>
                        </div>
                        
                        <div class="payment-agree-item">
                            <input type="checkbox" class="agree-check">
                            <label>예약 규정 및 취소/환불 정책 동의(필수)</label>
                        </div>
                        
                        <div class="payment-agree-item">
                            <input type="checkbox" class="agree-check">
                            <label>결제 대행 서비스 이용 동의(필수)</label>
                        </div>
                        
                        <div class="payment-total">
                            <span class="payment-total-label">총 결제금액</span>
                            <span class="payment-total-value">50,000원</span>
                        </div>
                        
                        <button class="payment-submit-btn" id="payBtn" disabled>결제하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        const allAgree = document.getElementById('allAgree');
        const agreeChecks = document.querySelectorAll('.agree-check');
        const payBtn = document.getElementById('payBtn');

        // 전체 동의 체크박스
        allAgree.addEventListener('change', function() {
            agreeChecks.forEach(check => {
                check.checked = this.checked;
            });
            updatePaymentButton();
        });

        // 개별 체크박스
        agreeChecks.forEach(check => {
            check.addEventListener('change', function() {
                const allChecked = Array.from(agreeChecks).every(c => c.checked);
                allAgree.checked = allChecked;
                updatePaymentButton();
            });
        });

        // 결제 버튼 활성화/비활성화
        function updatePaymentButton() {
            const allChecked = Array.from(agreeChecks).every(c => c.checked);
            payBtn.disabled = !allChecked;
        }
        // 결제하기 버튼 클릭
        payBtn.addEventListener('click', function() {
            location.href="/pay_done"
        });
    </script>
</body>
</html>