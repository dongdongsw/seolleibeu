const { defineStore } = Pinia

const useRestaurantCreateStore = defineStore('restaurantCreate', {
	state: ()=> ({
		vo: {
			name: '',
			category: '식당',
			type: '',
			addr: '',
			company: '',
			phone: '',
			hours: '',
			seat: '',
			parking: '',
			intro: '',
			menu: ''
		}
	}),
	actions: {
		async submit(thumbRef, imgsRef) {
			const formData = new FormData()
			
			for(const k in this.vo) {
				formData.append(k, this.vo[k])
			}
			
			if(thumbRef?.files?.length) {
				formData.append('thumbnailFile', thumbRef.files[0])
			}
			
			if(imgsRef?.files?.length) {
				for(const f of imgsRef.files) {
					formData.append('imgFiles', f)
				}
			}
			
			const res = await axios.post('/admin/restaurant_create_vue/', formData, {
				headers: {
					'Content-Type': 'multipart/form-data'
				}
			})
			
			return res.data
		}
	}
})