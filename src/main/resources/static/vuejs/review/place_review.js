
const useReviewStore=defineStore('review_list',{
	state:()=>({
		list:[],
		curpage:1,
		startPage:0,
		totalpage:0,
		endPage:0,
		count:0,
		pno:null,
		detail:null,
		r_content:'',
		r_score:0,
		avg_score:0
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
		async reviewListData(){
			const res=await api.get('/place/place_review_vue/',{
				params:{
					page:this.curpage,
					pno:this.pno
				}
			})
			this.list=res.data.list
			this.curpage=res.data.curpage
			this.startPage=res.data.startPage
			this.endPage=res.data.endPage
			this.totalpage=res.data.totalpage
			this.count=res.data.count
			this.avg_score=res.data.avg_score
		},
		async reviewDetailData(rno){
			const res=await api.get(`/review_detail_vue/?rno=${rno}`)
			this.detail=res.data
			console.log(res.data)
		},
		async reviewInsert(){
			if(this.r_score===0){
				alert("별점을 선택해주세요")
				return
			}
			if(!this.r_content.trim()){
				alert("리뷰 내용을 입력해주세요")
				const textarea = document.getElementById('reviewContent')
				if(textarea) textarea.focus()
				return
			}
			console.log(this.r_score)
			const res=await api.post('/review_insert_vue/',{
				pno:this.pno,
				r_content:this.r_content,
				r_score:this.r_score
			})
			this.r_content=''
			this.r_score=0
			this.reviewListData()
			console.log(this.r_content, this.r_score)
		},
		async reviewDelete(rno){
			this.rno=rno
			const ok=confirm('정말로 리뷰를 삭제하시겠습니까?')
			if(!ok) return
			const res=await api.delete('/review_delete_vue/',{
				params:{
					rno
				}
			})
			if(res.data.msg==='yes')
				this.reviewListData()
			else
			{
				alert("리뷰 삭제에 실패하였습니다")
			}
		},
		pageChange(page){
			this.curpage=page
			this.reviewListData()
		}
	}
})