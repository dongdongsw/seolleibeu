const {defineStore} = Pinia

const useAdminRefundStore=defineStore('adimin_refund',{
	state:()=>({
		list:[],
		curpage:1,
		startPage:0,
		endPage:0,
		totalpage:0,
		vo:{}
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
					page:this.curpage,
					name:this.name
				}
			})
			this.list=res.data.list
	        this.curpage=res.data.curpage
	        this.startPage=res.data.startPage
	        this.endPage=res.data.endPage
	        this.totalpage=res.data.totalpage
			console.log(res.data)
			},
			find(nameRef){
				if(this.name==='')
				{
					nameRef?.focus()
					return
				}
				this.curpage=1
				this.adminRefundListData()
			},
		async adminRefundUpdate(rf_id,uno,rf_status){
			const res=await api.post('/admin/refund_update_vue/',{
					rf_id:rf_id,
					rf_status:rf_status,
					uno:uno
			})
			if(res.data.result==='success')
			{
				alert('상태가"' + rf_status + '"로 변경되었습니다.')
				this.adminRefundListData()
			}
			else
			{
				alert('처리에 실패했습니다')
			}
		},
		pageChange(page){
			this.curpage=page
			this.adminRefundListData()
		}
	}
})