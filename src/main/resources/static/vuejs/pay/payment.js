// vuejs/pay/payment.js

// JSP에서 사용할 수 있는 전역 함수 정의
const tossPaymentRequest = async (rvvo) => {
  try {
    // 1. 초기화 (스크립트 태그로 불러온 TossPayments 객체 사용)
    const clientKey = "test_ck_nRQoOaPz8L5MqlJGaZ9P3y47BMw6"
    const tossPayments = TossPayments(clientKey)
    
    // 2. 결제 객체 생성
    const payment = tossPayments.payment({ 
      customerKey: "USER_" + rvvo.uno 
    })

    // 3. 결제 요청 (바로 카드 결제창을 띄우는 방식)
    await payment.requestPayment({
      method: "CARD",
      amount: {
        currency: "KRW",
        value: rvvo.rv_price * rvvo.rv_amount
      },
      orderId: "RV-" + rvvo.rvno + "-" + new Date().getTime(),
      orderName: rvvo.pvo.name,
      successUrl: window.location.origin + "/pay/success?rvno=" + rvvo.rvno,
      failUrl: window.location.origin + "/pay/fail",
      customerEmail: rvvo.email,
      customerName: rvvo.nickname
    })
  } catch (error) {
    alert("결제를 취소 하셨습니다.")
  }
}