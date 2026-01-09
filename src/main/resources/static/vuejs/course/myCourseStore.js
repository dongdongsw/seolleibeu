const useMyCourseStore=defineStore('my_course', {
	
	state: ()=>({
		/*
		curpage:1,
		totalpage:0,
		startPage:0,
		endPage:0
		*/
		cno: 0
	}),
	
	actions: {
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
				location.href="/course/list"
			} else {
				alert("코스 삭제에 실패하였습니다")
			}
		}
		
	}
	/*
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
		async dataRecv() {
			const res=await api.get('/course/list_vue/', {
				params: {
					page: this.curpage,
					sort: this.sort,
					keyword: this.keyword
				}
			})
			console.log(res.data)
			this.course_list=res.data.list
			this.setPageData(res.data)
		},
		
		setPageData(data) {
			this.list=data.list
			this.curpage=data.curpage
			this.totalpage=data.totalpage
			this.startPage=data.startPage
			this.endPage=data.endPage
			this.address=data.address
		},

		movePage(page) {
			this.curpage=page
			this.dataRecv()
		},
		
	}
	*/
})