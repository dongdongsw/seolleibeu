const {defineStore} = Pinia

const useRestaurantStore = defineStore('restaurant',{
	state: ()=>({
		resList:[],
		curpage: 1,
		startPage: 0,
		endPage: 0,
		totalpage: 0,
		radio:'subject',
		array:'',
		keyword:''
		
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
					page:this.curpage,
					radio:this.radio,
					keyword:this.keyword,
					array:this.array
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
		},
		arrayChange(array){
			this.array = array
			this.curpage = 1
			this.restaurantListData()
		}
	}
})