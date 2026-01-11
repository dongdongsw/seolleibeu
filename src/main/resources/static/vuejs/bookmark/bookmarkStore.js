//const {defineStore} = Pinia
const bookmarkInitialState=()=>({
	cno:0,
	uno:0,
	sessionId:'',
	bookmarked: false
})
const useBookmarkStore=Pinia.defineStore('bookmark',{
	state:bookmarkInitialState,
	actions:{
		// 북마크 추가
		async bookmarkInsert(){
			if (this.bookmarked) return
			const {data} = await api.post('/bookmark/insert_vue/',{
				cno:this.cno,
				uno:this.uno
			})
			this.cno=data.cno
			this.bookmarked = true
			
			alert('북마크에 추가되었습니다')
		},
		// 북마크 삭제
		async bookmarkDelete(){
			const {data} =await api.delete('/bookmark/delete_vue/',{
				params:{
					uno: this.uno,
					cno: this.cno
				}
			})
			this.cno=data.cno
			this.bookmarked = false
		},
		// 북마크 체크
		async bookmarkCheck(){
		  if (!this.uno || !this.cno) return

		  const { data } = await api.get('/bookmark/bookmarkCheck_vue/', {
		    params: {
		      uno: this.uno,
		      cno: this.cno
		    }
		  })

		  this.bookmarked = Number(data) > 0
		}
	}
})
	const bookmarkApp=createApp({
    	 setup(){
    		 const bookmarkStore=useBookmarkStore();
    		 
    		 const params=new URLSearchParams(location.search)
    		 const cno=params.get('cno')
    		 
    		 onMounted(()=>{
				  bookmarkStore.cno = Number(cno)
				  bookmarkStore.uno = SESSION_UNO || null
				  
				  bookmarkStore.bookmarkCheck()
    		 })
    		 
    		 return {
    			 bookmarkStore
    		 }
    	 }
     })
     bookmarkApp.use(createPinia())
     bookmarkApp.mount('#bookmark_area')