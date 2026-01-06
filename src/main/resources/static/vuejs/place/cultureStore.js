const { defineStore } = Pinia

const useCultureStore = defineStore('culture', {
	state: ()=> ({
		culList: [],
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
		async cultureListData() {
			const res = await api.get('/place/culture_list_vue/', {
				params: {
					page: this.curpage
				}
			})
			this.culList = res.data.culList
			this.curpage = res.data.curpage
			this.startPage = res.data.startPage
			this.endPage = res.data.endPage
			this.totalpage = res.data.totalpage
		},
		movePage(page) {
			this.curage = page
			this.cultureListData()
		}
	}
})