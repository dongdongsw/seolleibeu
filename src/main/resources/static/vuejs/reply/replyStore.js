const {defineStore} = Pinia
const initialState=()=>({
	reply_list:[],
	cno:0,
	msg:'',
})
const useReplyStore=defineStore('reply',{
	state:initialState,
	actions:{
	async replyListData(cno){
		this.cno=cno
		const {data} = await api.get('/reply/list_vue/',{
			params:{
				cno:this.cno
			}
		})
		this.reply_list=data.rList
		this.cno=data.cno
		}
	}
})