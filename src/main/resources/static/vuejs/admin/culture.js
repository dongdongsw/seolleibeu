const {defineStore}=Pinia

const useCultureStore=defineStore('culture_list',{
	state:()=>({
		list:[],
		curpage:1,
		startPage:0,
		endPage:0,
		totalpage:0,
		category:'문화',
		name:''
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
		async cultureListData(){
			const res=await api.get('/admin/culture_list_vue/',{
				params:{
					page:this.curpage,
					category:this.category,
					name:this.name
				}
			})
			this.list=res.data.list
			this.curpage=res.data.curpage
			this.startPage=res.data.startPage
			this.endPage=res.data.endPage
			this.totalpage=res.data.totalpage
		},
		pageChange(page){
			this.curpage=page
			this.cultureListData()
		},
		find(nameRef){
			if(this.name==='')
			{
				nameRef?.focus()
				return
			}
			this.curpage=1
			this.cultureListData()
		}
	}
})