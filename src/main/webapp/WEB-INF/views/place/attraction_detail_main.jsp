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

.attraction-detail-block {
	margin-bottom: 40px;
}

.attraction-thumbnail {
	float: left;
	margin: 0px 30px 0px 0px;
	width: 300px;
	height: 280px;
}

.attraction-info ul {
	list-style: none;
	padding: 0;
}

.attraction-info li {
	font-size: 16px;
	margin-bottom: 10px;
	display: flex;
	align-items: center;
}

.attraction-info .label {
	display: inline-block;
	width: 60px;
	padding: 4px 0px;
	font-weight: bold;
	color: black;
	flex-shrink: 0;
}

.attraction-info .value {
	margin-left: 12px;
	font-size: 14px;
	flex: 1;
	word-break: keep-all;
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
						<h2 class="page-title">관광명소</h2>
						<p>상세보기</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container main-container" id="attraction_detail">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="attraction-detail-block">
					<img :src="store.pvo.thumbnail" class="thumbnail attraction-thumbnail">
					<span class="meta-author">{{store.pvo.type}} / 관광명소 </span> 
					<h2 style="font-weight: bold;">{{store.pvo.name}}</h2>
					<div class="attraction-info">
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
								<span class="label">운영시간</span>
								<span class="value">{{store.pvo.hours ? store.pvo.hours : '-'}}</span>
							</li>
							<li>
								<span class="label">가격정보</span>
								<span class="value">{{store.pvo.ticket ? store.pvo.ticket : '-'}}</span>
							</li>
							<li>
								<span class="label">문의전화</span>
								<span class="value">{{store.pvo.phone ? store.pvo.phone : '-'}}</span>
							</li>
							<li>
								<span class="label">장소 등록일</span>
								<span class="value">{{store.pvo.createday ? store.pvo.createday : '-'}}</span>
							</li>
						</ul>
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
	<script src="/vuejs/axios.js"></script>
    <script src="/vuejs/place/attractionStore.js"></script>
    <script src="/vuejs/review/place_review.js"></script>
    <script src="/vuejs/favorite/favoriteStore.js"></script>
	<script src="/vuejs/like/likeStore.js"></script>
    <script>
      const { createApp, onMounted, ref } = Vue
      const { createPinia } = Pinia
      
      const attractionDetailApp = createApp({
    	  setup() {
    		  const store = useAttractionStore()
    		  const params = new URLSearchParams(location.search)
    		  const pno = params.get('pno')
    		  const selectedIndex = ref(0)
    		  
			  /* 리뷰 */
    		  const rstore = useReviewStore()
    		  
    		  /* 즐겨찾기 */
			  const favoriteStore = useFavoriteStore()
    		  
			  /* 좋아요 */
    		  const likeStore = useLikeStore()

    		  onMounted(()=> {
    			  store.attractionDetailData(pno)
    			  
    			  /* 즐겨찾기 */
    			  favoriteStore.favoriteDetailCheck(pno)
    			  
    			  /* 좋아요 */
				  likeStore.likeUserCheck(pno)
    			  
    			  /* 리뷰 */
    			  rstore.pno=pno
    			  rstore.curpage=1
    			  rstore.reviewListData()
    		  })
    		  
    		  return {
    			  store,
    			  selectedIndex,
    			  rstore,
    			  
    			  /* 즐겨찾기 */
				  favoriteStore,
				  
				  /* 좋아요 */
				  likeStore
    		  }
    	  }
      })
      attractionDetailApp.use(createPinia())
      attractionDetailApp.mount('#attraction_detail')
    </script>
    
    <script src="/vuejs/review/r_create.js"></script>
</body>
</html>