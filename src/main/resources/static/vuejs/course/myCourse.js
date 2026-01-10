const {createApp, onMounted, ref} = Vue
const {createPinia} = Pinia
const detailApp=createApp({
  	 setup(){
  		 const store=useMyCourseStore()
	   		 
		 onMounted(()=>{
 			 store.myCourseData()
  		 })
	   		 
   		 return {
   			 store
   		 }
   	 }
})
detailApp.use(createPinia())
detailApp.mount('#my_course')