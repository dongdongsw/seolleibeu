const {defineStore} = Pinia

const useCourseStore=defineStore('course_insert', {
	
	state: ()=>({
		place_list: [],
		selected: [],
		addressList: [],
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
					type: this.type,
					keyword: this.keyword
				}
			})
			this.place_list=res.data
			this.map()
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
			
			this.pushAddressList()
			this.map()
		},
		
		// 선택된 장소에서 제거
		remove(pno) {
			const p=this.selected.find(vo => vo.pno === pno)
			this.place_list.push(p)
			
			const pnoidx=this.pnos.indexOf(pno)
			this.pnos.splice(pnoidx, 1)
					
			const pidx=this.selected.indexOf(p)
			this.selected.splice(pidx, 1)
			
			this.pushAddressList()
			this.map()
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
		},
		
		// kakao api지도 (주소변환, 마커, 선 긋기)
		map() {
			// 지도 생성
			var mapContainer = document.getElementById('map');
			var mapOption = {
			  center: new kakao.maps.LatLng(37.55648272333251, 126.91944392463432),
			  level: 3
			};
			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 주소-좌표 변환 객체
			var geocoder = new kakao.maps.services.Geocoder();

			// 주소 -> 좌표 1개 변환을 Promise로 감싸기
			function addressToLatLng(addrObj) {
			  return new Promise((resolve, reject) => {
			    geocoder.addressSearch(addrObj.addr, function(result, status) {
			      if (status === kakao.maps.services.Status.OK && result && result.length) {
			        var latlng = new kakao.maps.LatLng(result[0].y, result[0].x);
			        resolve({ ...addrObj, latlng });
			      } else {
			        reject(new Error('주소 검색 실패: ' + addrObj.addr));
			      }
			    });
			  });
			}

			// 주소들 좌표로 바꾸고 -> 마커/인포 -> 선긋기 -> 화면 맞추기
			Promise.allSettled(this.addressList.map(addressToLatLng))
			  .then((results) => {
			    // 성공한 것만 
			    var points = results
			      .filter(r => r.status === 'fulfilled')
			      .map(r => r.value);

			    if (points.length === 0) {
			      return;
			    }

			    // 마커 + 인포윈도우
			    points.forEach((p, index) => {
			      var marker = new kakao.maps.Marker({
			        map: map,
			        position: p.latlng
			      });

				  var infowindow = new kakao.maps.InfoWindow({
				  		content: `<div style="width:150px;text-align:center;padding:6px 0;
				  		overflow: hidden; text-overflow:ellipsis; white-space: nowrap; font-size: 13px;
				  		font-weight: bold">
				  			${index + 1}. ${p.label}</div>`
				  });
				  infowindow.open(map, marker);
				});

			    // 선(Polyline): 변환된 좌표 순서대로 연결
			    var linePath = points.map(p => p.latlng);

			    var polyline = new kakao.maps.Polyline({
			      path: linePath,
			      strokeWeight: 5,
			      strokeColor: '#f999b7',
			      strokeOpacity: 0.8,
			      strokeStyle: 'solid'
			    });
			    polyline.setMap(map);

			    // 화면을 선/마커 전체가 보이게 맞추기
			    var bounds = new kakao.maps.LatLngBounds();
			    points.forEach(p => bounds.extend(p.latlng));
			    map.setBounds(bounds);
			  });
		},
		
		// addressList에 값 채우기
		pushAddressList() {
			this.addressList=[]
		  	this.selected.forEach((s, index) => {
		    this.addressList.push({
		      	addr: s.addr,
		      	label: s.name
		    })
		  })
		}
	}
})