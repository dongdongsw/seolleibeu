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
		},
		rsvo: {
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
			this.rvvo = res.data
		},
		async reserveExposureChange(rvno) {
			if(!confirm("정말로 예매내역을 삭제하시겠습니까?\n* 삭제 후에는 복구가 불가합니다 *")) {
				return
			}
			
			const res = await api.post('/reserve/change_vue/', {
				rvno	
			})
			
			if(res.data.result === 'yes') {
				alert("애매내역이 삭제되었습니다")
				history.back()
			} else {
				alert("삭제에 실패하였습니다")
			}
		}
	}
	
})