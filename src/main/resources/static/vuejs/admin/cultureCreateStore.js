const { defineStore } = Pinia

const useCultureCreateStore = defineStore('cultureCreate', {
	state: ()=> ({
		pvo: {
			name: '',
			category: '',
			type: '',
			addr: '',
			phone: '',
			company: '',
			hours: '',
			parking: '',
			rating: '',
			runtime: '',
			ticket: '',
			intro: '',
			thumbnail: '',
			imgs: ''
		},
		opt: {
			op_date_start: '',
			op_date_end: '',
			op_time: [],
			op_type: ['', '', ''],
			op_price: ['', '', '']
		}
	}),
	actions: {
		async submit(selectedType, thumbRef, imgsRef) {
			const formData = new FormData()
			
			this.pvo.category = '문화'
			
			for(const k in this.pvo) {
				if(k === 'thumbnail' || k === 'imgs') {
					continue
				}
				formData.append(k, this.pvo[k] ?? '')
			}
			
			if(thumbRef?.files?.length) {
				formData.append('thumbnailFile', thumbRef.files[0])
			}
			
			if(imgsRef?.files?.length) {
				for(const f of imgsRef.files) {
					formData.append('imgFiles', f)
				}
			}
			
			if(selectedType === 'culture') {
				formData.append('op_date_start', this.opt.op_date_start || '')
				formData.append('op_date_end', this.opt.op_date_end || '')
				
				for(const t of this.opt.op_time) {
					formData.append('op_time', t)
				}
				
				for(let i=0;i<3;i++) {
					formData.append('op_type', this.opt.op_type[i] || '')
					formData.append('op_price', this.opt.op_price[i] || '')
				}
			}
			
			const url = (selectedType === 'culture') ? '/admin/culture_create_vue/' : '/admin/attraction_create_vue/' 
			
			return (await api.post(url, formData)).data
		}
	}
})