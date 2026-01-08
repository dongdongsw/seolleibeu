const useCourseDetailStore=defineStore('course_detail', {
	
	state: ()=>({
		place: {},
		pno: 0,
		cno: 0,
		url_cate: '',
		selected: true,
		category: '',
		type: ''
	}),
	
	actions: {
		async dataRecv() {
			const res=await api.get('/course/place_vue/', {
				params: {
					pno: this.pno
				}
			})
			this.place=res.data
			this.category=res.data.category
			this.type=res.data.type
			console.log(this.category)
			console.log(this.type)
			this.urlCate()
		},
		
		async firstPlace(cno) {
			this.cno=cno
			const res=await api.get("course/first_place_vue/", {
				params: {
					cno: this.cno
				}
			})
			
			this.pno=res.data
			this.dataRecv()
		},
		
		placeData(pno) {
			this.pno=pno
			this.dataRecv()
		},
		
		urlCate() {
			if(this.category === '식당') {
				this.url_cate='restaurant'
			} else if(this.type === '연극/뮤지컬') {
				this.url_cate='culture'
			} else (
				this.url_cate='attraction'
			)
		}
	}
})