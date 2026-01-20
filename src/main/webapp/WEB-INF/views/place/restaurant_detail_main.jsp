<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<link href="/css/place/restaurant_detail.css" rel="stylesheet" />
<link rel="stylesheet" href="/css/review/review.css">
<style type="text/css">
.page-header{
  background: linear-gradient(rgba(30, 30, 30, 0.7), rgba(30, 30, 30, 0.7)),  url(/images/asdf.jpg) no-repeat center;
  background-size: cover;
}
</style>
</head>
<body>
	<div id="restaurant_detail">
		<div class="page-header" style="margin: 0px auto;">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="page-caption">
							<h2 class="page-title">음식점</h2>
							<p>상세페이지</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="content">
			<div class="container">
				<div class="row">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">

						<div class="author-post">

							<!-- author post -->
							<div class="row">
								<div class="col-lg-4 col-md-3 col-sm-3 col-xs-12"
									style="margin-top: 27px;">
									<div class="author-img">
										<img :src="store.pvo.thumbnail" class="" alt="">
									</div>
								</div>
								<div class="col-lg-8 col-md-9 col-sm-9 col-xs-12">

									<div class="author-header">
										<div class="author-bio">
											<h2 class="author-title">{{store.pvo.name}}</h2>

											<div class="meta">
												<span class="meta-author">{{store.pvo.type}} /
													{{store.pvo.category}}</span>
											</div>
										</div>

									</div>
									<br>
									<div class="address-wrap">
										<div class="author-bio" style="width: 100%; display: flex;">
											<h5 class="project-title">주소</h5>
											<span class="project-content">{{store.pvo.addr}}</span>
										</div>
										<div class="author-bio" style="width: 100%; display: flex;">
											<h5 class="project-title">전화</h5>
											<span class="project-content">{{store.pvo.phone}}</span>
										</div>
										<div class="author-bio" style="width: 100%; display: flex;">
											<h5 class="project-title">좌석</h5>
											<span class="project-content">{{store.pvo.seat}}</span>
										</div>
										<div class="author-bio" style="width: 100%; display: flex;">
											<h5 class="project-title">주차</h5>
											<span class="project-content">{{store.pvo.parking}}</span>
										</div>
										<div class="author-bio" style="width: 100%; display: flex;">
											<h5 class="project-title">운영시간</h5>
											<span class="project-content">{{store.pvo.hours}}</span>
										</div>
										<div class="author-bio" style="width: 100%; display: flex;">
											<h5 class="project-title">장소 생성 날짜</h5>
											<span class="project-content">{{store.pvo.dbday}}</span>
										</div>
									</div>
									<br> <br>
									<p>{{store.pvo.intro}}</p>

								</div>
								<div style="position: absolute; left: 80%; top: 1%;">
									<table class="table">
										<tbody>
											<tr>
												<td style="border: none;">
													<a @click.prevent="favoriteStore.handleFavoriteClick(store.pvo.pno)">
														<i :class="favoriteStore.checkFavorite >= 1?'fa fa-star':'fa fa-star-o'" style="padding-top: 1px; font-size: 22px; color: black;"></i>
													</a>
												</td>
												<td style="border: none;">{{favoriteStore.favoriteCount}}</td>
												<td style="border: none;">
													<a @click.prevent="likeStore.handleLikeClick(store.pvo.pno)">
														<i :class="likeStore.likeCheck >= 1?'fa fa-thumbs-up':'fa fa-thumbs-o-up'" style="font-size: 22px; color: black;"></i>
													</a>
												</td>
												<td style="border: none;">{{likeStore.likeCount}}</td>
												<td style="border: none;"><i class="fa fa-eye" style="padding-top: 1px; font-size: 22px; color: black;"></i></td>
												<td style="border: none;">{{store.pvo.hit}}</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
							<hr>
						</div>

						<div class="container">
							<ul class="nav nav-tabs">
								<li class="active"><a data-toggle="tab" href="#menu1">상세보기</a></li>
								<li><a data-toggle="tab" href="#menu2">리뷰</a></li>
							</ul>

							<div class="tab-content">

								<div id="menu1" class="tab-pane fade in active">
									<jsp:include page="${detailPage }"></jsp:include>
								</div>
								<div id="menu2" class="tab-pane fade">
									<jsp:include page="${reviewPage}"></jsp:include>
								</div>
							</div>
						</div>

					</div>
					</div>
					</div>
					</div>
					
	<script src="/vuejs/axios.js"></script>
	<script src="/vuejs/place/restaurantStore.js"></script>
    <script src="/vuejs/review/place_review.js"></script>
	<script src="/vuejs/favorite/favoriteStore.js"></script>
	<script src="/vuejs/like/likeStore.js"></script>
	<script>
		const {createApp, onMounted} = Vue
		const {createPinia} = Pinia
		
		const restaurantDetailApp = createApp({
			setup(){
				const store = useRestaurantStore()
				const favoriteStore = useFavoriteStore()
				const likeStore = useLikeStore()
				const rstore = useReviewStore()
				
				const params = new URLSearchParams(location.search)
				const pno = params.get('pno')
				
				
				onMounted(()=>{
					store.restaurantDetailData(pno)
					favoriteStore.favoriteDetailCheck(pno)
					likeStore.likeUserCheck(pno)
					
					/* 리뷰 */
    			 	rstore.pno=pno
    			  	rstore.curpage=1
    			  	rstore.reviewListData()
				})
				
				return{
					store,
					favoriteStore,
					likeStore,

    			  	rstore
				}
			}
		})
		restaurantDetailApp.use(createPinia())
		restaurantDetailApp.mount("#restaurant_detail")
	</script>
	
	<script src="/vuejs/review/r_create.js"></script>
</body>
</html>