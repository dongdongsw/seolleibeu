
const useRefundStore=defineStore('refund',{
	state:()=>({
		list:[],
		uno:null,
		p_id:null,
		rf_msg:''
	}),
	actions:{
		async refundInsert(){
				if(!this.rf_msg.trim())
				{
					alert('환불 사유를 입력해주세요')
					return
				}
				const res=await api.post('/refund_insert_vue/',{
					p_id:this.p_id,
					rf_msg:this.rf_msg,
					uno:this.uno
				})
				if(res.data==='환불 요청 완료')
				{
					alert('환불 요청이 완료되었습니다')
					this.refundListData()
				}
				else
				{
					console.error(err)
					alert('환불 요청에 실패하였습니다')
				}
				console.log(res.data)
			}
	}
})