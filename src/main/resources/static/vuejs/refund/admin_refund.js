const {defineStore} = Pinia

const useAdminRefundStore=defineStore('adimin_refund',{
	state:()=>({
		list:[],
		curpage:1,
		startPage:0,
		endPage:0,
		totalpage:0
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
		async adminRefundListData(){
			const res=await api.get('/admin/refund_list_vue/',{
				params:{
					page:this.curpage
				}
			})
			this.list=res.data.list
	        this.curpage=res.data.curpage
	        this.startPage=res.data.startPage
	        this.endPage=res.data.endPage
	        this.totalpage=res.data.totalpage
			console.log(res.data)
		},
		pageChange(page){
			this.curpage=page
			this.adminRefundListData()
		}
	}
})