const { defineStore } = Pinia

const useCultureStore = defineStore('culture', {
	state: ()=> ({
		culList: [],
		curpage: 1,
		totalpage: 0,
		startPage: 0,
		endPage: 0,
		column: 'addr',
		keyword: '',
		selected: 'p.pno',
		pvo: {
			imgList: [],
			canWrite: false
		}
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
			const res = await api.get('/place/culture/list_vue/', {
				params: {
					page: this.curpage,
					column: this.column,
					keyword: this.keyword,
					selected: this.selected
				}
			})
			this.culList = res.data.culList
			this.curpage = res.data.curpage
			this.startPage = res.data.startPage
			this.endPage = res.data.endPage
			this.totalpage = res.data.totalpage
		},
		movePage(page) {
			this.curpage = page
			this.cultureListData()
		},
		search(keywordRef) {
			if(!this.keyword || !this.keyword.trim()) {
				keywordRef?.focus()
				return
			}
			this.curpage = 1
			this.cultureListData()
		},
		changeSelected() {
			this.curpage = 1
			this.cultureListData()
		},
		async cultureDetailData(pno) {
			const res = await api.get(`/place/culture/detail_vue/?pno=${pno}`)
			this.pvo = res.data
		}
	}
})