const {defineStore} = Pinia

const useRestaurantStore = defineStore('restaurant',{
	state: ()=>({
		resList:[],
		curpage: 1,
		startPage: 0,
		endPage: 0,
		totalpage: 0
		
	}),
	actions:{
		async restaurantListData(){
			const result = await api.get('/place/restaurant/list_vue/',{
				params:{
					page:this.curpage
				}
			})
			console.log(result.datta)
			this.resList = result.data.resList
			this.curpage = result.data.curpage
			this.startPage = result.data.startPage
			this.endPage = result.data.endPage
			this.totalpage = result.data.totalpage
		}
	}
})