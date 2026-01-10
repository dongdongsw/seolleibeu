const {defineStore} = Pinia

const useMyCourseStore=defineStore('my_course', {
	
	state: ()=>({
		list:[],
		curpage:1,
		totalpage:0,
		startPage:0,
		endPage:0,
		cno: 0
	}),
	
	getters: {
		range:(state)=>{
			const arr=[]
			for(let i=state.startPage;i<=state.endPage;i++) {
				arr.push(i)
			}
			return arr
		}
	},
	
	actions: {
		async myCourseData() {
			const res=await api.get('/course/mycourse_vue/', {
				params: {
					page: this.curpage
				}
			})	
			console.log(res.data)
			this.setPageData(res.data)
			console.log(this.list)
		},
		
		// 코스 삭제
		async courseDelete(cno) {
			this.cno=cno
			const ok=confirm('정말로 이 코스를 삭제하시겠습니까?')
			if (!ok) return
			
			const res=await api.delete('/course/delete_vue/', {
				params: {
					cno: this.cno
				}
			})
			if(res.data.msg==='yes') {
				this.myCourseData()
			} else {
				alert("코스 삭제에 실패하였습니다")
			}
		},
		
		// 페이지별 데이터 초기화
		setPageData(data) {
			this.list=data.list
			this.curpage=data.curpage
			this.totalpage=data.totalpage
			this.startPage=data.startPage
			this.endPage=data.endPage
		},
		
		// 페이지네이션 이동
		movePage(page) {
			this.curpage=page
			this.myCourseData()
		}
		
	}
})