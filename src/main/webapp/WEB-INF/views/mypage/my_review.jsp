<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="referrer" content="no-referrer">
<title>내가 쓴 리뷰</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<div class="content auth-wrapper" style="margin-top: -17px;">
		<div class="container" id="myreview_list">
			<div class="row">
			  <div class="mypage-sizing">
				<div class="col-lg-9 col-md-9 col-sm-12">
					<main class="mypage-main">
						<div class="search search-row">
						  <h2 class="mypage-title">내가 쓴 리뷰</h2>
						</div>
						<div class="info-card" style="margin: 0; padding: 0">
						   <div v-if="store.list.length" v-for="(vo,index) in store.list" :key="index">
								<div class="post-block my-course-item" style="margin-top: 30px">
									<!-- 왼쪽 이미지 -->
									<div class="course-thumb">
									  <a :href="'/place/'+vo.placeType+'/detail?pno='+vo.pno">
										<img :src="vo.thumbnail ? vo.thumbnail: '/images/noimage.png'" style="width: 80px;height: 80px;">
									  </a>
									</div>
									<!-- 가운데 정보 -->
									<div class="mypage-reply">
										<h4 class="reply-title"><a :href="'/place/'+vo.placeType+'/detail?pno='+vo.pno" style="color: black">{{vo.pname}}</a></h4>
										<p style="margin-bottom: 10px">{{vo.r_content}}</p>
										<div class="course-meta">
											<span v-if="vo.uday"> 수정일 : {{ vo.uday }} </span>
										    <span v-else> 작성일 : {{ vo.dbday }} </span><span style="margin-left: 20px;color: black;font-weight: bolder;">별점 {{vo.r_score}}점</span>
										</div>
									</div>
									<!-- 오른쪽 버튼 -->
									<div class="course-actions">
										<a :href="'/review_update?rno='+vo.rno" class="btn btn-xs">수정</a> 
										<a href="#" class="btn btn-xs" @click="store.reviewDelete(vo.rno)">삭제</a>
									</div>
								</div>
								<hr style="margin:0">
							 </div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="st-pagination">
									<ul class="pagination">
										<li v-if="store.startPage>1"><a href="#" @click="store.pageChange(store.startPage-1)">이전</a></li>
										<li v-for="i in store.range" :class="i==store.curpage?'active':''"><a href="#" @click="store.pageChange(i)">{{i}}</a></li>
										<li v-if="store.endPage<store.totalpage"><a href="#" @click="store.pageChange(store.endPage+1)">다음</a></li>
									</ul>
								</div>
							</div>
						</div>
					</main>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-12" style="margin-top: 80px;">
					<div class="sidenav">
						<ul class="listnone">
							<li><a href="../mypage/my_info">내 정보</a></li>
				            <li><a href="../mypage/my_favorite">즐겨찾기</a></li>
				            <li><a href="../mypage/my_bookmark">북마크</a></li>
				            <li><a href="../mypage/my_course">나의 코스</a></li>
				            <li><a href="../mypage/my_review" class="active">내가 쓴 리뷰</a></li>
				            <li><a href="../mypage/my_reply">내가 쓴 댓글</a></li>
				            <li><a href="../mypage/my_reserve">예매 내역</a></li>
				            <li><a href="../mypage/my_refund">환불 내역</a></li>
				            <li><a href="../mypage/my_pwd_delete">회원 탈퇴</a></li>
						</ul>
					</div>
				</div>
			</div>
			</div>
		</div>
		
	</div>
<script src="/vuejs/axios.js"></script>
<script src="/vuejs/review/mypage_review.js"></script>
<script>
 const {createApp,onMounted}=Vue
 const {createPinia}=Pinia
 const reviewApp=createApp({
	 setup(){
		 const store=useReviewStore()
		 
		 onMounted(()=>{
			 store.myreviewListData()
			 
		 })
		 return {
			 store
		 }
	 }
 })
 reviewApp.use(createPinia())
 reviewApp.mount('#myreview_list')
</script>
</body>
</html>
