
const useFavoriteStore = defineStore('favorite',{
	state:()=>({
		checkFavorite:0,
		favoriteCount:0,
		loginTrueFalse:''
		
	}),
	
	actions:{
		async favoritePush(pno){
			const result = await api.post('/favorite/push_vue/',{
				pno:pno
			})
			this.checkFavorite = 1
			this.favoriteDetailCheck(pno)
		},
		async favoriteDetailCheck(pno){
			const result = await api.get('/favorite/detail/check_vue/',{
				params:{
					pno:pno
				}
			})
			this.checkFavorite = result.data.checkFavorite
			this.favoriteCount = result.data.favoriteCount
			this.loginTrueFalse = result.data.loginTrueFalse
		},
		async favoriteCancel(pno){
			const deleteMsg = confirm('즐겨찾기를 해제 하시겠습니까?')
				if(deleteMsg){
					const result = await api.post('favorite/cancel_vue/',{
						pno:pno
					})
					this.checkFavorite = 0
					this.favoriteDetailCheck(pno)
				}
		},
		handleFavoriteClick(pno){
			
			if(this.loginTrueFalse === 'true'){
				if(this.checkFavorite >= 1){
					this.favoriteCancel(pno)
				}
				else if(this.checkFavorite < 1){
					this.favoritePush(pno)
				}
			}
			else{
				const result = confirm('로그인이 필요한 서비스입니다.')
				if(result){
					window.location.href = '/auth/login'; 
				}
			}
		}
	}
})