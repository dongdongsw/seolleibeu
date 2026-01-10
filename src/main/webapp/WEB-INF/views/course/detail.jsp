<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="referrer" content="no-referrer">
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/course.css" rel="stylesheet">
<style type="text/css">
h3 {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}
</style>
<script>
const SESSION_UNO = Number('${sessionScope.uno}')
</script>
</head>
<body>
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">코스 상세</h2>
						<p>
							셀레이브 유저가 직접 추천하는 데이트 코스,<br> 셀렘 가득한 데이트를 즐겨보세요!
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="container">
			<div class="row" id="bookmark_area">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="title text-center">
						<h2>${vo.title }</h2>
					</div>
					<div class="detail-head">
						<div style="margin-left: 10px">
							<i v-if="!bookmarkStore.bookmarked" class="fa fa-bookmark-o"
                          	   aria-hidden="true" @click="bookmarkStore.bookmarkInsert()"></i>
                            <i v-else class="fa fa-bookmark" aria-hidden="true"></i>
						</div>
						<div style="margin-left: 30px">
							<i class="fa fa-eye" aria-hidden="true"></i>&nbsp;${vo.hit }
						</div>
						<div class="head-right">
							<span class="meta-date">${vo.dbday }</span> <span
								class="meta-author">By ${vo.uvo.name }</span>
						</div>
					</div>
					<div class="detail-content">${vo.content }</div>
					<div class="detail-map" id="map"></div>
						
				</div>
			</div>
		</div>
		<div class="container course-place-info" id="course_detail"> 
			<div class="row">
				<div class="mc-wrap" style="margin: 0 15px 0 15px">
					<button class="mc-btn prev" aria-label="prev">‹</button>
					<div class="mc-viewport" id="carousel">
						<c:forEach var="vo" items="${pList }" varStatus="s">
							<div class="mc-card" @click="store.placeData(${vo.pno})">
								<div class="place-index">
									<h2>${s.count}</h2>
								</div>
								<div class="card-img">
									<img src="${vo.thumbnail }">
									<div class="card-text">
										<h3 :class="{ 'selected-place': store.pno === ${vo.pno} }">${vo.name }</h3>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<button class="mc-btn next" aria-label="next">›</button>
				</div>
			</div>
			<div class="row">
				<div class="place-detail">
					<div class="place-detail-title text-center">
					<div>
						<h2>{{store.place.name}}</h2>
					</div>
					</div>
					
					<div class="place-detail-address text-center" style="margin-top:15px">
						<p>{{store.place.category}} | {{store.place.type}}</p>
					</div>
					
					<div class="place-detail-img text-center">
						<img :src="store.place.thumbnail" width="500" height="500">
					</div>
					<div class="text-center" style=" font-size: 12px">	 
					   {{store.place.addr}}
					</div>
					
					<div class="place-detail-btn text-right">
						<a :href="'../place/'+store.url_cate+'/detail?pno='+store.place.pno">
							바로가기</a>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<div class="container">
	
	  	<div class="row" style="margin-bottom: 100px;">
	  	<h2>댓글 ${vo.replycount }</h2>
			<hr style="margin-top: 10px; color:black">
	  		<jsp:include page="reply.jsp"></jsp:include>
	  	</div>
	</div>
	
	<script src="/js/course_detail.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=500f9263086d9dabb5676152c0e94936&libraries=services"></script>
	<script src="/vuejs/course/courseDetailStore.js"></script>
	<script src="/vuejs/course/courseDetail.js"></script>
	<script src="/vuejs/bookmark/bookmarkStore.js"></script>
</body>

</html>