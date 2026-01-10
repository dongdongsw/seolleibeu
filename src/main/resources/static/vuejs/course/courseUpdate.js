const {createApp, onMounted, ref} = Vue
		const {createPinia} = Pinia
		const app=createApp({
			setup() {
				const store=useCourseUpdateStore()
				const params=new URLSearchParams(location.search)
    		 	const cno=params.get('cno')
				const keywordRef=ref('')
				const titleRef=ref('')
				const contentRef=ref('')
				
				onMounted(()=>{
					store.courseData(cno)
				})
				
				return {
					store,
					keywordRef,
					titleRef,
					contentRef
				}
			}
		})
		app.use(createPinia())
		app.mount("#course_update")