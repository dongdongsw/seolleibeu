const notificationApp = Vue.createApp({
	data() {
		return {
			stomp: null
		}
	},
	mounted() {
		this.connect(uno)
	},
	methods: {
		// 알림 (소켓)
		connect(uno) {
			const sock = new SockJS("/noti-ws")
			this.stomp = Stomp.over(sock)

			this.stomp.connect({}, () => {
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

			// 3초 후 자동 닫힘

			setTimeout(() => {
				hideToast()
			}, 50000);
		}
	}
})
function hideToast() {
	const toast = document.getElementById("reserveToast");
	toast.classList.remove("show");
}

notificationApp.mount(".container")