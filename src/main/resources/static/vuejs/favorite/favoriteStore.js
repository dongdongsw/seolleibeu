
const useFavoriteStore = defineStore('favorite',{
	state:()=>({
		
		
	}),
	
	actions:{
		async favoritePush(pno){
			const result = await api.post('/favorite/push_vue/',{
				pno:pno
			})
			
		}
	}
})