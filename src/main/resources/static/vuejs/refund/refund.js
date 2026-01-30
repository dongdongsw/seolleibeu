
const useRefundStore = Pinia.defineStore('refund',{
	state:()=>({
		list:[],
		p_id:'',
		rf_msg:'',
		rf_amount:0
	}),
	actions:{
		refundData(p_id,rf_amount){
			this.p_id=p_id,
			this.rf_amount=rf_amount,
			this.rf_msg='';
		},
		async refundInsert(){
				if(!this.rf_msg.trim())
				{
					alert('환불 사유를 입력해주세요')
					return
				}
				const res=await api.post('/refund_insert_vue/',{
					p_id:this.p_id,
					rf_msg:this.rf_msg,
					rf_amount:this.rf_amount
				})
				if(res.data==='환불 요청 완료')
				{
					alert('환불 요청이 완료되었습니다')
					location.href="/mypage/my_reserve"
				}
				else
				{
					alert('환불 요청에 실패하였습니다')
				}
			}
	}
})