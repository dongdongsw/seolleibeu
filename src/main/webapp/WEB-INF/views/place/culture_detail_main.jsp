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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
	/* widget styling */
}

.booking-widget .widget-title {
	font-weight: bold;
}

.booking-widget ul {
	list-style: none;
}

.booking-option {
	font-weight: bold;
	min-height: 30px;
}

.quantity-section {
	display: flex;
	align-items: center;
	margin-bottom: -25px;
	margin-left: 65px;
}

.quantity-label {
	margin-right: 10px;
	font-size: 14px;
	font-weight: bold;
}

.quantity-controls {
	display: flex;
	align-items: stretch;
	margin-right: 15px;
}

.quantity-input {
	width: 38px;
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
	background-color: black;
	color: white;
	border: none;
	border-radius: 20px;
	padding: 0 20px;
	height: 32px;
	font-weight: bold;
	font-size: 13px;
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
</style>
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
					<ul class="listnone widget-recent-post">
						<li>
							<div class="option_date booking-option">날짜 선택</div>
						</li>
						<li>
							<div class="option_time booking-option">시간 선택</div>
						</li>
						<li>
							<div class="option_two booking-option">옵션 선택</div>
						</li>
						<li>
							<div id="selected-option-output" class="booking-option" style="margin-bottom: 35px;">선택옵션 출력</div>
							<div class="quantity-section">
								<span class="quantity-label">수량</span>
								<div class="quantity-controls">
									<input type="text" id="qty_val" value="1" readonly="readonly" class="quantity-input">
									<div class="quantity-buttons">
										<button type="button" onclick="changeQ(1)" class="quantity-btn">+</button>
										<button type="button" onclick="changeQ(-1)" class="quantity-btn minus">-</button>
									</div>
								</div>
								<button type="button" class="booking-btn" onclick="location.href='/reserve/reserve_ok'">예매하기</button>
							</div>
						</li>
					</ul>
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