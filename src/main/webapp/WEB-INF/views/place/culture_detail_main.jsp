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
<style type="text/css">
.page-header {
	margin: 0px auto;
}

.main-container {
	padding-top: 100px;
}

.culture-detail-section {
	margin-top: 0px;
	position: relative;
}

.culture-detail-block {
	margin-bottom: 40px;
}

.culture-thumbnail {
	float: left;
	margin: 0px 20px 0px 0px;
	width: 270px;
	height: 100%;
}

.culture-info ul {
	list-style: none;
	padding: 0;
}

.culture-info li {
	font-size: 16px;
	margin-bottom: 8px;
	display: flex;
	align-items: center;
}

.culture-info .label {
	display: inline-block;
	width: 70px;
	padding: 4px 0px;
	font-weight: bold;
	color: black;
	flex-shrink: 0;
}

.culture-info .value {
	margin-left: 5px;
	font-size: 14px;
	flex: 1;
	word-break: keep-all;
}

.culture-notice {
	color: #800020;
	font-size: 14px;
	margin: 10px;
	padding: 0;
}

.booking-widget {
	background-color: #f3f0eb;
	padding: 20px;
	border-radius: 8px;
}

.booking-widget .widget-title {
	font-weight: bold;
	margin-botton: 20px;
}

.booking-accordion-item {
	margin-bottom: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	overflow: hidden;
}

.accordion-header {
	background-color: #f3f0eb;
	padding: 12px 15px;
	cursor: pointer;
	display: flex;
	justify-content: space-between;
	align-items: center;
	transition: background-color 0.3s;
}

.accordion-header:hover {
	background-color: #f5f5f5;
}

.accordion-title {
	font-weight: bold;
	font-size: 14px;
	color: #333;
}

.accordion-value {
	font-size: 14px;
	color: #666;
	margin-right: 10px;
}

.accordion-icon {
	font-size: 12px;
}

.accordion-content {
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.3s ease-out;
	background-color: white;
	border-top: 1px solid #ddd;
}

.accordion-body {
	padding: 15px;
}

#calendar {
	font-size: 11px;
}

.calendar-container {
    max-width: 100%;
    max-height: 320px;
    overflow: hidden;
}

#calendar .fc-daygrid-day {
    height: 26px !important;
    padding: 0 !important;
}

#calendar .fc-daygrid-day-frame {
	height: 22px !important;
    min-height: 22px !important;
}

#calendar .fc-col-header-cell {
    padding: 2px 0 !important;
}

#calendar .fc-daygrid-day-top {
    display: flex;
    justify-content: center;
}

#calendar .fc-daygrid-day-number {
    float: none !important;
}

#calendar table {
    line-height: 1 !important;
}

#calendar thead {
    height: 25px !important;
}

#calendar tbody tr {
    height: 22px !important;
}

#calendar .fc {
    font-size: 12px;
}

#calendar .fc-toolbar {
	margin-bottom: 5px !important;
}

#calendar .fc-toolbar-title {
    font-size: 16px !important;
}

.time-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 8px;
}

.time-btn {
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	background-color: white;
	cursor: pointer;
	font-size: 13px;
	transition: all 0.2s;
}

.option-grid {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 8px;
}

.option-btn {
	padding: 12px;
	border: 1px solid #ddd;
	border-radius: 4px;
	background-color: white;
	cursor: pointer;
	font-size: 13px;
	transition: all 0.2s;
	text-align: center;
}

.booking-footer {
	margin-top: 20px;
	padding-top: 15px;
	border-top: 1px solid #ddd;
}

.quantity-section {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 15px;
}

.quantity-label {
	font-size: 14px;
	font-weight: bold;
}

.quantity-controls {
	display: flex;
	align-items: stretch;
}

.quantity-input {
	width: 50px;
	height: 32px;
	text-align: center;
	border: 1px solid #ccc;
	border-right: none;
	padding: 0;
	margin: 0;
	font-size: 15px;
	background-color: #fff;
	outline: none;
}

.quantity-buttons {
	display: flex;
	flex-direction: column;
	width: 24px;
}

.quantity-btn {
	width: 100%;
	height: 16px;
	line-height: 14px;
	font-size: 10px;
	padding: 0;
	border: 1px solid #ccc;
	background: black;
	cursor: pointer;
	display: block;
	outline: none;
	color: white;
}

.quantity-btn.minus {
	border-top: none;
}

.booking-btn {
	width: 100%;
	background-color: black;
	color: white;
	border: none;
	border-radius: 20px;
	padding: 12px 20px;
	font-weight: bold;
	font-size: 14px;
	cursor: pointer;
	outline: none;
}

.stats-section {
	position: absolute;
	left: 66%;
}

.stats-table {
	border: none;
}

.stats-table td {
	border: none !important;
}

.stats-table tbody tr {
	border: none !important;
}

.stats-icon {
	padding-top: 1px;
	font-size: 22px;
	color: black;
}

.btn-list {
	background-color: black;
	color: white;
}

.text-right {
	margin-top: 5px;
}

#calendar .fc-scrollgrid {
    border: none !important;
}

#calendar .fc-daygrid-body {
    border: none !important;
}

#calendar .fc-scrollgrid-sync-table tbody tr {
    height: 28px !important;
}

#calendar .fc-daygrid-day-events {
    margin: 0 !important;
    min-height: 0 !important;
}

#calendar .fc-daygrid-day-bg {
    min-height: 28px !important;
}
</style>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
</head>
<body>
	<div class="page-header">
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
									<button class="time-btn">성현 해줘</button>
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
										또는<br><small>동현씨가..</small>
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
    						  aspectRatio: 1.2,
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