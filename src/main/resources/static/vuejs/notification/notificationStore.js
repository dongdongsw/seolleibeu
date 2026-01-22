window.defineStore ??= Pinia.defineStore

window.useNotificationStore ??= defineStore('notification', {
	state: () => ({
		stomp: null
	}),
	actions: {
		// 알림 (소켓)
		connect(uno) {

			const sock = new SockJS("/noti-ws")
			this.stomp = Stomp.over(sock)

			this.stomp.connect({}, () => {
				this.subscribed = true
				this.stomp.subscribe('/sub/noti/' + uno, (msg) => {
					this.showToast(msg.body)
				})
			})
		},
		// 토스트
		showToast(message) {
			const toast = document.getElementById("reserveToast")
			const toastMsg = document.getElementById("toastMsg")

			toastMsg.innerText = message;
			toast.classList.add("show");

			setTimeout(() => {
				hideToast()
			}, 8000);
		}

	}
})
function hideToast() {
	const toast = document.getElementById("reserveToast");
	toast.classList.remove("show");
}