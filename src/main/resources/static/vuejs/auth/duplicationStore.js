
window.defineStore ??= Pinia.defineStore

window.useDuplicationStore ??= defineStore('duplication',{
	state:()=>({
		stomp : null,
		connected: false
	}),
	actions:{
		connect(){
			if(this.connected){
				return;
			}
			const socket = new SockJS('/ws')
			this.stomp = Stomp.over(socket)
			
			this.stomp.connect({},()=>{
				this.connected = true
				
				this.stomp.subscribe('/user/queue/force-logout', () => {
					alert('새로운 로그인 요청이 들어왔습니다. 로그아웃 됩니다')
					location.href='/auth/logout'
				})
			})
			
		}
	}
})