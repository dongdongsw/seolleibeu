const {defineStore}=Pinia

const useUsersStore=defineStore('users_list',{
	state:()=>({
		list:[],
		curpage:1,
		startPage:0,
		endPage:0,
		totalpage:0,
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
		async usersListData(){
			const res=await api.get('/admin/users_list_vue/',{
				params:{
					page:this.curpage,
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
			this.usersListData()
		},
		find(nameRef){
			if(this.name==='')
			{
				nameRef?.focus()
				return
			}
			this.curpage=1
			this.usersListData()
		}
	}
})