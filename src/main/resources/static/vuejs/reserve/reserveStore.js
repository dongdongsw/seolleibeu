const useReserveStore = Pinia.defineStore('reserve', {
	state: ()=> ({
		rvList: [],
		curpage: 1,
		totalpage: 0,
		startPage: 0,
		endPage: 0,
		rvvo: {
			pvo: {}
		},
		
		pno: 0,
		dateList: [],
		timeList: [],
		typeList: [],
		selected: {
			opday: '',
			op_time: '',
			opno: 0,
			op_type: '',
			op_price: 0
		},
		qty: 1,
		isLoading: false,
		
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
		},
		remain: (state)=> {
			const op = state.typeList.find(x => x.opno === state.selected.opno)
			if(!op) {
				return 0
			}
			
			return (op.op_amount - op.op_booked)
		},
		canReserve: (state)=> {
			return !!(state.pno && state.selected.opday && state.selected.op_time && state.selected.opno && state.qty >= 1)
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
		},
		initReserveForm(pno) {
			this.pno = Number(pno)
			
			this.dateList = []
			this.timeList = []
			this.typeList = []
			
			this.selected = {
				opday: '',
				op_time: '',
				opno: 0,
				op_type: '',
				op_price: 0
			}
			this.qty = 1
		},
		async fetchDates() {
			if(!this.pno) {
				return
			}
			
			const res = await api.get('/reserve/dates_vue/', {
				params: {
					pno: this.pno
				}
			})
			this.dateList = res.data.list || []
		},
		async selectDate(opday) {
			this.selected.opday = opday
			this.selected.op_time = ''
			this.selected.opno = 0
			this.selected.op_type = ''
			this.selected.op_price = 0
			
			this.timeList = []
			this.typeList = []
			this.qty = 1
			
			const res = await api.get('/reserve/times_vue/', {
				params: {
					pno: this.pno,
					opday
				}
			})
			this.timeList = res.data.list || []
		},
		async selectTime(op_time) {
			this.selected.op_time = op_time
			this.selected.opno = 0
			this.selected.op_type = ''
			this.selected.op_price = 0
			
			this.typeList = []
			this.qty = 1
			
			const res = await api.get('/reserve/types_vue/', {
				params: {
					pno: this.pno,
					opday: this.selected.opday,
					op_time
				}
			})
			this.typeList = res.data.list || []
		},
		selectType(op) {
			const remain = op.op_amount - op.op_booked
			if(remain <= 0) {
				return
			}
			
			this.selected.opno = op.opno
			this.selected.op_type = op.op_type
			this.selected.op_price = op.op_price
			
			if(this.qty > remain) {
				this.qty = remain
			}
			if(this.qty < 1) {
				this.qty = 1
			}
		},
		changeQty(delta) {
			if(!this.selected.opno) {
				alert('옵션을 먼저 선택하세요')
				return
			}
			
			const next = this.qty + delta
			if(next < 1) {
				return
			}
			
			const remain = this.remain
			if(next > remain) {
				alert(`잔여 수량이 ${remain}개 입니다`)
				return
			}
			
			this.qty = next
		},
		
		async createReserve() {
			if(!this.canReserve) {
				alert('날짜/시간/옵션을 선택해주세요')
				return
			}
			
			const payload = {
				pno: this.pno,
				opno: this.selected.opno,
				opday: this.selected.opday,
				rv_time: this.selected.op_time,
				rv_option: this.selected.op_type,
				rv_price: this.selected.op_price,
				rv_amount: this.qty
			}
			
			this.isLoading = true
			try {
				const res = await api.post('/reserve/reserve_ok_vue/', payload)
				
				if(res.data.result === 'soldout') {
					alert('이미 매진 되었습니다.\n다시 선택해주세요.')
					await this.selectDate(this.selected.opday)
					if(this.selected.op_time) {
						await this.selectTime(this.selected.op_time)
					}
					
					return
				}
				
				if(res.data.result === 'yes') {
					const rvno = res.data.rvno
					location.href = `/reserve/reserve_result?rvno=${rvno}`
					return
				}
				
				alert('예약에 실패했습니다')
			} catch(e) {
				const result = confirm('로그인이 필요한 서비스 입니다 로그인하시겠습니까?')
				if(result){
					location.href="/auth/login"
				}
			} finally {
				this.isLoading = false
			}
		},
		async reserveResult(rvno) {
			const res = await api.get('/reserve/result_vue/', {
				params: {
					rvno
				}
			})
			this.rsvo = res.data
			console.log(res.data)
		}
	}
})