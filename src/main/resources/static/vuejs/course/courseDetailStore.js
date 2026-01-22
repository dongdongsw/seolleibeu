const useCourseDetailStore=defineStore('course_detail', {
	
	state: ()=>({
		place: {},
		addressList: [],
		pnos: [],
		pno: 0,
		cno: 0,
		url_cate: '',
		selected: true,
		category: '',
		type: ''
	}),
	
	actions: {
		
		// 한 장소의 상세정보 가져오기
		async placeDetailData() {
			const res=await api.get('/course/place_vue/', {
				params: {
					pno: this.pno
				}
			})
			this.place=res.data
			this.category=res.data.category
			this.type=res.data.type
			this.urlCate()
		},
		
		// 한 장소의 상세정보 가져오기 (데이터만 return)
		async PlaceDetail(pno) {
		  const res = await api.get('/course/place_vue/', {
		    params: { pno }
		  })
		  return res.data
		},
		
		// 장소 리스트 불러오기
		async placeList(cno) {
					
		this.cno=cno
			const res=await api.get('/course/course_vue/', {
				params: {
					cno: this.cno
				}
			})
			this.pnos=res.data.pnosList
			await this.getPlaceListData()
			this.map()
		},
		
		// 초기값을 위한 첫번째 장소 가져오기
		async firstPlace(cno) {
			this.cno=cno
			const res=await api.get("/course/first_place_vue/", {
				params: {
					cno: this.cno
				}
			})
			
			this.pno=res.data
			await this.placeDetailData()
			this.placeList(this.cno)
			
		},
		
		// 지도에 넣을 addr, label만들기
		async getPlaceListData() {

		  for (const pno of this.pnos) {
		    const data = await this.PlaceDetail(pno)
		    if (!data) continue

		    this.addressList.push({
		      addr: data.addr,
		      label: data.name
		    })
		  }
		},
		
		// 장소 선택
		placeData(pno) {
			this.pno=pno
			this.placeDetailData()
		},
		
		// 바로가기 버튼		
		urlCate() {
			if(this.category === '식당') {
				this.url_cate='restaurant'
			} else if(this.type === '연극/뮤지컬' || this.type === '전시' 
									|| this.type === '액티비티') {
				this.url_cate='culture'
			} else (
				this.url_cate='attraction'
			)
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
		  	this.place.forEach((s, index) => {
		    this.addressList.push({
		      	addr: s.addr,
		      	label: s.name
			   })
	      	})
	  	}
	}
})