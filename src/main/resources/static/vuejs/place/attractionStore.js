const { defineStore } = Pinia

const useAttractionStore = defineStore('attraction', {
	state: ()=> ({
		attList: [],
		curpage: 1,
		totalpage: 0,
		startPage: 0,
		endPage: 0,
		column: 'addr',
		keyword: '',
		selected: 'p.pno'
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
			const res = await api.get('/place/attraction/list_vue/', {
				params: {
					page: this.curpage,
					column: this.column,
					keyword: this.keyword,
					selected: this.selected
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
		},
		search(keywordRef) {
			if(!this.keyword || !this.keyword.trim()) {
				keywordRef?.focus()
				return
			}
			this.curpage = 1
			this.attractionListData()
		},
		changeSelected() {
			this.curpage = 1
			this.attractionListData()
		}
	}
})