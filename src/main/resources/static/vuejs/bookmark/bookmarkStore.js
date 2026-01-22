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
		async toggleBookmark(){
		    // 로그인 경고 메세지
		    if (!this.uno) {
		      alert('로그인 후 이용해주세요')
		      return
		    }

		    // 북마크 삭제
		    if (this.bookmarked) {
		      await api.delete('/bookmark/delete_vue/', {
		        params:{
		          uno: this.uno,
		          cno: this.cno
		        }
		      })
		      this.bookmarked = false
			  alert('북마크가 삭제되었습니다')
		      return
		    }

		    // 북마크 추가
		    await api.post('/bookmark/insert_vue/', {
		      uno: this.uno,
		      cno: this.cno
		    })

		    this.bookmarked = true
		    alert('북마크에 추가되었습니다')
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