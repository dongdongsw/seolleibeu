import './style.css';
import { loadTossPayments, ANONYMOUS } from "@tosspayments/tosspayments-sdk";

const amount = {
  currency: "KRW",
  value: 50_000,
};

const main = async () => {
  const tossPayments = await loadTossPayments(
    "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm"
  );
  const widgets = tossPayments.widgets({
    customerKey: ANONYMOUS
  })

  /**
   * 위젯의 결제금액을 결제하려는 금액으로 초기화하세요.
   * renderPaymentMethods, renderAgreement, requestPayment 보다 반드시 선행되어야 합니다.
   * @docs https://docs.tosspayments.com/sdk/v2/js#widgetssetamount
   */
  await widgets.setAmount(amount)

  const [paymentMethodWidget] = await Promise.all([
    /**
     * 결제창을 렌더링합니다.
     * @docs https://docs.tosspayments.com/sdk/v2/js#widgetsrenderpaymentmethods
     */
    widgets.renderPaymentMethods({
      selector: "#payment-method",
      // 렌더링하고 싶은 결제 UI의 variantKey
      // 결제 수단 및 스타일이 다른 멀티 UI를 직접 만들고 싶다면 계약이 필요해요.
      // @docs https://docs.tosspayments.com/guides/v2/payment-widget/admin#새로운-결제-ui-추가하기
      variantKey: "DEFAULT",
    }),
    /**
     * 약관을 렌더링합니다.
     * @docs https://docs.tosspayments.com/reference/widget-sdk#renderagreement선택자-옵션
     */
    widgets.renderAgreement({ selector: "#agreement", variantKey: "AGREEMENT" }),
  ])

  /**
   * 결제수단 선택 이벤트를 등록합니다.
   * @docs https://docs.tosspayments.com/sdk/v2/js#paymentmethodwidgeton
   */
  paymentMethodWidget.on("paymentMethodSelect", selectedPaymentMethod => {
    console.log("selectedPaymentMethod: ", selectedPaymentMethod);

    if (selectedPaymentMethod.code === "CARD") {
      // 카드 안내사항 노출
    }
    if (selectedPaymentMethod.code === "문화바우처") {
      // 커스텀 결제수단 (결제위젯 Pro 플랜 기능)
      // 문화바우처 안내사항 노출
    }
  })

  const paymentRequestButton = document.getElementById('payment-request-button')

  paymentRequestButton.addEventListener('click', async () => {
    try {
      /**
       * 선택된 결제수단을 조회합니다.
       * @docs https://docs.tosspayments.com/sdk/v2/js#paymentmethodwidgetgetselectedpaymentmethod
       */
      const selectedPaymentMethod = await paymentMethodWidget.getSelectedPaymentMethod()
      console.log("selectedPaymentMethod: ", selectedPaymentMethod)
      
      /**
       * 결제 요청
       * 결제를 요청하기 전에 orderId, amount를 서버에 저장하세요.
       * 결제 과정에서 악의적으로 결제 금액이 바뀌는 것을 확인하는 용도입니다.
       * @docs https://docs.tosspayments.com/sdk/v2/js#widgetsrequestpayment
       */
      await widgets.requestPayment({
        orderId: "RV-" + rvvo.rvno + "-" + new Date().getTime(),
        orderName: rvvo.pvo.name,
        successUrl: window.location.origin + "/pay/success?rvno=" + rvvo.rvno,
        failUrl: window.location.origin + "/pay/fail",
        customerEmail: rvvo.email,
        customerName: rvvo.nickname,
        customerMobilePhone: rvvo.phone
      })
    } catch (err) {
     console.log('err', err);
      // TODO: 에러 처리
    }
  })
}

main()

const generateRandomString = () => window.btoa(Math.random()).slice(0, 20)