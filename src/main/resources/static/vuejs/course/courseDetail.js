const detailApp=createApp({
    	 setup(){
    		 const store=useCourseDetailStore()
    		 const dStore=useMyCourseStore()
    		 
    		 const params=new URLSearchParams(location.search)
    		 const cno=params.get('cno')
    		 
    		 onMounted(()=>{
    			 store.firstPlace(cno)
    		 })
    		 
    		 return {
    			 store,
    			 dStore
    		 }
    	 }
     })
     detailApp.use(createPinia())
     detailApp.mount('#course_detail')