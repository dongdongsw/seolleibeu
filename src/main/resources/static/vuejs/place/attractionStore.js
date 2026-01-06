const { defineStore } = Pinia

const useAttractionStore = defineStore('attraction', {
	state: ()=> ({
		attList: [],
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
		async attractionListData() {
			const res = await api.get('/place/attraction_list_vue/', {
				params: {
					page: this.curpage
				}
			})
			this.attList = res.data.attList
			this.curpage = res.data.curpage
			this.startPage = res.data.startPage
			this.endPage = res.data.endPage
			this.totalpage = res.data.totalpage
		},
		movePage(page) {
			this.curpage = page
			this.attractionListData()
		}
	}
})