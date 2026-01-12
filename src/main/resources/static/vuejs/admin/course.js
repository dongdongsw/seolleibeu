const {defineStore} = Pinia
const useCourseStore=defineStore('course_list',{
	state:()=>({
		list:[],
		curpage:1,
		startPage:0,
		endPage:0,
		totalpage:0,
		cno:0,
		title:'',
		is_public:''
		
	}),
	getters:{
		range:(state)=>{
			const arr=[]
			for(let i=state.startPage;i<=state.endPage;i++)
			{
				arr.push(i)
			}
			return arr
		}
	},
	actions:{
		async courseListData(){
			const res=await api.get('/admin/course_list_vue/',{
				params:{
					page:this.curpage,
					title:this.title
				}
			})
			this.list=res.data.list
			this.curpage=res.data.curpage
			this.startPage=res.data.startPage
			this.totalpage=res.data.totalpage
			this.endPage=res.data.endPage
		},
		
		async courseStatusUpdate(cno, is_public) {
			this.cno=cno
			if(is_public==='Y') {
				this.is_public='N'
			} else {
				this.is_public='Y'
			}
			await api.put('/admin/course_status_update_vue/', {
				cno: this.cno,
				is_public: this.is_public
			})
			this.courseListData()
			alert("코스 상태가 변경되었습니다.")
		},
		
		pageChange(page){
			this.curpage=page
			this.courseListData()
		},
		find(titleRef){
			if(this.title=='')
			{
				titleRef?.focus()
				return
			}
			this.curpage=1
			this.courseListData()
		}
	}
})