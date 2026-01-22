window.createPinia ??= Pinia.createPinia
   		window.createApp ??= Vue.createApp
   		window.onMounted ??= Vue.onMounted
    	const notificationApp = createApp({
    		setup(){
    			const store = useNotificationStore()
    			
    			onMounted(()=>{
    				store.connect(UNO)
    			})
    			
    			return {
    				store
    			}
    		}
    	})
		notificationApp.use(createPinia()) 
    	notificationApp.mount("#notification")