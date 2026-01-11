<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>북마크</title>
<meta name="referrer" content="no-referrer">
<link href="/css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Raleway:300,400,600,600i,700"
	rel="stylesheet">
<link href="/css/font-awesome.min.css" rel="stylesheet">
<link href="/css/style.css" rel="stylesheet">
</head>

<body>

	<div class="content auth-wrapper" style="margin-top: -17px;">
		<div class="container" id="bookmark_list">
			<div class="row">
			  <div class="mypage-sizing">
				<div class="col-lg-9 col-md-9 col-sm-12">
					<main class="mypage-main">
						<h2>북마크</h2>

						<div class="info-card" v-for="vo in store.list" :key="vo.cno">
								<div class="post-block my-course-item" style="margin-bottom:0">
									<!-- 왼쪽 이미지 -->
									<div class="course-thumb">
										<img :src="vo.thumbnail" alt="thumbnail">
									</div>

									<!-- 가운데 정보 -->
									<div class="course-info">
										<h4 class="course-title">{{vo.title}}</h4>
										<div class="course-meta">
											북마크 한 날짜 <span class="date">{{vo.bm_pushat}}</span>&nbsp;|
											<span class="comment">댓글 {{vo.replyCount}}</span>&nbsp;|<span class="comment">조회수 {{vo.hit}}</span>
										</div>
									</div>

									<!-- 오른쪽 버튼 -->
									<div class="course-actions">
									 <a href="#" class="btn btn-xs">삭제</a>
									</div>
								</div>
								<hr>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="st-pagination">
									<ul class="pagination">

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
				            <li><a href="../mypage/my_bookmark" class="active">북마크</a></li>
				            <li><a href="../mypage/my_course">나의 코스</a></li>
				            <li><a href="../mypage/my_review">내가 쓴 리뷰</a></li>
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
	<script src="/vuejs/mypage/mypage.js"></script>
    <script type="text/javascript">
     const {createApp,onMounted} = Vue
     const {createPinia} = Pinia
     const bookmarkApp = createApp({
   	  	setup() {
   	    	const store = useBookmarkStore()
   	    		onMounted(() => {
   	      	store.bookmarkListData()
   	    })
   	    return {
   	    		store
   	    	}
   	  }
   	})
   	bookmarkApp.use(createPinia())
   	bookmarkApp.mount('#bookmark_list')
    </script>
</body>
</html>
