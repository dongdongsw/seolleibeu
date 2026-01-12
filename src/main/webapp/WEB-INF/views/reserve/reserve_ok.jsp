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
                        <p>결과 확인</p>
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
							<div class="testimonial-block bg-light pinside30 mb30" style="padding: 10px;" id="reserved_result">
								<div class="post-block" style="margin-top: 20px; margin-left: 15px;">
									<div>
										<img class="post-block-img" src="/images/left-image.jpg">
									</div>
									<div style="margin-left: 20px;">
										<span class="meta-author">타입명</span>
										<h1><span class="title" style="font-weight: bold;">장소명</span></h1>
										<div class="reserve-info">
											<h3 class="menu-title" style="margin-top: 10px; font-weight: bold;">예매 옵션</h3>
											<span style="font-size: 14px;"><b>옵션명&nbsp;</b>값</span><br>
											<span style="font-size: 14px;"><b>옵션금액&nbsp;</b>값</span><br>
											<span style="font-size: 14px;"><b>수량&nbsp;</b>값</span><br>
											<span style="font-size: 14px;"><b>결제금액&nbsp;</b>값</span><br>
											<span style="font-size: 14px;"><b>예약상태&nbsp;</b>예약대기</span><br>
											<a href="#" class="btn btn-default btn-sm" style="margin-top: 10px;" onclick="requestPayment()">결제하기</a>&nbsp;
											<a href="/mypage/my_reserve" class="btn btn-default btn-sm" style="margin-top: 10px;">내 예매내역</a><br>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>
        </div>
    </div>
    <script src="/vuejs/axios.js"></script>
    <script src="/vuejs/reserve/reserveStore.js"></script>
    <script>
    	const { createApp, onMounted } = Vue
    	const { createPinia } = Pinia
    	
    	const reserveResultApp = createApp({
    		setup() {
    			const store = useReserveStore()
    			const params = new URLSearchParams(location.search)
    			const rvno = params.get('rvno')
    			
    			onMounted(()=> {
    				store.reserveResult(rvno)
    			})
    			
    			return {
    				store
    			}
    		}
    	})
    	reserveResultApp.use(createPinia())
    	reserveResultApp.mount('#reserved_result')
    
    <%-- 
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
      --%>
    </script>
</body>
</html>