const {defineStore} = Pinia

const useMypageFavoriteStore = defineStore('favorite',{
	state:()=>({
		fList: [],
		curpage: 1,
		totalpage: 0,
		startPage: 0,
		endPage: 0,
		category:'',
		type:''
		
	}),
	getters:{
		range:(state)=>{
			const arr = []
			for(let i = state.startPage; i <= state.endPage; i++){
				arr.push(i)
			}
			return arr
		},
		routeType:()=>(type)=>{
			if(type === '식당'){
				return 'restaurant'
			}
			if(['연극/뮤지컬','전시', '액티비티'].includes(type)){
				return 'culture'
			}
			if(['명소', '자연관광', '엔터테인먼트'].includes(type)){
				return 'attraction'
			}
			return 'restaurant'
		}
	},	
	actions:{
		async mypageFavoriteListData(){
			const result = await api.get('/mypage/favorite/list_vue/',{
				params:{
					page:this.curpage,
					category:this.category
				}
			})
			
			this.fList = result.data.fList
			this.curpage = result.data.curpage
			this.startPage = result.data.startPage
			this.endPage = result.data.endPage
			this.totalpage = result.data.totalpage
			this.category = result.data.category
		},
		movePage(page){
			this.curpage = page
			this.mypageFavoriteListData()
		},
		categoryFilter(category){
			this.category = category
			this.curpage = 1
			if(category !== ''){
				this.type = category
			}
			this.mypageFavoriteListData()
		},
		async favoriteCancel(pno){
			const deleteMsg = confirm('즐겨찾기를 해제 하시겠습니까?')
			if(deleteMsg){
				await api.post('/favorite/cancel_vue/',{
					pno:pno
				})
				this.mypageFavoriteListData()
			}
			
			
		}
	}
})

