const {defineStore} = Pinia
const initialState=()=>({
	reply_list:[],
	cno:0,
	cr_content:'',
	upReplyNo:null,
	uno:1,
	updateMsg:{}
})
const useReplyStore=defineStore('reply',{
	state:initialState,
	actions:{
		
		toggleUpdate(id,cr_content){
			this.upReplyNo=this.upReplyNo===id?null:id
			this.updateMsg[id]=cr_content
	},
	// 댓글 리스트
	async replyListData(cno){
		this.cno=cno
		const {data} = await api.get('/reply/list_vue/',{
			params:{
				cno:this.cno
			}
		})
		this.reply_list=data.rList
		this.cno=data.cno
		},
	// 댓글 수정
	async replyUpdate(id){
		const {data} = await api.put('/reply/update_vue/',{
			id:id,
			cno:this.cno,
			cr_content:this.updateMsg[id]
		})
		this.reply_list=data.rList
		this.cno=data.cno
		this.upReplyNo=null
	},
	// 댓글 쓰기
	async replyInsert(){
		if(!this.cr_content.trim()) return
		const {data} = await api.post('/reply/insert_vue/',{
			cno:this.cno,
			cr_content:this.cr_content,
			uno:this.uno
		})
		this.reply_list=data.rList
		this.cno=data.cno
		this.cr_content=''
	},
	// 댓글 삭제 
	async replyDelete(id){
		const {data} =await api.delete('/reply/delete_vue/',{
			params:{
				id:id,
				cno:this.cno
			}
		})
		this.reply_list=data.rList
		this.cno=data.cno
	}
	}
})