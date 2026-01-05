const {defineStore} = Pinia

const useRestaurantStore = defineStore('restaurant',{
	state: ()=>({
		resList:[],
		curpage: 1,
		startPage: 0,
		endPage: 0,
		totalpage: 0
		
	}),
	getters:{
		range:(state)=>{
			const arr = []
			for(let i = state.startPage; i <= state.endPage; i++){
				arr.push(i)
			}
			return arr
		}
	},
	actions:{
		async restaurantListData(){
			const result = await api.get('/place/restaurant/list_vue/',{
				params:{
					page:this.curpage
				}
			})
			// 테스트 끝나면 지울 것
			console.log(result.data)
			
			this.resList = result.data.resList
			this.curpage = result.data.curpage
			this.startPage = result.data.startPage
			this.endPage = result.data.endPage
			this.totalpage = result.data.totalpage
		},
		movePage(page){
			this.curpage = page
			this.restaurantListData()
		}
	}
})