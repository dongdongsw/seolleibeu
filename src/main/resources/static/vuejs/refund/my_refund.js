const {defineStore} = Pinia

const useRefundStore=defineStore('refund',{
	state:()=>({
		list:[],
		curpage:1,
		startPage:0,
		endPage:0,
		totalpage:0,
		uno:null,
		p_id:null,
		rf_msg:''
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
		async refundListData(){
			const res=await api.get('/refund_list_vue/',{
				params:{
					page:this.curpage,
					uno:this.uno
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
				this.refundListData()
		}
	}
})