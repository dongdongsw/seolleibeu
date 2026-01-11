const useLikeStore = defineStore('like',{
	state:()=>({
		likeCount:0,
		likeCheck:0,
		loginTrueFalse:''
	}),
	actions:{
		async likeCheck(pno){
			const result = await api.get('/like/detail_vue/',{
				params:{
					pno:pno
				}
			})
			console.log(result.data)
			this.likeCount = result.data.likeCount
			this.likeCheck = result.data.likeCheck
			this.loginTrueFalse = result.data.loginTrueFalse
		}
	}
})