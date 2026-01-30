const {defineStore} = Pinia

const useCourseListStore=defineStore('course_list', {
	
	state: ()=>({
		course_list: [],
		sort: '최신순',
		keyword: '',
		curpage:1,
		totalpage:0,
		startPage:0,
		endPage:0
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
		async dataRecv() {
			const res=await api.get('/course/list_vue/', {
				params: {
					page: this.curpage,
					sort: this.sort,
					keyword: this.keyword
				}
			})
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
		 
		find(keywordRef) {
			if(this.keyword==='') {
				this.$refs.keyword.focus()
				return
			}
			console.log(this.keyword)
			this.sort='최신순'
			this.curpage=1
			this.dataRecv()
		},
		
		movePage(page) {
			this.curpage=page
			this.dataRecv()
		},
		
		sortFunc(sort) {
			this.sort=sort
			this.curpage=1
			this.dataRecv()
		}
	}
})