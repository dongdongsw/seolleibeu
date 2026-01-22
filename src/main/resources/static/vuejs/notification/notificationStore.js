window.api ??= axios.create({
  timeout: 5000
})

window.defineStore ??= Pinia.defineStore

window.useNotificationStore ??= defineStore('notification', {
	state: () => ({
		stomp: null,
		noti_list: [],
		uno: 0,
		noReadCount: 0
	}),
	actions: {
		// 알림 (소켓)
		connect(uno) {
			this.uno=uno
			this.notiListData()
			this.noReadExist()
			const sock = new SockJS("/noti-ws")
			this.stomp = Stomp.over(sock)

			this.stomp.connect({}, () => {
				this.stomp.subscribe('/sub/noti/' + uno, (msg) => {
					this.showToast(msg.body)
					this.notiListData()
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
			
			this.noReadExist()
		},
		
		// 나의 알림 리스트 
		async notiListData() {
			const res = await api.get('/noti/list_vue/')
			this.noti_list = res.data
		},
		
		async notificationRead(target_id, target_type, nono) {
			await api.put('/noti/read_vue/', null, {
				params: {
					nono: nono
				}				
			})
			
			if (target_type==='course') {
				type='course';
			}
			
			location.href='/'+type+'/detail?cno='+target_id
			this.noReadExist()
		},
		
		async notiDelete(nono) {
			await api.delete('/noti/delete_vue/', {
				params: {
					nono: nono
				}
			})
			this.noReadExist()
			await this.notiListData()
		},
		
		async noReadExist() {
			const res = await api.get('/noti/noread_exist_vue/', {
				params: {
					uno: this.uno
				}
			})
			this.noReadCount = res.data
		}

	}
})
function hideToast() {
	const toast = document.getElementById("reserveToast");
	toast.classList.remove("show");
}