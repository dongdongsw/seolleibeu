const {defineStore}=Pinia

const useReviewStore=defineStore('myreview_list',{
	state:()=>({
		list:[],
		curpage:1,
		startPage:0,
		totalpage:0,
		endPage:0,
		count:0,
		uno:1
	}),
	getters:{
		range:(state)=>{
			const arr=[]
			for(let i=state.startPage;i<=state.endPage;i++)
			{
				arr.push(i)
			}
			return arr
		},
		starCount:()=>(score)=>{
			if (score==null){
				return {full:0,half:false,empty:5}
			}
			const full=Math.floor(score)
			const half=score%1>=0.5
			const empty=5-Math.ceil(score)
			
			return{full,half,empty}
		}
	},
	actions:{
		async myreviewListData(){
			const res=await api.get('/mypage/my_review_vue/',{
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
			console.log(res.data.list)
		},
		pageChange(page){
			this.curpage=page
			this.myreviewListData()
		}
	}
})