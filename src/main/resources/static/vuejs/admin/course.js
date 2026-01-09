const {defineStore} = Pinia
const useCourseStore=defineStore('course_list',{
	state:()=>({
		list:[],
		curpage:1,
		startPage:0,
		endPage:0,
		totalpage:0,
		title:''
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