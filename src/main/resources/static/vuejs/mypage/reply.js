//const {defineStore} = Pinia
const useReplyStore=Pinia.defineStore('reply',{
	state:()=>({
		list:[],
		curpage:1,
		totalpage:0,
		startPage:0,
		endPage:0
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
		async replyMypage(){
			const res =await axios.get('/mypage/my_reply_vue/',{
				params:{
					page:this.curpage
				}
			})
			this.setPageData(res.data)
		},
		setPageData(data){
			this.list=data.list
			this.curpage=data.curpage
			this.totalpage=data.totalpage
			this.startPage=data.startPage
			this.endPage=data.endPage
		},
		movePage(page){
			this.curpage=page
			this.replyMypage()
		}
	}
})