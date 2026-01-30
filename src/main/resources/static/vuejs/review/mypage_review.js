const {defineStore}=Pinia

const useReviewStore=defineStore('myreview_list',{
	state:()=>({
		list:[],
		curpage:1,
		startPage:0,
		totalpage:0,
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
					page:this.curpage
				}
			})
			this.list=res.data.list
			this.curpage=res.data.curpage
			this.startPage=res.data.startPage
			this.endPage=res.data.endPage
			this.totalpage=res.data.totalpage
		},
		async reviewUpdate(){
			if(!this.r_content.trim()){
		        alert("리뷰 내용을 입력해주세요")
		        return
		    }
			const res=await api.post('/review_update_vue/',{
				rno:this.detail.rno,
				r_content:this.r_content
			})
		},
		async reviewDelete(rno){
			const ok = confirm('정말로 리뷰를 삭제하시겠습니까?')
	      	if (!ok) 
			{
				alert("리뷰 삭제에 실패하였습니다")
				return
			}
				
			const res=await api.delete('/review_delete_vue/',{
				params:{
					rno
				}
			})
			if(res.data.msg==='yes')
				this.myreviewListData()
		},
		pageChange(page){
			this.curpage=page
			this.myreviewListData()
		}
	}
})