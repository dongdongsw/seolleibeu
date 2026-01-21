const {defineStore} = Pinia
const initialState=()=>({
	notice_list:[],
	n_title:'',
	n_content:'',
	updateMsg:{},
	detail: {},
	curpage:1,
	totalpage:0,
	startPage:0,
	endPage:0,
	n_id:0
})
const useNoticeStore=defineStore('notice',{
	state:initialState,
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
		async noticeListData(){
			const {data} = await api.get('/notice/list_vue/',{
				params:{
					page:this.curpage
				}
			})
			this.setPageData(data)
		},
		setPageData(data){
			this.notice_list=data.list
			this.curpage=data.curpage
			this.totalpage=data.totalpage
			this.startPage=data.startPage
			this.endPage=data.endPage
		},
		movePage(page){
			this.curpage=page
			this.noticeListData()
		},
		async noticeDetailData(n_id) {
		    const {data} = await api.get('/notice/detail_vue/', {
		      params: {
				n_id
			}
		})
		    this.detail = data
		},
		async noticeUpdate(n_id){
			await api.put('/notice/update_vue/',{
				n_id: this.detail.n_id,
				n_title: this.detail.n_title,
				n_content: this.detail.n_content
			})
			this.noticeListData()
		},
		async noticeInsert(){
			if(!this.n_content.trim()) return
			await api.post('/notice/insert_vue/',{
				n_title:this.n_title,
				n_content:this.n_content
			})
			this.n_content=''
			this.noticeListData()
		},
		async noticeDelete(n_id){
			await api.delete('/notice/delete_vue/',{
				params:{
					n_id
				}
			})
			this.noticeListData()
		}
	}
})