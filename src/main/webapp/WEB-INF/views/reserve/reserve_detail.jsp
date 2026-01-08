<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://js.tosspayments.com/v2/standard"></script>
</head>
<body>
    <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="page-caption">
                        <h1 class="page-title">예매</h1>
                        <p>상세 보기</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div class="content">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="row">
						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<div class="testimonial-block bg-light pinside30 mb30" style="padding: 10px;">
								<div class="post-block" style="margin-top: 20px; margin-left: 15px;">
									<div class="reserve_detail">
										<div class="reserve-info">
											<ul style="list-style: none;">
												<li style="font-size: 18px;"><b>장소명&nbsp;</b>쌍용강북교육센터</li>
												<li style="font-size: 18px;"><b>예약상태&nbsp;</b>예약대기&nbsp;<a class="btn btn-default btn-sm" style="margin-left: 10px;" onclick="requestPayment()">결제하기</a></li>
												<li style="font-size: 18px;"><b>업체명&nbsp;</b>SIST</li>
												<li style="font-size: 18px;"><b>주소&nbsp;</b>서울특별시 마포구 월드컵룩로 21, 풍성빌딩 2층</li>
												<li style="font-size: 18px;"><b>연락처&nbsp;</b>02)1234-5678</li>
											</ul><br>
											<ul style="list-style: none;">
												<li style="font-size: 18px;"><b>예약옵션&nbsp;</b>AWS를 통한 CI/CD 풀스택 과정</li>
												<li style="font-size: 18px; margin-left: 72px;"><b>&nbsp;</b>10,000 원 x 2 = 20,000 원</li>
											</ul><br>
											<ul style="list-style: none;">
												<li style="font-size: 18px;"><b>닉네임&nbsp;</b>이철우</li>
												<li style="font-size: 18px;"><b>연락처&nbsp;</b>010-1234-5678</li>
												<li style="font-size: 18px;"><b>이메일&nbsp;</b>cheol0904@naver.com</li>
											</ul><br>
											<ul style="list-style: none;">
												<li style="font-size: 18px;"><b>결제금액&nbsp;</b>20,000원</li>
												<li style="font-size: 18px;"><b>결제수단 &nbsp;</b>카드결제</li>
												<li style="font-size: 18px;"><b>결제일시&nbsp;</b>2025-12-31 17:28:25</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="row text-right" style="margin-right: 5px;">
									<a href="" class="btn btn-default btn-sm" style="margin-top: 10px;">예약내역 삭제</a>
									<a href="../mypage/review_create" class="btn btn-default btn-sm" style="margin-top: 10px;">리뷰 작성</a>
									<a href="javascript:history.back()" class="btn btn-default btn-sm" style="margin-top: 10px;">목록</a>
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>
        </div>
    </div>
    <script>
      // ------  SDK 초기화 ------
      // @docs https://docs.tosspayments.com/sdk/v2/js#토스페이먼츠-초기화
      const clientKey = "test_ck_nRQoOaPz8L5MqlJGaZ9P3y47BMw6";
      const customerKey = "JwnRtoHUueqwSHJPh8FY3";
      const tossPayments = TossPayments(clientKey);
      // 회원 결제
      // @docs https://docs.tosspayments.com/sdk/v2/js#tosspaymentspayment
      const payment = tossPayments.payment({ customerKey });
      // 비회원 결제
      // const payment = tossPayments.payment({customerKey: TossPayments.ANONYMOUS})
      // ------ '결제하기' 버튼 누르면 결제창 띄우기 ------
      // @docs https://docs.tosspayments.com/sdk/v2/js#paymentrequestpayment
      async function requestPayment() {
        // 결제를 요청하기 전에 orderId, amount를 서버에 저장하세요.
        // 결제 과정에서 악의적으로 결제 금액이 바뀌는 것을 확인하는 용도입니다.
        await payment.requestPayment({
          method: "CARD", // 카드 결제
          amount: {
            currency: "KRW",
            value: 50000,
          },
          orderId: "e1nYcsVLaxdAdt9W0iKAp", // 고유 주문번호
          orderName: "토스 티셔츠 외 2건",
          successUrl: window.location.origin + "/success", // 결제 요청이 성공하면 리다이렉트되는 URL
          failUrl: window.location.origin + "/fail", // 결제 요청이 실패하면 리다이렉트되는 URL
          customerEmail: "customer123@gmail.com",
          customerName: "김토스",
          customerMobilePhone: "01012341234",
          // 카드 결제에 필요한 정보
          card: {
            useEscrow: false,
            flowMode: "DEFAULT", // 통합결제창 여는 옵션
            useCardPoint: false,
            useAppCardOnly: false,
          },
        });
      }
    </script>
</body>
</html>