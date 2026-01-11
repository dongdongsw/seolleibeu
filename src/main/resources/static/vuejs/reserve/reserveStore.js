const { defineStore } = Pinia

const useReserveStore = defineStore('reserve', {
	state: ()=> ({
		rvList: [],
		curpage: 1,
		totalpage: 0,
		startPage: 0,
		endPage: 0,
		rvvo: {
			pvo: {}
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
		async reserveListData() {
			const res = await api.get('/reserve/myReserved_vue/', {
				params: {
					page: this.curpage
				}
			})
			this.rvList = res.data.rvList
			this.curpage = res.data.curpage
			this.startPage = res.data.startPage
			this.endPage = res.data.endPage
			this.totalpage = res.data.totalpage
		},
		movePage(page) {
			this.curpage = page
			this.reserveListData()
		},
		async reserveDetailData(rvno) {
			const res = await api.get(`/reserve/detail_vue/?rvno=${rvno}`)
			console.log(res.data)
			this.rvvo = res.data
		}
	}
	
})