<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/course.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/place/restaurant_detail.css">
<link rel="stylesheet" href="/css/review/review.css">
<link rel="stylesheet" href="/css/culture_detail.css">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
</head>
<body>
	<div class="page-header-culture">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">문화/체험</h2>
						<p>상세보기</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container main-container" id="culture_detail">
		<div class="row">
			<div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 culture-detail-section">
				<div class="culture-detail-block">
					<img :src="store.pvo.thumbnail" class="thumbnail culture-thumbnail">
					<span class="meta-author">{{store.pvo.type}} / 문화 & 체험</span>
					<h2 style="font-weight: bold;">{{store.pvo.name}}</h2>
					<div class="culture-info">
						<ul>
							<li>
								<span class="label">주소</span>
								<span class="value">{{store.pvo.addr ? store.pvo.addr : '-'}}</span>
							</li>
							<li>
								<span class="label">교통정보</span>
								<span class="value">{{store.pvo.parking ? store.pvo.parking : '-'}}</span>
							</li>
							<li>
								<span class="label">관람연령</span>
								<span class="value">{{store.pvo.rating ? store.pvo.rating : '-'}}</span>
							</li>
							<li>
								<span class="label">소요시간</span>
								<span class="value">{{store.pvo.runtime ? store.pvo.runtime : '-'}}</span>
							</li>
							<li>
								<span class="label">업체명</span>
								<span class="value">{{store.pvo.company ? store.pvo.company : '-'}}</span>
							</li>
							<li>
								<span class="label">연락처</span>
								<span class="value">{{store.pvo.phone ? store.pvo.phone : '-'}}</span>
							</li>
							<li>
								<span class="label">영업시간</span>
								<span class="value">{{store.pvo.hours ? store.pvo.hours : '-'}}</span>
							</li>
							<li>
								<span class="label">장소 등록일</span>
								<span class="value">{{store.pvo.createday ? store.pvo.createday : '-'}}</span>
							</li>
							<li style="margin-top: -10px;">
								<span class="culture-notice">
								- 예매 후 1시간 이내로 미 결제시 예매가 자동 취소되는 점 양해 부탁드립니다<br>
								- 이용 전 예약변경을 희망하실 경우 업체로 유선 연락 부탁드립니다<br>
								- 상영시에 음식물 섭취는 제한 되오니 참고 후 이용 부탁드립니다
								</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
				<div class="widget widget-recent-post booking-widget">
					<h3 class="widget-title"><b>티켓 예매</b></h3>
					<!-- 날짜 선택 -->
					<div class="booking-accordion-item">
						<div class="accordion-header" onclick="toggleAccordion('date')">
							<span class="accordion-title">날짜 선택</span>
							<div style="display: flex; align-items: center;">
								<span class="accordion-value">날짜를 선택하세요</span>
								<span class="accordion-icon">▼</span>
							</div>
						</div>
						<div class="accordion-content" id="accordion-date">
							<div class="accordion-body">
								<div class="calendar-container" id="calendar">
									
								</div>
							</div>
						</div>
					</div>
					
					<!-- 시간 선택 -->
					<div class="booking-accordion-item">
						<div class="accordion-header" onclick="toggleAccordion('time')">
							<span class="accordion-title">시간 선택</span>
							<div style="display: flex; align-items: center;">
								<span class="accordion-value">시간을 선택하세요</span>
								<span class="accordion-icon">▼</span>
							</div>
						</div>
						<div class="accordion-content" id="accordion-time">
							<div class="accordion-body">
								<div class="time-grid">
									<button class="time-btn">10:00</button>
									<button class="time-btn">11:00</button>
									<button class="time-btn">12:00</button>
									<button class="time-btn">13:00</button>
									<button class="time-btn">14:00</button>
									<button class="time-btn">15:00</button>
									<button class="time-btn">16:00</button>
									<button class="time-btn">17:00</button>
									<button class="time-btn">18:00</button>
									<button class="time-btn">19:00</button>
									<button class="time-btn">20:00</button>
									<button class="time-btn">21:00</button>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 옵션 선택 아코디언 -->
					<div class="booking-accordion-item">
						<div class="accordion-header" onclick="toggleAccordion('option')">
							<span class="accordion-title">옵션 선택</span>
							<div style="display: flex; align-items: center;">
								<span class="accordion-value">옵션을 선택하세요</span>
								<span class="accordion-icon">▼</span>
							</div>
						</div>
						<div class="accordion-content" id="accordion-option">
							<div class="accordion-body">
								<div class="option-grid">
									<button class="option-btn">
										대인<br><small>30,000원</small>
									</button>
									<button class="option-btn">
										소인<br><small>25,000원</small>
									</button>
								</div>
							</div>
						</div>
					</div>
					
					<div class="booking-footer">
						<div class="quantity-section">
							<span class="quantity-label">수량</span>
							<div class="quantity-controls">
								<input type="text" value="1" class="quantity-input" readonly>
								<div class="quantity-buttons">
									<button type="button" class="quantity-btn plus" onclick="changeQ(1)">+</button>
									<button type="button" class="quantity-btn minus" onclick="changeQ(-1)">-</button>
								</div>
							</div>
						</div>
						<button type="button" class="booking-btn" onclick="location.href='/reserve/reserve_ok'">예매하기</button>
					</div>
				</div>
			</div>
		</div>
		<div class="stats-section">
			<table class="table stats-table">
				<tbody>
					<tr>
						<td>
		    				<a @click.prevent="favoriteStore.handleFavoriteClick(store.pvo.pno)">
		    					<i :class="favoriteStore.checkFavorite >= 1?'fa fa-star':'fa fa-star-o'" class="stats-icon"></i>
		    				</a>
		    			</td>
						<td>{{favoriteStore.favoriteCount}}</td>
						<td>
		    				<a @click.prevent="likeStore.handleLikeClick(store.pvo.pno)">
		    					<i :class="likeStore.likeCheck >= 1?'fa fa-thumbs-up':'fa fa-thumbs-o-up'" class="stats-icon"></i>
	    					</a>
						</td>
						<td>{{likeStore.likeCount}}</td>
						<td><i class="fa fa-eye stats-icon"></i></td>
						<td>{{store.pvo.hit}}</td>
					</tr>
				</tbody>	    
			</table>
		</div>
		<div class="text-right">
			<button class="btn btn-sm btn-list" onclick="javascript:history.back()">목록</button>
		</div>
		<hr>
		<div class="container">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#menu1">상세보기</a></li>
				<li><a data-toggle="tab" href="#menu2">리뷰</a></li>
			</ul>
			<div class="tab-content">
				<div id="menu1" class="tab-pane fade in active">
					<jsp:include page="${detailPage}"></jsp:include>
			    </div>
			    <div id="menu2" class="tab-pane fade">
					<jsp:include page="${reviewPage}"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<script>
		function toggleAccordion(section) {
			const content = document.getElementById('accordion-' + section)
			const allContents = document.querySelectorAll('.accordion-content')
			
			allContents.forEach(item => {
				if(item.id !== 'accordion-' + section) {
					item.style.maxHeight = '0'
				}
			})
			
			if(content.style.maxHeight && content.style.maxHeight !== '0px') {
				content.style.maxHeight = '0'
			} else {
				content.style.maxHeight = '400px'
			}
		}
	</script>
	<script src="/vuejs/axios.js"></script>
    <script src="/vuejs/place/cultureStore.js"></script>
    <script src="/vuejs/favorite/favoriteStore.js"></script>
	<script src="/vuejs/like/likeStore.js"></script>
    <script src="/vuejs/review/place_review.js"></script>
    <script>
      const { createApp, onMounted } = Vue
      const { createPinia } = Pinia
      
      const cultureDetailApp = createApp({
    	  setup() {
    		  const store = useCultureStore()
    		  
    		  const params = new URLSearchParams(location.search)
    		  const pno = params.get('pno')
    		  
    		  const rstore = useReviewStore()
    		  
    		  /* 즐겨찾기 */
    		  const favoriteStore = useFavoriteStore()
    		  
    		  /* 좋아요 */
    		  const likeStore = useLikeStore()
    		  
    		  onMounted(()=> {
    			  store.cultureDetailData(pno)
    			  
    			  /* 즐겨찾기 */
    			  favoriteStore.favoriteDetailCheck(pno)
    			  
    			  /* 좋아요 */
				  likeStore.likeUserCheck(pno)
    			  
    			  rstore.pno=pno
    			  rstore.curpage=1
    			  rstore.reviewListData()
    			  
    			  /* 달력 */
    			  const calendar = new FullCalendar.Calendar(
    					  document.getElementById('calendar'), {
    						  initialView: 'dayGridMonth',
    						  height: 220,
    						  aspectRatio: 1.35,
    						  headerToolbar: {
    							  left: 'prev',
    							  center: 'title',
    							  right: 'next'
    						  },
    						  validRange: {
    							  start: new Date().toISOString().split('T')[0],
    							  end: '2026-04-01'
    						  },
    						  initialDate: new Date(),
    						  dayCellContent: function(arg) {
    							  return arg.dayNumberText.replace('일', '')
    						  },
    						  locale: 'ko'
    					  }
    			  )
    			  calendar.render()
    		  })
    		  
    		  return {
    			  store,
    			  rstore,
    			  
    			  /* 즐겨찾기 */
				  favoriteStore,
				  
				  /* 좋아요 */
				  likeStore
    		  }
    	  }
      })
      cultureDetailApp.use(createPinia())
      cultureDetailApp.mount('#culture_detail')
    </script>
    
    <script src="/vuejs/review/r_create.js"></script>
</body>
</html>