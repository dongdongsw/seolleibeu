//const {defineStore} = Pinia
const useBookmarkStore=Pinia.defineStore('bookmark',{
	state:()=>({
		list:[],
		curpage:1,
		totalpage:0,
		startPage:0,
		endPage:0
	}),
	actions:{
		async bookmarkListData(){
			const res =await axios.get('/mypage/my_bookmark_vue/',{
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
			this.bookmarkListData()
		}
	}
})