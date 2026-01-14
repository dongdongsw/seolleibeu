//const {defineStore} = Pinia
const useReplyStore=Pinia.defineStore('reply',{
	state:()=>({
		list:[],
		curpage:1,
		totalpage:0,
		startPage:0,
		endPage:0,
		cr_content:''
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
					page:this.curpage,
					cr_content:this.cr_content
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
			this.cr_content=data.cr_content
		},
		movePage(page){
			this.curpage=page
			this.replyMypage()
		},
		find(cr_contentRef){
			if(this.cr_content==='')
			{
				cr_contentRef?.focus()
				return
			}
			this.curpage=1
			this.replyMypage()
		}
	}
})