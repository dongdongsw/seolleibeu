const { defineStore } = Pinia

const useReserveStore = defineStore('reserve', {
	state: ()=> ({
		rvList: [],
		curpage: 1,
		totalpage: 0,
		startPage: 0,
		endPage: 0
	}),
	getters: {
		range: (state)=> {
			const arr = []
			for(let i=state.startPage;i<=state.endPage;i++) {
				arr.push(i)
			}
			
			return arr
		}
	},
	actions: {
		async reserveListData() {
			const res = await api.get('/reserve/myReserved_vue/', {
				params: {
					page: this.curpage
				}
			})
			console.log(res.data)
			this.rvList = res.data.rvList
			this.curpage = res.data.curpage
			this.startPage = res.data.startPage
			this.endPage = res.data.endPage
			this.totalpage = res.data.totalpage
		},
		movePage(page) {
			this.curpage = page
			this.reserveListData()
		}
	}
	
})