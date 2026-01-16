import './style.css';
const urlParams = new URLSearchParams(window.location.search)
const paymentKey = urlParams.get("paymentKey")
const orderId = urlParams.get("orderId")
const totalAmount = urlParams.get("totalAmount")
const rvno = urlParams.get("rvno")

async function confirmPayment() {
  // TODO: API를 호출해서 서버에게 paymentKey, orderId, amount를 넘겨주세요.
  // 서버에선 해당 데이터를 가지고 승인 API를 호출하면 결제가 완료됩니다.
  // https://docs.tosspayments.com/reference#%EA%B2%B0%EC%A0%9C-%EC%8A%B9%EC%9D%B8
  const response = await axios.api('/pay/success/', {
	paymentKey:paymentKey,
	orderId:orderId,
	totalAmount:totalAmount,
	rvno:rvno
  })
  
  if (response.data.result==='success')
  {
	document.querySelector('.confirm-loading').style.display = 'none';
	document.querySelector('.confirm-success').style.display = 'flex';
  }
  
}

const confirmPaymentButton = document.getElementById('confirmPaymentButton')
confirmPaymentButton.addEventListener('click', confirmPayment)