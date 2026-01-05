const {defineStore} = Pinia

const useCourseStore=defineStore('course', {
	
	state: ()=>({
		place_list: [],
		selected: [],
		pnos: []
	}),
	actions: {
		
		async dataRecv() {
			const res = await api.get('/course/place_list_vue/', {
				params: {
					category:this.category,
					keyword:this.keyword
				}
			})
			console.log(res.data)
			this.place_list=res.data
		},
		
		// 장소 선택
		select(pno) {
			const p = this.place_list.find(vo => vo.pno === pno)
			this.selected.push(p)
			this.pnos.push(p.pno)
			
			const idx = this.place_list.indexOf(p)
			this.place_list.splice(idx, 1)
			
			console.log(this.pnos.data)
		},
		
		// 선택된 장소에서 제거
		remove(pno) {
			const p = this.selected.find(vo => vo.pno === pno)
			this.place_list.push(p)
			
			const pnoidx = this.pnos.indexOf(pno)
			this.pnos.splice(pnoidx, 1)
					
			const pidx = this.selected.indexOf(p)
			this.selected.splice(pidx, 1)
			
			console.log(this.pnos.data)
		}
	}
})