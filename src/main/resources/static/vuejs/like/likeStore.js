const useLikeStore = defineStore('like',{
	state:()=>({
		likeCount:0,
		likeCheck:0,
		loginTrueFalse:''
	}),
	actions:{
		async likeUserCheck(pno){
			const result = await api.get('/like/detail_vue/',{
				params:{
					pno:pno
				}
			})
			console.log(result.data)
			
			this.likeCount = result.data.likeCount
			this.likeCheck = result.data.likeCheck
			this.loginTrueFalse = result.data.loginTrueFalse
		},
		async likePush(pno){
			const result = await api.post('/like/push_vue/',{
				pno:pno
			})
			this.likeCount = 1
			this.likeUserCheck(pno)
		},
		async likeDelete(pno){
			const deleteMsg = confirm('좋아요를 취소하시겠습니까?')
			if(deleteMsg){
				const result  = await api.post('/like/delete_vue/',{
					pno:pno
				})
				this.likeCount = 0
				this.likeUserCheck(pno)
				 
			}
			
		},
		handleLikeClick(pno){
			if(this.loginTrueFalse !== 'true'){
				const loginMsg = confirm('로그인이 필요한 서비스입니다.')
				if(loginMsg){
					window.location.href = '/auth/login';
				}
			}
			else{
				if(this.likeCheck === 0){
					this.likePush(pno)
				}
				else{
					this.likeDelete(pno)
				}
			}
		}
	}
})