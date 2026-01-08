const {defineStore}=Pinia

const useFoodStore=defineStore('food_list',{
	state:()=>({
		list:[],
		curpage:1,
		startPage:0,
		totalpage:0,
		endPage:0,
		category:'식당',
		name:'',
		detail:null
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
		async foodListData(){
			const res=await api.get('/admin/food_list_vue/',{
				params:{
					page:this.curpage,
					name:this.name,
					category:this.category
				}
			})
			this.list=res.data.list
			this.curpage=res.data.curpage
			this.startPage=res.data.startPage
			this.totalpage=res.data.totalpage
			this.endPage=res.data.endPage
		},
		async modalDetailData(pno){
			const res=await api.get(`/admin/food_detail_vue/?pno=${pno}`)
			this.detail=res.data
		},
		pageChange(page){
			this.curpage=page
			this.foodListData()
		},
		find(nameRef){
			if(this.name==='')
			{
				nameRef?.focus()
				return
			}
			this.curpage=1
			this.foodListData()
		}
	}
})
