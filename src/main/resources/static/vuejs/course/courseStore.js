const {defineStore} = Pinia

const useCourseStore=defineStore('course_insert', {
	
	state: ()=>({
		place_list: [],
		selected: [],
		pnos: [],
		type: '명소',
		keyword: '',
		title: '',
		content: '',
		is_public: 'Y',
		step_ok: ''
	}),
	
	actions: {
		// 장소 데이터 불러오기
		async dataRecv() {
			const res=await api.get('/course/place_list_vue/', {
				params: {
					type:this.type,
					keyword:this.keyword
				}
			})
			console.log(res.data)
			console.log(this.is_public)
			this.place_list=res.data
		},
		
		// 코스 생성
		async courseInsert({titleRef, contentRef}) {
			if(this.title==='') {
				titleRef?.focus()
				return
			}
			if(this.content==='') {
				contentRef?.focus()
				return
			}
			
			const res=await api.post('/course/insert_vue/', {
				pnos: this.pnos.join(','),
				title: this.title,
				content: this.content,
				is_public: this.is_public
			})
			
			if(res.data.msg==='yes') {
				location.href="/course/list"
			} else {
				alert("코스 생성에 실패하였습니다.")
			}
		},
		
		// 장소 선택
		select(pno) {
			const p=this.place_list.find(vo => vo.pno === pno)
			this.selected.push(p)
			this.pnos.push(p.pno)
			
			const idx=this.place_list.indexOf(p)
			this.place_list.splice(idx, 1)
			
			console.log(this.pnos)
		},
		
		// 선택된 장소에서 제거
		remove(pno) {
			const p=this.selected.find(vo => vo.pno === pno)
			this.place_list.push(p)
			
			const pnoidx=this.pnos.indexOf(pno)
			this.pnos.splice(pnoidx, 1)
					
			const pidx=this.selected.indexOf(p)
			this.selected.splice(pidx, 1)
			
			console.log(this.pnos)
		},
		
		// 검색
		find(keywordRef) {
			if(this.keyword==='') {
				keywordRef?.focus()
				return
			}
			this.type=''
			this.dataRecv()
		},
		
		// 카테고리 버튼
		cateButton(type) {
			this.type=type
			this.keyword=''
			this.dataRecv()
		},
		
		// 장소 선택을 2개 이상해야 step2 이동 가능
		step() {
			if(this.pnos.length<2) {
				alert('장소를 2개 이상 선택해주세요')
				return
			}
			this.step_ok='ok'
		}
	}
})