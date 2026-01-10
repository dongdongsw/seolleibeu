const {createApp, onMounted, ref} = Vue
const {createPinia} = Pinia
const app=createApp({
	setup() {
		const store=useCourseStore()
		const keywordRef=ref('')
		const titleRef=ref('')
		const contentRef=ref('')
				
		onMounted(()=>{
			store.dataRecv()
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
app.mount("#course_insert")