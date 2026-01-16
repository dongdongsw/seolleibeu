const urlParams = new URLSearchParams(window.location.search)
const paymentKey = urlParams.get("paymentKey")
const orderId = urlParams.get("orderId")
const amount = urlParams.get("amount")
const rvno = urlParams.get("rvno")

console.log('paymentKey:', paymentKey);
console.log('orderId:', orderId);
console.log('amount:', amount);
console.log('rvno:', rvno);

async function confirmPayment() {
  // TODO: API를 호출해서 서버에게 paymentKey, orderId, amount를 넘겨주세요.
  // 서버에선 해당 데이터를 가지고 승인 API를 호출하면 결제가 완료됩니다.
  // https://docs.tosspayments.com/reference#%EA%B2%B0%EC%A0%9C-%EC%8A%B9%EC%9D%B8
  const res = await axios.get('/pay/success/', {
	params:{
		paymentKey:paymentKey,
		orderId:orderId,
		amount:amount,
		rvno:rvno
	}
  })
}

confirmPayment();