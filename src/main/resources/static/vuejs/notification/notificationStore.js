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
		// 알림 소켓 연결
		connect(uno) {
			this.uno=uno
			this.notiListData()
			this.noReadExist()
			const sock = new SockJS("/ws")
			this.stomp = Stomp.over(sock)

			this.stomp.connect({}, () => {
				
				// 개인 알림 (댓글, 환불)
				this.stomp.subscribe('/sub/noti/' + uno, (msg) => {
					this.showToast(msg.body)
					this.notiListData()
				})
				// 전체 알림 (공지)
				this.stomp.subscribe('/sub/noti/all', (msg) => {
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
		
		// 알림을 읽을 때
		async notificationRead(target_id, target_type, nono) {
			// 읽음 처리
			await api.put('/noti/read_vue/', null, {
				params: {
					nono: nono
				}				
			})
			
			// 해당 페이지 이동
			if (target_type==='course') {
				location.href='/'+target_type+'/detail?cno='+target_id
				this.noReadExist()
				
			} else if (target_type==='refund') {
				location.href='/mypage/my_'+target_type
				this.noReadExist()
			} else {
				location.href='/notice/list'
				this.noReadExist()
			}
		},
		
		// 알림 삭제
		async notiDelete(nono) {
			await api.delete('/noti/delete_vue/', {
				params: {
					nono: nono
				}
			})
			this.noReadExist()
			await this.notiListData()
		},
		
		// 읽지 않은 알림이 존재하는지
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